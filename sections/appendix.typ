#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.1": *
#import "@preview/glossy:0.8.0": theme-compact
#import "@preview/glossy:0.8.0": *
#import "../glossary.typ": dsaGlossary

#show: init-glossary.with(dsaGlossary)

== Lambda Function

```python
import requests
import datetime
import boto3
import json

BASE_URL = "https://lumendatabase.org/notices/search"
S3_BUCKET = "lumen-gmaps"

def to_unix_ms_range_for_day(date_str):
    d = datetime.datetime.strptime(date_str, "%Y-%m-%d").replace(tzinfo=datetime.timezone.utc)
    start = int(d.timestamp() * 1000)
    end = int((d + datetime.timedelta(days=1, seconds=-1)).timestamp() * 1000)
    return f"{start}..{end}"

def poll_lumen(day, country="de", per_page=100):
    """Fetch Lumen notices for a given day and country."""
    date_range = to_unix_ms_range_for_day(day)
    params = {
        "date_received_facet": date_range,
        "recipient_name_facet": "Google LLC",
        "topic_facet": "Defamation",
        "country_facet": country,
        "per_page": per_page,
        "page": 1
    }
    r = requests.get(BASE_URL, params=params, timeout=15)
    r.raise_for_status()
    return r.json()

def upload_to_s3(data, day, country):
    """Upload JSON data to s3://lumen-gmaps/raw/{country}/{day}.json"""
    s3 = boto3.client("s3")
    key = f"raw/{country}/{day}.json"
    s3.put_object(
        Bucket=S3_BUCKET,
        Key=key,
        Body=json.dumps(data, indent=2),
        ContentType="application/json"
    )
    print(f"Uploaded to s3://{S3_BUCKET}/{key}")
    return f"s3://{S3_BUCKET}/{key}"

def lambda_handler(event, context):
    day = event.get("day", datetime.date.today().strftime("%Y-%m-%d"))
    country = event.get("country", "de")
    per_page = int(event.get("per_page", 100))

    print(f"Fetching Lumen data for {day} ({country}, {per_page}/page)...")

    data = poll_lumen(day, country, per_page)
    s3_path = upload_to_s3(data, day, country)

    return {
        "statusCode": 200,
        "body": json.dumps({
            "message": "Success",
            "country": country,
            "day": day,
            "s3_path": s3_path,
            "total_results": data.get("total", "N/A")
        })
    }
```


== Snowflake Queries

=== Transformation Query

The following query was used to transform the raw @sor data into usable data for analytics.

#set text(size: 9pt)
#figure(
  [
    #codly(languages: codly-languages)
    ```sql
    CREATE OR REPLACE TABLE sor_article_16 AS
    SELECT
        PARSE_JSON(data):uuid::STRING                  AS uuid,
        PARSE_JSON(data):platform_name::STRING         AS platform_name,
        PARSE_JSON(data):file_date::DATE               AS file_date,
        PARSE_JSON(data):source_type::STRING           AS source_type,
        PARSE_JSON(data):decision_ground::STRING       AS decision_ground,
    
        PARSE_JSON(data):illegal_content_explanation::STRING      AS illegal_content_explanation,
        PARSE_JSON(data):illegal_content_legal_ground::STRING     AS illegal_content_legal_ground,
        PARSE_JSON(data):incompatible_content_explanation::STRING AS incompatible_content_explanation,
        PARSE_JSON(data):incompatible_content_ground::STRING      AS incompatible_content_ground,
    
        PARSE_JSON(data):category::STRING              AS category,
        PARSE_JSON(data):automated_detection::STRING   AS automated_detection,
        PARSE_JSON(data):automated_decision::STRING    AS automated_decision,
        PARSE_JSON(data):content_type_other::STRING    AS content_type_other,
    
        SPLIT(REPLACE(REPLACE(PARSE_JSON(data):territorial_scope::STRING,'["',''),'"]',''), '","')
            AS territorial_scope_array,
        SPLIT(REPLACE(REPLACE(PARSE_JSON(data):decision_visibility::STRING,'["',''),'"]',''), '","')
            AS decision_visibility_array,
        SPLIT(REPLACE(REPLACE(PARSE_JSON(data):content_type::STRING,'["',''),'"]',''), '","')
            AS content_type_array,
    
        COALESCE(
            (PARSE_JSON(data):illegal_content_explanation::STRING = 'Defamation'
             OR PARSE_JSON(data):incompatible_content_ground::STRING ILIKE '%defamation%'),
            FALSE
        ) AS isDefamation,
    
        (PARSE_JSON(data):territorial_scope::STRING = '["DE"]') AS isGermanyOnly,
    
        CASE
            WHEN PARSE_JSON(data):file_date::DATE BETWEEN '2023-08-28' AND '2023-09-10' THEN 'R1'
            WHEN PARSE_JSON(data):file_date::DATE BETWEEN '2023-09-11' AND '2024-02-29' THEN 'R2'
            WHEN PARSE_JSON(data):file_date::DATE BETWEEN '2024-03-01' AND '2024-06-30' THEN 'R3'
            WHEN PARSE_JSON(data):file_date::DATE BETWEEN '2024-07-01' AND '2024-12-31' THEN 'R4'
            WHEN PARSE_JSON(data):file_date::DATE BETWEEN '2025-01-01' AND '2025-06-30' THEN 'R5'
            ELSE 'OTHER'
        END AS report_period
    FROM sor_raw
    WHERE PARSE_JSON(data):source_type::STRING = 'SOURCE_ARTICLE_16';
    ```
  ],
  caption: [Transform raw SoR TDB data into a usable database for analytics],
  supplement: [SQL Query],
  kind: "code"
)
#set text(size: 12pt)


#pagebreak()


=== Analytical Queries

The following are queries which were ran the Snowflake warehouse containing the transformed @tdb data

#set text(size: 9pt)
#figure(
  [
    #codly(languages: codly-languages)
    ```sql
with counts as (
    select
        territorial_scope_array,
        count(*) as total_defamation_cases
    from sor_article_16
    where isdefamation
    group by territorial_scope_array
),
     ranked as (
         select
             territorial_scope_array,
             total_defamation_cases,
             total_defamation_cases * 100.0 / sum(total_defamation_cases) over () as pct,
             row_number() over (order by total_defamation_cases desc) as rn
         from counts
     )
select
    iff(rn <= 4, territorial_scope_array, array_construct('OTHER')) as territorial_scope_array,
    sum(total_defamation_cases) as total_defamation_cases,
    sum(pct) as pct
from ranked
group by iff(rn <= 4, territorial_scope_array, array_construct('OTHER'))
order by total_defamation_cases desc;
    ```
  ],
  caption: [Distribution of defamation‑related enforcement decisions by territorial scope],
  supplement: [SQL Query],
  kind: "code"
)


#figure(
  [
    #codly(languages: codly-languages)
    ```sql
    select
        iff(isDefamation, 'Defamation', 'Non‑Defamation') as decision_type,
        automated_decision,
        count(*) as total_decisions,
        round(
                100.0 * count(*) / sum(count(*)) over (partition by iff(isDefamation, 'Defamation', 'Non‑Defamation')),
                2
        ) as pct_within_type
    from sor_article_16
    group by decision_type, automated_decision
    order by decision_type, pct_within_type desc;
    ```
  ],
  caption: [Automation status of Article 16 decisions on Google Maps, by decision type],
  supplement: [SQL Query],
  kind: "code"
)


#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.1": *
#codly(languages: codly-languages)

#heading(outlined: false, offset: 1)[Transparency Database]


The following table presents all the available columns for use in the transparency database. Only a subset of these columns was used to conduct the analysis, which are indicated by the last column. Full documentation, including the full set of columns is provided here https://transparency.dsa.ec.europa.eu/page/api-documentation. The full table is provided for contextualization.

#show table.cell.where(y: 0): strong
#set table(
  inset: (x, y) => if y == 0 { (x: 8pt, y: 8pt) } else { (x: 10pt, y: 10pt) },
  stroke: (x, y) => if y == 0 {
    (bottom: 0.7pt + black)
  },
  align: left
) 

#set par(justify: true, leading: 0.5em, spacing: 2em)


#table(
  columns: (110pt, 70pt, 1fr, 1fr, 100pt),
  table.header([Variable], [Type], [Description], [Use context], [Aggregatable #footnote[Indicates if the respective column can be used in aggregations (SQL GROUP BY)]]),
  [`received_date`], [DATE], [The date which the report was received], [Yes, used for filtering the study period (2025-06-01 - 2025-10-20)], [No],
  [`platform_name`], [TEXT], [The name of the platform reporting the statement of reason], [Yes, used to filter for Google Maps], [No],
  [`source_type`], [ENUM], [Specifies what led to the investigation (Article 16 report, voluntary, trusted flagger or type other notification)], [Yes, used to see the respective totals for voluntary vs non-voluntary action, and to filter for Article 16 removals specifically], [Yes ],
  [`category`], [ENUM], [High-level classification of the category of violation which led to the action (Illegal speech, consumer information, ...)], [Yes, used for overview in @mod-actions-by-cat and for subsequent filtering by Illegal or harmful speech], [Yes],
  [`territorial_scope`], [ARRAY], [Specifies which EU members the relevant action applies to], [Yes. Used to filter for jurisdictions], [No],
  [`illegal_content_` `explanation`], [TEXT], [Explains why the information is considered illegal based on the legal ground indicated], [Yes. Used to find Defamation and Court Orders in the case of Google Maps], [No]
)

#set page(flipped: false)

#heading(outlined: false, offset: 1)[Queries]

The queries were ran on Postman #footnote[https://www.postman.com/], which is a free to use API platform. An auth token is required to run these queries, which can be requested by emailing `CNECT-DSA-HELPDESK@ec.europa.eu`. More information on the research API can be found here https://transparency.dsa.ec.europa.eu/page/api-documentation. Note that only the previous 6 months of data are available through the API.

The following HTTP Headers were provided in every request:

```json
{
  "Authorization": "Bearer {TOKEN HERE}",
  "Content-Type": "application/json"
}
```

The HTTP request type sent is a POST request, and it is sent to `https://transparency.dsa.ec.europa.eu/api/v1/research/sql
`
A JSON body has to be passed with the respective SQL query. The JSON body is as follows:

```json
{
  "query": "..."
}```

#heading(outlined: false, offset: 2)[Get Google Maps Moderation Actions, Grouped by source type]

```sql
select source_type, count(*) as decision_count from statement_index where received_date between '2025-06-01' and '2025-10-20' and platform_name = 'Google Maps' group by source_type
```

#heading(outlined: false, offset: 2)[Get Google Maps Moderation Actions, Grouped by source type, filtered by EU-wide actions]

Query 1: Gets the total number of actions applied EU-Wide for voluntary removals
```sql
select count(*) as decision_count from statement_index where received_date between '2025-06-01' and '2025-10-20' and platform_name = 'Google Maps' and source_type = 'SOURCE_VOLUNTARY' and territorial_scope = 'de' and territorial_scope = 'at' and territorial_scope = 'be' and territorial_scope = 'bg' and  territorial_scope = 'hr' and  territorial_scope = 'cy' and territorial_scope = 'cz' and  territorial_scope = 'dk' and territorial_scope = 'ee' and  territorial_scope = 'fi' and  territorial_scope = 'fr' and territorial_scope = 'gr' and  territorial_scope = 'hu' and  territorial_scope = 'ie' and territorial_scope = 'it' and  territorial_scope = 'lv' and territorial_scope = 'lt' and  territorial_scope = 'lu' and  territorial_scope = 'mt' and territorial_scope = 'nl' and  territorial_scope = 'pl' and  territorial_scope = 'pt' and  territorial_scope = 'ro' and  territorial_scope = 'sk' and territorial_scope = 'si' and  territorial_scope = 'es' and  territorial_scope = 'se'
```

Query 2: Gets the total number of actions applied EU-Wide for Article 16 removals

```sql
select count(*) as decision_count from statement_index where received_date between '2025-06-01' and '2025-10-20' and platform_name = 'Google Maps' and source_type = 'SOURCE_ARTICLE_16' and territorial_scope = 'de' and territorial_scope = 'at' and territorial_scope = 'be' and territorial_scope = 'bg' and  territorial_scope = 'hr' and  territorial_scope = 'cy' and territorial_scope = 'cz' and  territorial_scope = 'dk' and territorial_scope = 'ee' and  territorial_scope = 'fi' and  territorial_scope = 'fr' and territorial_scope = 'gr' and  territorial_scope = 'hu' and  territorial_scope = 'ie' and territorial_scope = 'it' and  territorial_scope = 'lv' and territorial_scope = 'lt' and  territorial_scope = 'lu' and  territorial_scope = 'mt' and territorial_scope = 'nl' and  territorial_scope = 'pl' and  territorial_scope = 'pt' and  territorial_scope = 'ro' and  territorial_scope = 'sk' and territorial_scope = 'si' and  territorial_scope = 'es' and  territorial_scope = 'se'
```

Query 3: Gets the total number of actions applied EU-Wide for other type notification removals

```sql
select count(*) as decision_count from statement_index where received_date between '2025-06-01' and '2025-10-20' and platform_name = 'Google Maps' and source_type = 'SOURCE_TYPE_OTHER_NOTIFICATION' and territorial_scope = 'de' and territorial_scope = 'at' and territorial_scope = 'be' and territorial_scope = 'bg' and  territorial_scope = 'hr' and  territorial_scope = 'cy' and territorial_scope = 'cz' and  territorial_scope = 'dk' and territorial_scope = 'ee' and  territorial_scope = 'fi' and  territorial_scope = 'fr' and territorial_scope = 'gr' and  territorial_scope = 'hu' and  territorial_scope = 'ie' and territorial_scope = 'it' and  territorial_scope = 'lv' and territorial_scope = 'lt' and  territorial_scope = 'lu' and  territorial_scope = 'mt' and territorial_scope = 'nl' and  territorial_scope = 'pl' and  territorial_scope = 'pt' and  territorial_scope = 'ro' and  territorial_scope = 'sk' and territorial_scope = 'si' and  territorial_scope = 'es' and  territorial_scope = 'se'
```

#heading(outlined: false, offset: 2)[Get Google Maps Moderation Actions, Grouped decision ground, filtered for Article 16]

```sql
select category, count(*) as decision_count from statement_index where received_date between '2025-06-01' and '2025-10-20' and platform_name = 'Google Maps' and source_type = 'SOURCE_ARTICLE_16' group by source_type, category
```

#heading(outlined: false, offset: 2)[Get Google Maps Moderation Actions, Grouped decision country, filtered for illegal and harmful speech and Article 16]


To get this information, a python script was written as we must brute-force every jurisdiction. The script is as follows. Assumes the existence of a `HEADERS` parameter, which is documented above.


```python
import requests
import pandas as pd
API_URL = "https://transparency.dsa.ec.europa.eu/api/v1/research/sql"
territories = [
    "at", "be", "bg", "hr", "cy", "cz", "dk", "ee", "fi", "fr", "de", "gr",
    "hu", "ie", "it", "lv", "lt", "lu", "mt", "nl", "pl", "pt", "ro", "sk",
    "si", "es", "se",
]
base_query = (
    "select count(*) as decision_count from statement_index "
    "where received_date between '2025-06-01' and '2025-10-20' "
    "and platform_name = 'Google Maps' "
    "and source_type = 'SOURCE_ARTICLE_16' "
    "and category = 'STATEMENT_CATEGORY_ILLEGAL_OR_HARMFUL_SPEECH'"
)
rows = []
for country in territories:
    query = base_query + f"and territorial_scope = '{country}' " + " ".join(
        [f"and not territorial_scope = '{other}'" for other in territories if other != country]
    )
    
    payload = {"query": query}
    
    r = requests.post(API_URL, json=payload, headers=headers)
    result = r.json() if r.status_code == 200 else {"error": r.text}

    rows.append({
        "country": country,
        "payload": payload,
        "result": result,
    })

df = pd.DataFrame(rows)
df.to_csv("t4_dump.csv", index=False)
```

This query however will only compute for decisions which are applied in a single jurisdiction. Therefore, we will fall short of the number including all illegal or harmful speech moderation actions. To capture decisions which were captured in all jurisdictions, the following query can be ran:

```sql
select count(*) as decision_count from statement_index where received_date between '2025-06-01' and '2025-10-20' and platform_name = 'Google Maps' and source_type = 'SOURCE_ARTICLE_16' and category = 'STATEMENT_CATEGORY_ILLEGAL_OR_HARMFUL_SPEECH' and territorial_scope = 'de' and territorial_scope = 'at' and territorial_scope = 'be' and territorial_scope = 'bg' and  territorial_scope = 'hr' and  territorial_scope = 'cy' and territorial_scope = 'cz' and  territorial_scope = 'dk' and territorial_scope = 'ee' and  territorial_scope = 'fi' and  territorial_scope = 'fr' and territorial_scope = 'gr' and  territorial_scope = 'hu' and  territorial_scope = 'ie' and territorial_scope = 'it' and  territorial_scope = 'lv' and territorial_scope = 'lt' and  territorial_scope = 'lu' and  territorial_scope = 'mt' and territorial_scope = 'nl' and  territorial_scope = 'pl' and  territorial_scope = 'pt' and  territorial_scope = 'ro' and  territorial_scope = 'sk' and territorial_scope = 'si' and  territorial_scope = 'es' and  territorial_scope = 'se'
```

This may still fall short of the full total, as we still do not capture decisions which are applied in 2 or more jurisdictions, but not in the entire European Union. This number is inferred as follows as the difference between the total illegal or harmful speech removals, minus EU-Wide, minus the sum of all single-country removals. Computing this figure directly from an a script or SQL query would require brute forcing every possible country combination.

#heading(outlined: false, offset: 2)[Get Google Maps Moderation Actions specific legal ground cited for removal, filtered for illegal and harmful speech and Article 16]

The legal grounds which Google Maps reports in the study period are either Defamation or Court Order. There is no way to know all the possible explanations that can be given using the research API only, CSVs #footnote[CSVs can be downloaded here https://transparency.dsa.ec.europa.eu/explore-data/download] provided by the Transparency Database were manually checked beforehand to see what the possible values are. In our study period, these are only "Defamation" and "Court Order". The sum of both queries provided below match the total removals in Germany.

Query 1: Defamation Removals

```sql
select count(*) as decision_count from statement_index where received_date between '2025-06-01' and '2025-10-20' and platform_name = 'Google Maps' and source_type = 'SOURCE_ARTICLE_16' and category = 'STATEMENT_CATEGORY_ILLEGAL_OR_HARMFUL_SPEECH' and illegal_content_explanation like '%defamation%' and territorial_scope = 'de' and not territorial_scope = 'at' and not territorial_scope = 'be' and not territorial_scope = 'bg' and not territorial_scope = 'hr' and not territorial_scope = 'cy' and not territorial_scope = 'cz' and not territorial_scope = 'dk' and not territorial_scope = 'ee' and not territorial_scope = 'fi' and not territorial_scope = 'fr' and not territorial_scope = 'gr' and not territorial_scope = 'hu' and not territorial_scope = 'ie' and not territorial_scope = 'it' and not territorial_scope = 'lv' and not territorial_scope = 'lt' and not territorial_scope = 'lu' and not territorial_scope = 'mt' and not territorial_scope = 'nl' and not territorial_scope = 'pl' and not territorial_scope = 'pt' and not territorial_scope = 'ro' and not territorial_scope = 'sk' and not territorial_scope = 'si' and not territorial_scope = 'es' and not territorial_scope = 'se' 
```

Query 2: Court Order Removals

```sql
select count(*) as decision_count from statement_index where received_date between '2025-06-01' and '2025-10-20' and platform_name = 'Google Maps' and source_type = 'SOURCE_ARTICLE_16' and category = 'STATEMENT_CATEGORY_ILLEGAL_OR_HARMFUL_SPEECH' and illegal_content_explanation like '%court%' and territorial_scope = 'de' and not territorial_scope = 'at' and not territorial_scope = 'be' and not territorial_scope = 'bg' and not territorial_scope = 'hr' and not territorial_scope = 'cy' and not territorial_scope = 'cz' and not territorial_scope = 'dk' and not territorial_scope = 'ee' and not territorial_scope = 'fi' and not territorial_scope = 'fr' and not territorial_scope = 'gr' and not territorial_scope = 'hu' and not territorial_scope = 'ie' and not territorial_scope = 'it' and not territorial_scope = 'lv' and not territorial_scope = 'lt' and not territorial_scope = 'lu' and not territorial_scope = 'mt' and not territorial_scope = 'nl' and not territorial_scope = 'pl' and not territorial_scope = 'pt' and not territorial_scope = 'ro' and not territorial_scope = 'sk' and not territorial_scope = 'si' and not territorial_scope = 'es' and not territorial_scope = 'se' 
```
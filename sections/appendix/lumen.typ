#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.1": *
#import "@preview/glossy:0.8.0": theme-compact
#import "@preview/glossy:0.8.0": *

= Lumen

== Technical Implementation

*Total Population Size (Businesses, URLs)*

#figure(
  [
    #codly(languages: codly-languages)
    ```sql
   SELECT 
    COUNT(DISTINCT clientid) as total_businesses,
    COUNT(*) as total_reviews
  FROM lumen_normalized
  WHERE CAST(date AS DATE) BETWEEN DATE '2025-10-01' AND DATE '2025-10-20'
  AND jurisdiction = 'DE';
  ```
  ],
  caption: [Get the total population size $Omega$, by URL],
  supplement: [SQL Query],
  kind: "code"
)


*how many biz to 80%*

#figure(
  [
    #codly(languages: codly-languages)
    ```sql
WITH client_reports AS (
  SELECT 
    clientid,
    COUNT(*) AS total_reports
  FROM lumen_normalized
  WHERE CAST(date AS DATE) BETWEEN DATE '2025-10-01' AND DATE '2025-10-20'
    AND jurisdiction = 'DE'
  GROUP BY clientid
),
ranked AS (
  SELECT
    clientid,
    total_reports,
    ROW_NUMBER() OVER (ORDER BY total_reports DESC) AS rownum,
    SUM(total_reports) OVER (ORDER BY total_reports DESC) AS cumulative_reports,
    SUM(total_reports) OVER () AS total_reports_all
  FROM client_reports
),
threshold AS (
  SELECT 
    total_reports_all * 0.8 AS target_80pct
  FROM ranked
  LIMIT 1
)
SELECT 
  COUNT(*) AS num_businesses_to_80pct
FROM ranked, threshold
WHERE cumulative_reports <= target_80pct;
  ```
  ],
  caption: [Get the total population size $Omega$, by URL],
  supplement: [SQL Query],
  kind: "code"
)



*Quartile Concentration by Business*

#figure(
  [
    #codly(languages: codly-languages)
    ```sql
    WITH business_counts AS (
      SELECT 
        clientid,
        COUNT(*) as review_count
      FROM lumen_normalized
      WHERE CAST(date AS DATE) BETWEEN DATE '2025-10-01' AND DATE '2025-10-20'
        AND jurisdiction = 'DE'
      GROUP BY clientid
    ),
    ranked_businesses AS (
      SELECT 
        clientid,
        review_count,
        SUM(review_count) OVER (ORDER BY review_count DESC) as cumulative_reviews,
        (SELECT SUM(review_count) FROM business_counts) as total_reviews,
        ROW_NUMBER() OVER (ORDER BY review_count DESC) as rank
      FROM business_counts
    )
    SELECT 
      rank as businesses_needed,
      cumulative_reviews,
      total_reviews,
      ROUND(100.0 * cumulative_reviews / total_reviews, 2) as cumulative_pct
    FROM ranked_businesses
    WHERE 100.0 * cumulative_reviews / total_reviews >= 25 -- Percentile
    ORDER BY rank
    LIMIT 1;
    ```
  ],
  caption: [Query to get the 25% quartile of businesses],
  supplement: [SQL Query],
  kind: "code"
)


*Random Sample*

#figure(
  [
    #codly(languages: codly-languages)
    ```sql
    SELECT clientid, urlnormalized
    FROM lumen_normalized TABLESAMPLE BERNOULLI (1)
    WHERE CAST(date AS DATE)
          BETWEEN date '2025-10-01' AND date '2025-10-20'
    AND jurisdiction = 'DE';
    ```
  ],
  caption: [Draw a random sample from Lumen dataset, by URL],
  supplement: [SQL Query],
  kind: "code"
)
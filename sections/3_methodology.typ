#show table.cell.where(y: 0): strong
#set table(
  inset: (x, y) => if y == 0 { (x: 8pt, y: 8pt) } else { (x: 10pt, y: 10pt) },
  stroke: (x, y) => if y == 0 {
    (bottom: 0.7pt + black)
  },
  align: left
) 


= Methodology

== Research Design

This study uses a two-stage empirical design to test (H1) whether businesses in Germany systematically use legal mechanisms to suppress negative reviews at a disproportionate scale and (H2) whether removal requests achieve reliably high success rates. The analysis combines aggregate platform-level data with granular complaint-level data to assess both the volume and effectiveness of suppressive reputation management.

Stage 1 examines removal volumes using transparency disclosures from the Digital Services Act (DSA) Transparency Database @noauthor_dsa_2025. Under Article 17 of the DSA @european_comission_regulation_2022, Very Large Online Platforms report moderation decisions by source, legal basis, and territorial scope. This allows isolation of Germany-specific removals based on defamation and personality-rights claims (Article 16 legal complaints) from voluntary removals under platform policy. The study covers June 1–October 20, 2025, reflecting the six‑month retrieval limit imposed by the DSA API. Cross‑country comparisons across EU member states assess whether Germany’s removal volumes reflect market size or institutional factors consistent with systematic suppression. A disproportionate German share of EU‑wide removals supports H1.

Stage 2 evaluates removal success rates using complaint‑level data from the Lumen Database @lumen_lumen_2025, which hosts Google’s transparency reports on defamation‑based takedown requests. Each record identifies targeted review URLs, enabling verification of whether the content remains accessible. The sample includes complaints filed October 1–20, 2025, verified on October 31 (≥10‑day lag) within Lumen’s API rate limits. A 1% Bernoulli random sample supports testing whether success rates exceed 50%, the benchmark at which businesses can reliably expect compliance (H2).

#pagebreak()

== Sample Collection

=== Digital Services Act Transparency Database

Data were collected from the DSA Transparency Database via its research API using the OpenSearch SQL interface, which provides structured access to metadata on content moderation actions reported by Very Large Online Platforms. The database structure enables granular filtering across several dimensions relevant to this analysis. Data was retrieved on October 31st, covering moderation actions from June 1st - October 20th, 2025.

First, moderation actions are tagged by platform, allowing isolation of Google Maps removals specifically. Second, each entry specifies the source type, distinguishing between voluntary removals initiated under platform policies and legal removals prompted by external complaints invoking national law. Third, removal categories identify the stated legal basis, including intellectual property infringement, data protection violations, or illegal and harmful speech. For removals classified as illegal content, the `illegal_content_explanation` field provides further specification, enabling precise identification of defamation-based takedowns. Finally, `territorial_scope` indicates the geographic application of each removal. These filtering capabilities make it possible to isolate review removals in Germany that businesses requested through defamation claims. In the underlying dataset, each database entry represents a distinct moderation action: a single piece of content may generate multiple entries if it is subject to successive takedown requests or reinstated and removed again #cite(<google_vlosevlop_2025>, supplement: "§ 2.3").

#pagebreak()

=== Lumen Database

The Lumen Database archives legal removal requests that platforms voluntarily share to increase transparency in content moderation @lumen_lumen_2025. Google shares defamation-based takedown requests with Lumen, though with limited personal information: for individual complainants, Google typically reports only the request type, reported URLs, country, and date, while withholding the requester's identity. @google_about_2025. The reported URLs are particularly valuable for this study. They allow us to verify whether the reviews referenced in legal takedown notices remain publicly accessible or have been deleted. Like the Digital Services Act Transparency Database, Lumen allows thematic filtering through an API parameter (`topic_facet`), which identifies the legal basis for each request. Because jurisdictional filtering is limited, preliminary selection is performed by language (German), followed by the exclusion of entries not originating in or limited to Germany. This approach may omit non-German-language defamation notices concerning German businesses, but such omissions are unlikely to systematically bias the dataset.

The sample includes complaints filed October 1–20, 2025, verified on October 31 (≥10-day lag). This verification window allows sufficient time for Google to process removal requests, as Google's self-reported median processing time for Article 16 notices is less than one day #cite(<google_vlosevlop_2025>, supplement: "§ 2.4").  Using a Bernoulli (1%) sampling procedure, each URL within the study period was independently selected with a probability of 0.01, yielding an unbiased representation of the overall population of reviews. The URLs are extracted into a spreadsheet, and then manually checked if they still exist or if they have been removed at the time of observation. Automation scripts handled API queries, pagination, and sampling to ensure completeness and reproducibility while remaining within rate‑limit constraints.


#pagebreak()

/* To efficiently retrieve and process this data within Lumen's rate-limit constraints, the study employs automated infrastructure built using AWS Cloud Development Kit. The architecture consists of several integrated components designed for reliability, scalability, and reproducibility. A Lambda function written in Python serves as the API caller, polling the Lumen API with the following filter parameters: `date_received_facet`, `recipient_name_facet`, `topic_facet`, and `language_facet`. Responses from Lumen are paginated, requiring a page parameter to retrieve the complete dataset for each day. The process is orchestrated by an AWS Step Function, which iterates through the study period (October 1-20, 2025) day by day, handling pagination automatically and implementing exponential backoff and retry logic to respect Lumen's rate limits. Raw API responses are written to Amazon S3 for auditability. Within the Step Function workflow, a second Lambda function performs data normalization. Each Lumen entry contains metadata for a single takedown request alongside an array of reported URLs, often multiple reviews that a business seeks to remove in one complaint. The normalizer flattens this structure so that each URL becomes a separate observation, then applies two filters: retaining only entries where the jurisdictions field contains exclusively `DE` and excluding non-Google Maps URLs. The function also parses the Google Maps Client ID from each URL, which allows for business-level aggregation. Normalized data is written back to S3 in a queryable format. The processed dataset is cataloged using AWS Glue, making it accessible through Amazon Athena's SQL interface. The Bernoulli sampling query is executed in Athena to draw a random sample of URLs for manual verification, ensuring that the labor-intensive task of checking review accessibility remains analytically feasible while maintaining statistical representativeness. */



== Sample Description

=== Digital Services Act Transparency Database

/* Applying a date filter (`2025-06-01 to 2025-10-20`), and a platform filter (`Google Maps`), we disaggregate by source to understand the reason that led to the investigation on the relevant content. #cite(<european_comission_regulation_2022>, supplement: "Article 17 (3)(b)")
*/
After applying date (2025‑06‑01 - 2025‑10‑20) and platform (Google Maps) filters, moderation actions were grouped by source type to identify the origin of each decision. Article 16 cases represent moderation actions initiated through external legal complaints invoking national law, while voluntary removals reflect actions taken under Google’s internal content policies #cite(<european_comission_regulation_2022>, supplement: "Article 17 (3)(b)"). @by-source-type shows the total actions per source type.

#set par(leading: 1em, justify: false)

/* select source_type, count(*) as decision_count from statement_index where received_date between '2025-06-01' and '2025-10-20' and platform_name = 'Google Maps' group by source_type */

#figure(
  table(
    columns: (1fr, 1fr, 100pt),
    table.header([Source Type], [Total Actions], [%]),
    [Voluntary], [23,049,578], [$93.82%$],
    [Article 16], [1,514,957], [$6.17%$],
    [Other Type Notification], [985], [$< 0.01%$],
    [*Total*], [24,565,520], [$100%$],
  ),
  caption: [Google Maps moderation actions, by source type]
) <by-source-type>

#set par(leading: 2em, justify: true)

Though this majority of Google Maps moderation actions are of voluntary nature, these moderations are generally applied EU-wide. @jur-composition shows a breakdown of the amount of EU-wide removals

#set par(leading: 1em, justify: false)

/*     "query": "select count(*) as decision_count from statement_index where received_date between '2025-06-01' and '2025-10-20' and platform_name = 'Google Maps' and source_type = 'SOURCE_ARTICLE_16' and territorial_scope = 'de' and territorial_scope = 'at' and territorial_scope = 'be' and territorial_scope = 'bg' and  territorial_scope = 'hr' and  territorial_scope = 'cy' and territorial_scope = 'cz' and  territorial_scope = 'dk' and territorial_scope = 'ee' and  territorial_scope = 'fi' and  territorial_scope = 'fr' and territorial_scope = 'gr' and  territorial_scope = 'hu' and  territorial_scope = 'ie' and territorial_scope = 'it' and  territorial_scope = 'lv' and territorial_scope = 'lt' and  territorial_scope = 'lu' and  territorial_scope = 'mt' and territorial_scope = 'nl' and  territorial_scope = 'pl' and  territorial_scope = 'pt' and  territorial_scope = 'ro' and  territorial_scope = 'sk' and territorial_scope = 'si' and  territorial_scope = 'es' and  territorial_scope = 'se'" */


#figure(
  table(
    columns: (1fr, 1fr, 100pt),
    table.header([Source Type], [EU Wide Actions], [%]),
    [Voluntary], [22,876,692], [$99.25%$],
    [Article 16], [1,229], [$0.08%$],
    [Other Type Notification], [130], [$13.19%$],
  ),
  caption: [Jurisdictional Composition of DSA actions]
) <jur-composition>

#set par(leading: 2em, justify: true)


To examine the composition of these legal removals in more detail, @mod-actions-by-cat disaggregates Article 16 actions by their reported decision ground.

#set par(leading: 1em, justify: false)

/* select category, count(*) as decision_count from statement_index where received_date between '2025-06-01' and '2025-10-20' and platform_name = 'Google Maps' and source_type = 'SOURCE_ARTICLE_16' group by category */

#figure(
  table(
    columns: (1fr, 1fr, 100pt),
    table.header([Decision Ground], [Total Actions], [%]),
    [Illegal or harmful speech], [1,513,139], [$99.88%$],
    [Intellectual property infringements], [1,772], [$0.1%$],
    [Data protection and privacy violations], [29], [$< 0.01%$],
    [Other violation of T&C #footnote[Terms and Conditions]], [12], [$<0.01%$],
    [Consumer Information], [4], [$<0.01%$],
    [Protection of minors], [1], [$<0.01%$],
    [*Total*], [1.514.957], [$100%$]
  ),
  caption: [Article 16 moderation actions on Google Maps, by decision ground]
) <mod-actions-by-cat>

#set par(leading: 2em, justify: true)

Illegal or harmful speech represents nearly all Article 16 moderation actions, while other legal bases such as intellectual property infringement or data‑protection violations appear only in negligible numbers. To examine where these actions occur geographically, @a16-mod-actions-by-country disaggregates the illegal and harmful speech category by country.


#set par(leading: 1em, justify: false)

/* select count(*) as decision_count from statement_index where received_date between '2025-06-01' and '2025-09-31' and platform_name = 'Google Maps' and source_type = 'SOURCE_ARTICLE_16' and category = 'STATEMENT_CATEGORY_ILLEGAL_OR_HARMFUL_SPEECH' and territorial_scope = 'de'  */

#figure(
  table(
    columns: (1fr, 1fr, 100pt),
    table.header([Country], [Total Actions], [%]),
    [Germany], [1,512,700], [99.97%],
    [France], [101], [0.01%],
    [Spain], [99], [0.01%],
    [Poland], [74], [$<0.01%$],
    [Austria], [49], [$<0.01%$],
    [Other #footnote[Combined count for all other EU countries than the ones shown. Countries are sorted by number of total actions]], [91], [$<0.01%$],
    [*Total*], [1.513.114 #footnote[The total of 1.513.114 here does not match the total actions for illegal and harmful and speech (1.513.139) by 25 removals as those actions are multi-jurisdiction, so they are not captured in the query]], [$100%$]
  ),
  caption: [Article 16 ‘Illegal and Harmful Speech’ moderation actions on Google Maps, by country (EU)]
) <a16-mod-actions-by-country>
#set par(leading: 2em, justify: true)

The vast majority of Article 16 “Illegal and Harmful Speech” moderation actions occurred in Germany, with only minimal counts reported for other EU member states. To show the composition of Germany’s actions in greater detail, @illegal-reason-breakdown breaks down these moderation actions by the specific legal mechanism invoked.

#set par(leading: 1em, justify: false)

/* select count(*) as decision_count from statement_index where received_date between '2025-06-01' and '2025-09-31' and platform_name = 'Google Maps' and source_type = 'SOURCE_ARTICLE_16' and category = 'STATEMENT_CATEGORY_ILLEGAL_OR_HARMFUL_SPEECH' and territorial_scope = 'de'  */

#figure(
  table(
    columns: (1fr, 1fr, 100pt),
    table.header([Decision Ground (Detailed)], [Total Actions], [%]),
    [Defamation], [1,512,595], [$99.99%$],
    [Court Order], [105], [$0.01%$],
    [*Total*], [1,512,700], [$100%$]
  ),
  caption: [Article 16 “Illegal and Harmful Speech” moderation actions by detailed decision ground]
) <illegal-reason-breakdown>
#set par(leading: 2em, justify: true)

Combined, Germany-specific defamation removals constitute 1,512,595 of the 1,514,957 total Article 16 actions across all categories and jurisdictions (99.84%) #footnote[$1,512,595 div 1,514,957 = 99.84%$]. No significance is conducted as Germany's figures are orders of magnitude #footnote[$log_10 (1,512,700 div 100) = 4.1797$] higher than comparable countries 

=== Lumen Database

Using a Bernoulli (1%) sampling procedure, each URL within the study period was independently selected with a probability of 0.01, yielding an unbiased representation of the overall population of reviews. This produced a sample of 994 URLs from 98,106 complaints filed during October 1–20, 2025. The URLs were extracted into a spreadsheet and manually checked for whether they remained accessible or had been removed at the time of observation. After removing invalid URLs #footnote[The removed URLs led to an empty google maps page with no deleted review or business] (11 in total), the final sample consisted of 983 URLs. Among the valid URLs, 840 were confirmed removed, yielding a success rate of 85.45%, with a 95% confidence interval of [83.2%; 87.7%] #footnote[Standard error calculated as SE = $sqrt([hat(p)(1-hat(p)) slash n])$ = $sqrt(0.8545(1-0.8545) slash 983) = 0.0112$, yielding a 95% CI of $85.45 plus.minus 1.96 dot (1.12%) = [83.2%; 87.7%] $]


/* == Analytical Approach

=== Scale of removal activity (RQ1/H1)

To assess whether German businesses systematically use legal mechanisms for review removal, Article 16 removals classified as illegal and harmful speech are aggregated from the DSA Transparency Database. Germany-specific defamation removals are isolated using territorial scope filters and detailed decision ground classifications.

Removal volumes from France, Spain, Poland, and Austria serve as comparison points. These jurisdictions share similar legal traditions (civil law systems), economic development levels, and digital infrastructure but operate under different personality-rights frameworks, which are defined by national law. The magnitude of cross-country differences is quantified using orders of magnitude calculations (log₁₀ of removal ratios). Because the DSA database constitutes a complete census rather than a sample, removal counts are population parameters requiring no inferential statistics.

=== Removal success rate analysis (RQ2/H2)

Overall removal success rates are calculated as the proportion of sampled URLs (n=983) no longer accessible at the observation date, with 95% confidence intervals using standard error for proportions (SE = √[p̂(1-p̂)/n]).
Removal rates are then disaggregated by filing intensity quartiles. Each sampled URL is classified by its associated business's quartile position in the complaint volume distribution (Table 6: Q1 = top 144 businesses, Q2 = ranks 145-665, Q3 = ranks 666-2,227, Q4 = remaining businesses). Separate removal rates and 95% confidence intervals are calculated for each quartile. Non-overlapping confidence intervals indicate differences unlikely attributable to sampling variation (α = 0.05).


/*
=== Lumen Database

The Lumen Database provides granular, complaint-level data that enables analysis of removal success rates and the distribution of suppression activity across businesses. Unlike the DSA Transparency Database, which reports moderation actions, Lumen reports moderation requests.

@lumen-summary presents a summary of the extracted data, on the total number of clients (unique businesses), and total number of review submitted to Lumen in the study period. This represents the full population. This data represents requests in Germany only

#set par(leading: 1em, justify: false)
#figure(
  table(
    columns: (1fr, 1fr),
    table.header([], [Total]),
    [*Businesses*], [13,691],
    [*Removal Requests*], [98,106]
  ),
  caption: [Lumen Database, population size of businesses and removals]
) <lumen-summary>
#set par(leading: 2em, justify: true)

/* Two analytical approaches apply to this dataset. First, aggregating complaints by the business Client ID embedded in each review URL reveals the distribution of filing activity: whether complaints originate primarily from many businesses filing occasionally or from a concentrated subset filing repeatedly. Second, the review URLs can be manually verified to determine whether contested content remains accessible or has been removed, providing a direct measure of business success rates. */

/* To assess the concentration of filing activity, we rank businesses by complaint volume and identify the minimum number of businesses whose cumulative complaints account for 25%, 50%, and 75% of all removal requests.  @lumen-aggregation shows the results of this analysis.

#set par(leading: 1em, justify: false)
#figure(
  table(
    columns: (1fr, 1fr, 1fr),
    table.header([Quartile], [Total Businesses], [Cumulative Complaints]),
    [Q1 $(25%)$], [144], [24,686],
    [Q2 $(50%)$], [665], [49,553],
    [Q3 $(75%)$], [2,227], [73,716],
    [Q4 $(100%)$], [13,691], [98,106]
  ),
  caption: [Requesting businesses, quartile distribution by complaint volume]
) <lumen-aggregation>
#set par(leading: 2em, justify: true) */

A random sample of 994 URLs (representing 1% of the total population) was drawn to analyze removal rates. After excluding 11 invalid entries, the final valid sample comprised 983 URLs. The observation of whether the data was removed was made on October 31st. Among the 983 valid URLs, 840 were confirmed removed, yielding a success rate of 85.45%, with a 95% confidence interval of [83.2%; 87.7%] #footnote[Standard error calculated as SE = $sqrt([hat(p)(1-hat(p)) slash n])$ = $sqrt(0.8545(1-0.8545) slash 983) = 0.0112$, yielding a 95% CI of $85.45 plus.minus 1.96 dot (1.12%) = [83.2%; 87.7%] $]

/* Each sampled URL was classified according to its associated business's quartile position from @lumen-aggregation, yielding the following distribution: Q1 filers (top 144 businesses, n=202 sampled URLs), Q2 filers (ranks 145-665, n=257), Q3 filers (ranks 666-2,227, n=234), and Q4 filers (all remaining businesses, n=290). Removal rates were calculated separately for each quartile category.

#set par(leading: 1em, justify: false)
#figure(
  table(
    columns: (120pt, 75pt, 75pt, 100pt, 100pt),
    table.header([Category], [n], [Removed], [Removal Rate], [95% CI #footnote[Standard error calculated as SE = $sqrt([hat(p)(1-hat(p)) slash n])$]]),
    [Q1 (Top 144)], [202], [193], [95.5%], [[92.7%, 98.4%]],
    [Q2 (145-665)], [257], [223], [86.8%], [[82.6%, 90.9%]],
    [Q3 (666-2,227)], [234], [197], [84.2%], [[79.5%, 88.9%]],
    [Q4 (Remaining)], [290], [227], [78.3%], [[73.5%, 83.0%]],
    [*All Businesses*], [*983*], [*840*], [*85.5%*], [[83.2%, 87.7%]
]
  ),
  caption: [Summary of removals for all businesses, and per quartile]
) <lumen-aggregation2>
#set par(leading: 2em, justify: true) */
#pagebreak()

== Analytical Approach

=== Scale of removal activity (RQ1/H1)

To assess whether German businesses systematically use legal mechanisms for review removal, Article 16 removals classified as illegal and harmful speech are aggregated from the DSA Transparency Database. Germany-specific defamation removals are isolated using territorial scope filters and detailed decision ground classifications.

Removal volumes from France, Spain, Poland, and Austria serve as comparison points. These jurisdictions share similar legal traditions (civil law systems), economic development levels, and digital infrastructure but operate under different personality-rights frameworks, which are defined by national law. The magnitude of cross-country differences is quantified using orders of magnitude calculations (log₁₀ of removal ratios). Because the DSA database constitutes a complete census rather than a sample, removal counts are population parameters requiring no inferential statistics.

=== Removal success rate analysis (RQ2/H2)

Overall removal success rates are calculated as the proportion of sampled URLs (n=983) no longer accessible at the observation date, with 95% confidence intervals using standard error for proportions (SE = √[p̂(1-p̂)/n]).
Removal rates are then disaggregated by filing intensity quartiles. Each sampled URL is classified by its associated business's quartile position in the complaint volume distribution (Table 6: Q1 = top 144 businesses, Q2 = ranks 145-665, Q3 = ranks 666-2,227, Q4 = remaining businesses). Separate removal rates and 95% confidence intervals are calculated for each quartile. Non-overlapping confidence intervals indicate differences unlikely attributable to sampling variation (α = 0.05).
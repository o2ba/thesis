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

This thesis uses two complementary data sources that capture legal complaints and platform moderation activity on Google Maps at different levels of granularity.

The Lumen Database @lumen_lumen_2025, a voluntary transparency initiative to which Google reports @google_about_2025, archives individual legal complaints submitted to online platforms. Each record includes the targeted URLs and the legal basis for removal. For this study, Lumen serves two analytical purposes. First, it enables direct measurement of removal success rates: by recording the specific review URLs targeted in takedown requests and verifying whether those URLs remain publicly accessible after a processing window, we can observe actual removal outcomes. Second, because review URLs identify the business being reviewed, we can aggregate requests targeting the same business to examine the distribution of removal activity. This allows us to identify whether some businesses experience repeated removal requests while others experience them sporadically, and to test whether the volume of requests targeting a business correlates with success rates.

The EU Digital Services Act Transparency Database @european_comission_regulation_2022 provides mandatory aggregate reporting on all content moderation actions by large platforms operating in the European Union. Unlike Lumen's voluntary reporting of individual complaints, the DSA requires comprehensive disclosure of both voluntary removals (platform-initiated under content policies) and legal removals (externally prompted through Article 16 notices invoking national law). Each report specifies the legal basis (if any), territorial scope, and decision ground. For this study, the DSA serves two purposes. First, it establishes the total volume of legally-motivated removal activity in Germany during the study period. Second, it provides a cross-jurisdictional comparison: because all EU member states operate under identical DSA reporting requirements and Google Maps applies uniform content policies EU-wide, observing where legal removal requests concentrate allows assessment of whether removal patterns reflect Germany-specific institutional factors or universal platform dynamics.

The two databases cover different time periods due to access constraints and methodological requirements. Lumen data spans October 1–20, 2025, with removal verification conducted October 31. This narrow window ensures sufficient processing time (minimum 10 days) given Google's reported median response time of less than one day @google_vlosevlop_2025, while maintaining temporal proximity between complaint filing and outcome verification. DSA data spans June 1–October 20, 2025, reflecting the API's six-month historical limit at the time of data collection. Despite these different periods, the databases serve distinct analytical purposes: Lumen measures granular outcomes and business-level patterns during a focused verification window, while DSA establishes aggregate patterns over a longer observation period that captures sustained activity rather than short-term fluctuation.

Together, these sources enable testing both hypotheses. H1 (high success rates) is tested primarily using Lumen's complaint-level data. H2 (systematic suppression at scale) is tested using DSA aggregate volumes to establish material magnitude, complemented by Lumen business-level data to examine whether removal exhibits characteristics of systematic practice: concentration among repeat filers, procedural standardization, and positive correlation between filing frequency and success rates indicative of learning effects.

 
#pagebreak()

== Sample Collection

=== Lumen Database

Data were collected from the Lumen Database via its public API. To isolate defamation-based takedown requests targeting Google Maps reviews in Germany, I applied sequential filters. The API's topic_facet parameter was set to "Defamation" to retrieve relevant complaint types. Because Lumen's API lacks direct jurisdictional filtering, I performed preliminary selection by language (German), then manually excluded entries that did not originate in or apply exclusively to Germany based on complaint metadata. This approach may omit non-German-language defamation notices concerning German businesses, but such omissions are unlikely to introduce systematic bias given the predominance of German-language filings for German businesses.

From complaints filed October 1 to 20, 2025, I applied Bernoulli sampling with probability p = 0.01, yielding an unbiased one-percent sample of the population. Each URL was independently selected, ensuring representativeness without interdependence between observations. This produced 994 URLs from 98,106 total complaints filed during the observation window. Verification was conducted on October 31, 2025, providing a minimum 10-day processing lag. For each sampled URL, I manually accessed the review page and recorded whether the content remained publicly visible or returned an error indicating removal. Invalid URLs that led to empty pages with no identifiable business or review content (11 cases) were excluded, yielding a final analytic sample of 983 URLs. 

To enable business-level analysis, I extracted business identifiers from the URL structure of each sampled review. Google Maps review URLs follow a standardized format that embeds a unique business identifier, allowing aggregation of multiple removal requests targeting the same business. This enables examination of whether some businesses experience repeated removal activity and whether filing volume correlates with success rates.

Automation scripts handled API queries, pagination, and sampling logic to ensure completeness and reproducibility while remaining within rate-limit constraints.

/* The Lumen Database archives legal removal requests that platforms voluntarily share to increase transparency in content moderation @lumen_lumen_2025. Google shares defamation-based takedown requests with Lumen, though with limited personal information: for individual complainants, Google typically reports only the request type, reported URLs, country, and date, while withholding the requester's identity. @google_about_2025. The reported URLs are particularly valuable for this study. They allow us to verify whether the reviews referenced in legal takedown notices remain publicly accessible or have been deleted. Like the Digital Services Act Transparency Database, Lumen allows thematic filtering through an API parameter (`topic_facet`), which identifies the legal basis for each request. Because jurisdictional filtering is limited, preliminary selection is performed by language (German), followed by the exclusion of entries not originating in or limited to Germany. This approach may omit non-German-language defamation notices concerning German businesses, but such omissions are unlikely to systematically bias the dataset.

The sample includes complaints filed October 1–20, 2025, verified on October 31 (≥10-day lag). This verification window allows sufficient time for Google to process removal requests, as Google's self-reported median processing time for Article 16 notices is less than one day #cite(<google_vlosevlop_2025>, supplement: "§ 2.4").  Using a Bernoulli (1%) sampling procedure, each URL within the study period was independently selected with a probability of 0.01, yielding an unbiased representation of the overall population of reviews. The URLs are extracted into a spreadsheet, and then manually checked if they still exist or if they have been removed at the time of observation. Automation scripts handled API queries, pagination, and sampling to ensure completeness and reproducibility while remaining within rate‑limit constraints. */

=== Digital Services Act Transparency Database

Data were collected from the DSA Transparency Database via its research API using the OpenSearch SQL interface, which provides structured access to metadata on content moderation actions reported by Very Large Online Platforms. The database structure enables granular filtering across several dimensions relevant to this analysis. Data was retrieved on October 31st, covering moderation actions from June 1st - October 20th, 2025.

First, moderation actions are tagged by platform, allowing isolation of Google Maps removals specifically. Second, each entry specifies the source type, distinguishing between voluntary removals initiated under platform policies and legal removals prompted by external complaints invoking national law. Third, removal categories identify the stated legal basis, including intellectual property infringement, data protection violations, or illegal and harmful speech. For removals classified as illegal content, the `illegal_content_explanation` field provides further specification, enabling precise identification of defamation-based takedowns. Finally, `territorial_scope` indicates the geographic application of each removal. These filtering capabilities make it possible to isolate review removals in Germany that businesses requested through defamation claims. In the underlying dataset, each database entry represents a distinct moderation action: a single piece of content may generate multiple entries if it is subject to successive takedown requests or reinstated and removed again #cite(<google_vlosevlop_2025>, supplement: "§ 2.3").

#pagebreak()

== Sample Description


=== Lumen Database

The Lumen Database contained 98,106 defamation-based takedown requests filed against Google Maps reviews during October 1-20, 2025. Using Bernoulli one-percent sampling, I selected 994 URLs for manual verification. After excluding 11 invalid URLs that led to empty pages with no identifiable business or review content, the analytic sample comprised 983 valid observations.

The 98,106 takedown requests targeted 13,691 unique businesses. The number of requests per business ranged from 1 to 863, with a mean of 7.16 and a median of 2. This distribution exhibits substantial right-skew: while the median business faced only 2 removal requests during the observation window, the maximum of 863 requests suggests considerable variation in removal activity across businesses.



/* The Lumen Database contained 98,106 defamation-based takedown requests filed against Google Maps reviews during October 1-20, 2025. Using Bernoulli one-percent sampling, I selected 994 URLs for manual verification. After excluding 11 invalid URLs that led to empty pages with no identifiable business or review content, the analytic sample comprised 983 valid observations. Of the 983 verified URLs, 840 reviews were confirmed removed and 143 remained accessible at the time of observation, yielding an observed removal rate of 85.45 percent [95% CI: 83.2%, 87.7%] #footnote[Standard error calculated as SE = $sqrt([hat(p)(1-hat(p)) slash n])$ = $sqrt(0.8545(1-0.8545) slash 983) = 0.0112$, yielding a 95% CI of $85.45 plus.minus 1.96 dot (1.12%) = [83.2%; 87.7%] $].

The 98,106 takedown requests targeted 13,691 unique businesses. The number of removals per business ranged from 1 to 863, with an average of 7.16 and a median of 2. Removal activity was highly concentrated: the top 113 businesses (0.8%) accounted for 25% of all removals, while the top 663 businesses (4.8%) accounted for 50%. */

=== Digital Services Act Transparency Database

The Digital Services Act Transparency Database provides access to 24,565,520 total Google Maps moderation actions recorded between June 1 and October 20, 2025. 

These actions were distributed across three source types, shown in @by-source-type. The Article 16 subset, comprising 1,514,957 observations, forms the primary analytic sample for testing H2, as these actions reflect moderation actions initiated by legal challenges rather than platform-discretionary content moderation.

#set par(leading: 1em, justify: false)
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

We then display the share in which these source types are jurisdiction-specific. This serves as a baseline to show that variation in jurisdictional application primarily lies within Article 16 removals.

#figure(
  table(
    columns: (1fr, 1fr, 100pt),
    table.header([Source Type], [EU Wide Actions], [%]),
    [Voluntary], [22,876,692], [$99.25%$],
    [Article 16], [1,229], [$0.08%$],
    [Other Type Notification], [130], [$13.19%$],
  ),
  caption: [Share of EU-Wide moderation actions, by source type]
) <jur-composition>

#set par(leading: 2em, justify: true)

Within the Article 16 category, actions were classified by decision ground on a high level (illegal speech, IP infringement, data protection violations).

#set par(leading: 1em, justify: false)
#figure(
  table(
    columns: (1fr, 1fr, 100pt),
    table.header([Decision Ground], [Total Actions], [%]),
    [Illegal or harmful speech], [1,513,139], [$99.88%$],
    [Intellectual property infringements], [1,772], [$0.1%$],
    [Data protection and privacy violations], [29], [$< 0.01%$],
    [Other violation of T&C], [12], [$<0.01%$],
    [Consumer Information], [4], [$<0.01%$],
    [Protection of minors], [1], [$<0.01%$],
    [*Total*], [1,514,957], [$100%$]
  ),
  caption: [Article 16 moderation actions on Google Maps, by decision ground]
) <mod-actions-by-cat>

#set par(leading: 2em, justify: true)


// === Digital Services Act Transparency Database

// /* Applying a date filter (`2025-06-01 to 2025-10-20`), and a platform filter (`Google Maps`), we disaggregate by source to understand the reason that led to the investigation on the relevant content. #cite(<european_comission_regulation_2022>, supplement: "Article 17 (3)(b)")
// */
// After applying date (2025‑06‑01 - 2025‑10‑20) and platform (Google Maps) filters, moderation actions were grouped by source type to identify the origin of each decision. Article 16 cases represent moderation actions initiated through external legal complaints invoking national law, while voluntary removals reflect actions taken under Google’s internal content policies #cite(<european_comission_regulation_2022>, supplement: "Article 17 (3)(b)"). @by-source-type shows the total actions per source type.

// #set par(leading: 1em, justify: false)

// /* select source_type, count(*) as decision_count from statement_index where received_date between '2025-06-01' and '2025-10-20' and platform_name = 'Google Maps' group by source_type */

// #figure(
//   table(
//     columns: (1fr, 1fr, 100pt),
//     table.header([Source Type], [Total Actions], [%]),
//     [Voluntary], [23,049,578], [$93.82%$],
//     [Article 16], [1,514,957], [$6.17%$],
//     [Other Type Notification], [985], [$< 0.01%$],
//     [*Total*], [24,565,520], [$100%$],
//   ),
//   caption: [Google Maps moderation actions, by source type]
// ) <by-source-type>

// #set par(leading: 2em, justify: true)

// Though this majority of Google Maps moderation actions are of voluntary nature, these moderations are generally applied EU-wide. @jur-composition shows a breakdown of the amount of EU-wide removals

// #set par(leading: 1em, justify: false)

// /*     "query": "select count(*) as decision_count from statement_index where received_date between '2025-06-01' and '2025-10-20' and platform_name = 'Google Maps' and source_type = 'SOURCE_ARTICLE_16' and territorial_scope = 'de' and territorial_scope = 'at' and territorial_scope = 'be' and territorial_scope = 'bg' and  territorial_scope = 'hr' and  territorial_scope = 'cy' and territorial_scope = 'cz' and  territorial_scope = 'dk' and territorial_scope = 'ee' and  territorial_scope = 'fi' and  territorial_scope = 'fr' and territorial_scope = 'gr' and  territorial_scope = 'hu' and  territorial_scope = 'ie' and territorial_scope = 'it' and  territorial_scope = 'lv' and territorial_scope = 'lt' and  territorial_scope = 'lu' and  territorial_scope = 'mt' and territorial_scope = 'nl' and  territorial_scope = 'pl' and  territorial_scope = 'pt' and  territorial_scope = 'ro' and  territorial_scope = 'sk' and territorial_scope = 'si' and  territorial_scope = 'es' and  territorial_scope = 'se'" */


// #figure(
//   table(
//     columns: (1fr, 1fr, 100pt),
//     table.header([Source Type], [EU Wide Actions], [%]),
//     [Voluntary], [22,876,692], [$99.25%$],
//     [Article 16], [1,229], [$0.08%$],
//     [Other Type Notification], [130], [$13.19%$],
//   ),
//   caption: [Share of EU-Wide moderation actions, by source type]
// ) <jur-composition>

// #set par(leading: 2em, justify: true)


// To examine the composition of these legal removals in more detail, @mod-actions-by-cat disaggregates Article 16 actions by their reported decision ground.

// #set par(leading: 1em, justify: false)

// /* select category, count(*) as decision_count from statement_index where received_date between '2025-06-01' and '2025-10-20' and platform_name = 'Google Maps' and source_type = 'SOURCE_ARTICLE_16' group by category */

// #figure(
//   table(
//     columns: (1fr, 1fr, 100pt),
//     table.header([Decision Ground], [Total Actions], [%]),
//     [Illegal or harmful speech], [1,513,139], [$99.88%$],
//     [Intellectual property infringements], [1,772], [$0.1%$],
//     [Data protection and privacy violations], [29], [$< 0.01%$],
//     [Other violation of T&C], [12], [$<0.01%$],
//     [Consumer Information], [4], [$<0.01%$],
//     [Protection of minors], [1], [$<0.01%$],
//     [*Total*], [1,514,957], [$100%$]
//   ),
//   caption: [Article 16 moderation actions on Google Maps, by decision ground]
// ) <mod-actions-by-cat>

// #set par(leading: 2em, justify: true)

// Illegal or harmful speech represents nearly all Article 16 moderation actions, while other legal bases such as intellectual property infringement or data‑protection violations appear only in negligible numbers. To examine where these actions occur geographically, @a16-mod-actions-by-country disaggregates the illegal and harmful speech category by country.


// #set par(leading: 1em, justify: false)

// /* select count(*) as decision_count from statement_index where received_date between '2025-06-01' and '2025-09-31' and platform_name = 'Google Maps' and source_type = 'SOURCE_ARTICLE_16' and category = 'STATEMENT_CATEGORY_ILLEGAL_OR_HARMFUL_SPEECH' and territorial_scope = 'de'  */

// #figure(
//   table(
//     columns: (1fr, 1fr, 100pt),
//     table.header([Country], [Total Actions], [%]),
//     [Germany], [1,512,700], [99.97%],
//     [France], [101], [0.01%],
//     [Spain], [99], [0.01%],
//     [Poland], [74], [$<0.01%$],
//     [Austria], [49], [$<0.01%$],
//     [Other], [106 #footnote[Out of the 106 other, 91 are applied in a single country, and 2 are applied in two or more jurisdictions, and 23 are applied EU-wide]], [$<0.01%$],
//     [*Total*], [1,513,139], [$100%$]
//   ),
//   caption: [Article 16 ‘Illegal and Harmful Speech’ moderation actions on Google Maps, by country (EU)]
// ) <a16-mod-actions-by-country>
// #set par(leading: 2em, justify: true)

// // .The vast majority of Article 16 “Illegal and Harmful Speech” moderation actions occurred in Germany, with only minimal counts reported for other EU member states. To show the composition of Germany’s actions in greater detail, @illegal-reason-breakdown breaks down these moderation actions by the specific legal mechanism invoked.

// The vast majority of Article 16 "Illegal and Harmful Speech" moderation actions occurred in Germany, with only minimal counts reported for other EU member states. This concentration reflects reported enforcement activity rather than necessarily the underlying prevalence of contested reviews across jurisdictions. To show the composition of Germany's actions in greater detail, @illegal-reason-breakdown breaks down these moderation actions by the specific legal mechanism invoked.Retry

// #set par(leading: 1em, justify: false)

// /* select count(*) as decision_count from statement_index where received_date between '2025-06-01' and '2025-09-31' and platform_name = 'Google Maps' and source_type = 'SOURCE_ARTICLE_16' and category = 'STATEMENT_CATEGORY_ILLEGAL_OR_HARMFUL_SPEECH' and territorial_scope = 'de'  */

// #figure(
//   table(
//     columns: (1fr, 1fr, 100pt),
//     table.header([Decision Ground (Detailed)], [Total Actions], [%]),
//     [Defamation], [1,512,595], [$99.99%$],
//     [Court Order], [105], [$0.01%$],
//     [*Total*], [1,512,700], [$100%$]
//   ),
//   caption: [Article 16 “Illegal and Harmful Speech” moderation actions by detailed decision ground]
// ) <illegal-reason-breakdown>
// #set par(leading: 2em, justify: true)

// Combined, Germany-specific defamation removals constitute 1,512,595 of the 1,514,957 total Article 16 actions across all categories and jurisdictions (99.84%) #footnote[$1,512,595 div 1,514,957 = 99.84%$]. 

// === Lumen Database

// Using a Bernoulli (1%) sampling procedure, each URL within the study period was independently selected with a probability of 0.01, yielding an unbiased representation of the overall population of reviews. This produced a sample of 994 URLs from 98,106 complaints filed during October 1–20, 2025. The URLs were extracted into a spreadsheet and manually checked for whether they remained accessible or had been removed at the time of observation. After removing invalid URLs #footnote[The removed URLs led to an empty google maps page with no deleted review or business] (11 in total), the final sample consisted of 983 URLs. Among the valid URLs, 840 were confirmed removed, yielding a success rate of 85.45%, with a 95% confidence interval of [83.2%; 87.7%] #footnote[Standard error calculated as SE = $sqrt([hat(p)(1-hat(p)) slash n])$ = $sqrt(0.8545(1-0.8545) slash 983) = 0.0112$, yielding a 95% CI of $85.45 plus.minus 1.96 dot (1.12%) = [83.2%; 87.7%] $] 
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

This study combines aggregate platform-level moderation data with granular complaint-level data to assess both the volume and effectiveness of suppressive reputation management.

To test H1, I examine whether businesses in Germany systematically use legal mechanisms to suppress negative reviews at disproportionate scale. I analyze removal volumes using transparency disclosures from the Digital Services Act (DSA) Transparency Database @noauthor_dsa_2025. Under Article 17 of the DSA @european_comission_regulation_2022, Very Large Online Platforms must report all moderation decisions in the European Union by source, legal basis, and territorial scope. This allows isolation of Germany-specific removals based on defamation and personality-rights claims (Article 16 legal complaints) from voluntary removals under platform policy. The study covers June 1 - October 20, 2025, reflecting the six‑month retrieval limit imposed by the DSA API. Cross‑country comparisons across EU member states assess whether Germany’s removal volumes reflect market size or institutional factors consistent with systematic suppression.

To test H2, I evaluate whether removal requests achieve reliably high success rates using complaint-level data from the Lumen Database, which hosts Google's transparency reports on defamation-based takedown requests. Each record identifies targeted review URLs, enabling verification of whether the content remains accessible or has been removed. The sample includes complaints filed October 1 to 20, 2025, with verification conducted on October 31. This ensures a minimum 10-day lag between complaint filing and verification, allowing sufficient time for Google to process removal requests given their reported median processing time of less than one day @google_vlosevlop_2025. 
 
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
  caption: [Share of EU-Wide moderation actions, by source type]
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
    [Other violation of T&C], [12], [$<0.01%$],
    [Consumer Information], [4], [$<0.01%$],
    [Protection of minors], [1], [$<0.01%$],
    [*Total*], [1,514,957], [$100%$]
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
    [Other], [106 #footnote[Out of the 106 other, 91 are applied in a single country, and 2 are applied in two or more jurisdictions, and 23 are applied EU-wide]], [$<0.01%$],
    [*Total*], [1,513,139], [$100%$]
  ),
  caption: [Article 16 ‘Illegal and Harmful Speech’ moderation actions on Google Maps, by country (EU)]
) <a16-mod-actions-by-country>
#set par(leading: 2em, justify: true)

// .The vast majority of Article 16 “Illegal and Harmful Speech” moderation actions occurred in Germany, with only minimal counts reported for other EU member states. To show the composition of Germany’s actions in greater detail, @illegal-reason-breakdown breaks down these moderation actions by the specific legal mechanism invoked.

The vast majority of Article 16 "Illegal and Harmful Speech" moderation actions occurred in Germany, with only minimal counts reported for other EU member states. This concentration reflects reported enforcement activity rather than necessarily the underlying prevalence of contested reviews across jurisdictions. To show the composition of Germany's actions in greater detail, @illegal-reason-breakdown breaks down these moderation actions by the specific legal mechanism invoked.Retry

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

Combined, Germany-specific defamation removals constitute 1,512,595 of the 1,514,957 total Article 16 actions across all categories and jurisdictions (99.84%) #footnote[$1,512,595 div 1,514,957 = 99.84%$]. 

=== Lumen Database

Using a Bernoulli (1%) sampling procedure, each URL within the study period was independently selected with a probability of 0.01, yielding an unbiased representation of the overall population of reviews. This produced a sample of 994 URLs from 98,106 complaints filed during October 1–20, 2025. The URLs were extracted into a spreadsheet and manually checked for whether they remained accessible or had been removed at the time of observation. After removing invalid URLs #footnote[The removed URLs led to an empty google maps page with no deleted review or business] (11 in total), the final sample consisted of 983 URLs. Among the valid URLs, 840 were confirmed removed, yielding a success rate of 85.45%, with a 95% confidence interval of [83.2%; 87.7%] #footnote[Standard error calculated as SE = $sqrt([hat(p)(1-hat(p)) slash n])$ = $sqrt(0.8545(1-0.8545) slash 983) = 0.0112$, yielding a 95% CI of $85.45 plus.minus 1.96 dot (1.12%) = [83.2%; 87.7%] $]
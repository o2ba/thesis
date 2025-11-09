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

The empirical approach combines two complementary data sources to establish both the scale and effectiveness of review suppression. Aggregate removal data from the Digital Services Act Transparency Database @noauthor_dsa_2025 reveals removal volumes in Germany, testing whether substantial deletion activity occurs as hypothesized. Cross-jurisdictional comparison with other EU member states serves as a control: if Germany's removal volumes substantially exceed those of jurisdictions with comparable market structures but different legal frameworks, this rules out the alternative explanation that high deletion rates simply reflect Germany's actual rate of defamatory reviews. Granular complaint-level data from the Lumen Database @lumen_lumen_2025 enables direct measurement of removal success rates through manual verification of whether contested reviews remain accessible after businesses file complaints. This source also reveals the distribution of suppression activity, identifying whether removal requests originate from isolated disputes or reflect concentrated, repeated use by specific businesses. Together, these data test whether suppressive reputation management operates at significant volume in Germany and whether it functions as a reliable tool for businesses seeking to remove negative feedback.

== Sample Collection

=== Digital Services Act Transparency Database

The Digital Services Act requires Very Large Online Platforms to report content moderation decisions through a centralized transparency database, accessible via API to researchers with authorized credentials. Each database entry represents a distinct moderation action: a single piece of content may generate multiple entries if it is subject to successive takedown requests or reinstated and removed again #cite(<google_vlosevlop_2025>, supplement: "§ 2.3"). This structure allows precise tracking of removal activity over time while accounting for the fact that contested content may be moderated multiple times.
Due to system-level constraints in the OpenSearch SQL interface, queries are limited to a 6-month retrieval window. Accordingly, this study focuses on the period June 1 to October 20, 2025, which offers a complete and representative dataset within these technical limits.
The database structure enables granular filtering across several dimensions relevant to this analysis. First, moderation actions are tagged by platform: Google Maps reports separately from other Google services such as Google Ads or Shopping, allowing isolation of point-of-interest review removals specifically. Second, each entry specifies the `source_type`, distinguishing between voluntary removals initiated under Google's own content policies and legal removals prompted by external complaints invoking national law. Third, removal categories identify the stated legal basis, including intellectual property infringement, data protection violations, or illegal and harmful speech. For removals classified as illegal content, the `illegal_content_explanation` field provides further specification, enabling precise identification of defamation-based takedowns. Finally, `territorial_scope` indicates the geographic application of each removal: content deleted exclusively in Germany is tagged with ["DE"], while broader removals spanning multiple jurisdictions carry corresponding arrays. These filtering capabilities make it possible to isolate review removals in Germany that businesses requested through defamation or personality-rights claims, the specific behavior this study seeks to measure.

=== Lumen Database

The Lumen Database, operated by the Berkman Klein Center for Internet & Society at Harvard Law School, archives legal removal requests that platforms voluntarily share to increase transparency in content moderation @lumen_lumen_2025. Google shares defamation-based takedown requests with Lumen, though with limited personal information: for individual complainants, Google typically reports only the request type, reported URLs, country, and date, while withholding the requester's identity. @google_about_2025.

The reported URLs are particularly valuable for this study. They allow us to verify whether the reviews referenced in legal takedown notices remain publicly accessible or have been deleted. Even when a review no longer appears on the platform, the URL structure reveals the associated business through its unique Client ID embedded in the review link. This enables aggregation at the business level, allowing systematic measurement of how frequently individual firms in Germany experience review removals. Like the Digital Services Act Transparency Database, Lumen allows thematic filtering through an API parameter (`topic_facet`), which identifies the legal basis for each request. Because jurisdictional filtering is limited, preliminary selection is performed by language (German), followed by the exclusion of entries not originating in or limited to Germany. This approach may omit non-German-language defamation notices concerning German businesses, but such omissions are unlikely to systematically bias the dataset.

The study focuses on the period from October 1 to October 20, 2025. The shorter window reflects API rate-limit constraints set by Lumen. A random sample was drawn at the URL level, since a single takedown report can reference multiple review URLs. Using a Bernoulli (1%) sampling procedure, each URL within the study period was independently selected with a probability of 0.01, ensuring an unbiased representation of the overall population of reviews. The URLs are extracted into a spreadsheet, and then manually checked if they still exist or if they have been removed at the time of observation (November 1st, 2025). This means that there's a minimum 10-day lag since the last observation. A second spot check was conducted on the 7th of November, but there was no material change in the amount of reviews that were removed, and the data was not subsequently updated.

To efficiently retrieve and process this data within Lumen's rate-limit constraints, the study employs automated infrastructure built using AWS Cloud Development Kit. The architecture consists of several integrated components designed for reliability, scalability, and reproducibility. A Lambda function written in Python serves as the API caller, polling the Lumen API with the following filter parameters: `date_received_facet`, `recipient_name_facet`, `topic_facet`, and `language_facet`. Responses from Lumen are paginated, requiring a page parameter to retrieve the complete dataset for each day. The process is orchestrated by an AWS Step Function, which iterates through the study period (October 1-20, 2025) day by day, handling pagination automatically and implementing exponential backoff and retry logic to respect Lumen's rate limits. Raw API responses are written to Amazon S3 for auditability. Within the Step Function workflow, a second Lambda function performs data normalization. Each Lumen entry contains metadata for a single takedown request alongside an array of reported URLs, often multiple reviews that a business seeks to remove in one complaint. The normalizer flattens this structure so that each URL becomes a separate observation, then applies two filters: retaining only entries where the jurisdictions field contains exclusively `DE` and excluding non-Google Maps URLs. The function also parses the Google Maps Client ID from each URL, which allows for business-level aggregation. Normalized data is written back to S3 in a queryable format. The processed dataset is cataloged using AWS Glue, making it accessible through Amazon Athena's SQL interface. The Bernoulli sampling query is executed in Athena to draw a random sample of URLs for manual verification, ensuring that the labor-intensive task of checking review accessibility remains analytically feasible while maintaining statistical representativeness.



== Sample Description

=== Digital Services Act Transparency Database

/* Applying a date filter (`2025-06-01 to 2025-10-20`), and a platform filter (`Google Maps`), we disaggregate by source to understand the reason that led to the investigation on the relevant content. #cite(<european_comission_regulation_2022>, supplement: "Article 17 (3)(b)")
*/
The Digital Services Act requires platforms to report content moderation decisions by source type, legal basis, and territorial scope. This structure enables the identification of review removals driven by national legal claims rather than platform policies.

@by-source-type disaggregates Google Maps moderation actions during the study period (June 1st, 2025 to October 20th, 2025) by source. Article 16 removals represent actions taken in response to external legal complaints invoking national law, as distinct from voluntary removals under Google's uniform content policies #cite(<european_comission_regulation_2022>, supplement: "Article 17 (3)(b)")


#set par(leading: 1em, justify: false)

/* select source_type, count(*) as decision_count from statement_index where received_date between '2025-06-01' and '2025-10-20' and platform_name = 'Google Maps' group by source_type */

#figure(
  table(
    columns: (1fr, 1fr, 100pt),
    table.header([Source Type], [Total Removals], [%]),
    [Voluntary], [23,049,578], [$93.82%$],
    [Article 16], [1,514,957], [$6.17%$],
    [Other Type Notification], [985], [$< 0.01%$],
    [*Total*], [24,565,520], [$100%$],
  ),
  caption: [Google Maps moderation actions by source type]
) <by-source-type>

#set par(leading: 2em, justify: true)

Table 2 disaggregates Article 16 removals by decision ground, the high-level legal category platforms cite when removing content:


#set par(leading: 1em, justify: false)

/* select category, count(*) as decision_count from statement_index where received_date between '2025-06-01' and '2025-10-20' and platform_name = 'Google Maps' and source_type = 'SOURCE_ARTICLE_16' group by category */

#figure(
  table(
    columns: (1fr, 1fr, 100pt),
    table.header([Decision Ground], [Total Removals], [%]),
    [Illegal or harmful speech], [1,513,139], [$99.88%$],
    [Intellectual property infringements], [1,772], [$0.1%$],
    [Data protection and privacy violations], [29], [$< 0.01%$],
    [Other violation of T&C #footnote[Terms and Conditions]], [12], [$<0.01%$],
    [Consumer Information], [4], [$<0.01%$],
    [Protection of minors], [1], [$<0.01%$],
    [*Total*], [1.514.957], [$100%$]
  ),
  caption: [Google Maps article 16 moderation actions by category]
)

#set par(leading: 2em, justify: true)

Illegal or harmful speech, which encompasses defamation and personality-rights claims, accounts for 99.88% of Article 16 removals. Table 3 shows the territorial distribution of these removals:


#set par(leading: 1em, justify: false)

/* select count(*) as decision_count from statement_index where received_date between '2025-06-01' and '2025-09-31' and platform_name = 'Google Maps' and source_type = 'SOURCE_ARTICLE_16' and category = 'STATEMENT_CATEGORY_ILLEGAL_OR_HARMFUL_SPEECH' and territorial_scope = 'de'  */

#figure(
  table(
    columns: (1fr, 1fr, 100pt),
    table.header([Country], [Total Removals], [%]),
    [Germany], [1,512,700], [99.97%],
    [France], [101], [0.01%],
    [Spain], [99], [0.01%],
    [Poland], [74], [$<0.01%$],
    [Austria], [49], [$<0.01%$],
    [Other], [91], [$<0.01%$],
    [*Total*], [1.513.114 #footnote[The total of 1.513.114 here does not match the total removals for illegal and harmful and speech (1.513.139) by 25 removals as those removals are multi-jurisdiction, so they are not captured in the query]], [$100%$]
  ),
  caption: [Google Maps Article 16 Illegal and Harmful Speech, By Country (EU)]
)
#set par(leading: 2em, justify: true)

Table 4 further disaggregates Germany's illegal and harmful speech removals by the specific legal mechanism invoked:

#set par(leading: 1em, justify: false)

/* select count(*) as decision_count from statement_index where received_date between '2025-06-01' and '2025-09-31' and platform_name = 'Google Maps' and source_type = 'SOURCE_ARTICLE_16' and category = 'STATEMENT_CATEGORY_ILLEGAL_OR_HARMFUL_SPEECH' and territorial_scope = 'de'  */

#figure(
  table(
    columns: (1fr, 1fr, 100pt),
    table.header([Decision Ground (Detailed)], [Total Removals], [%]),
    [Defamation], [1,512,595], [$99.99%$],
    [Court Order], [105], [$0.01%$],
    [*Total*], [1,512,700], [$100%$]
  ),
  caption: [Google Maps Article 16 illegal and harmful speech, by detailed decision ground]
)
#set par(leading: 2em, justify: true)

Combined, Germany-specific defamation removals constitute 1,512,595 of the 1,514,957 total Article 16 actions across all categories and jurisdictions (99.84%) #footnote[$1,512,595 div 1,514,957 = 99.84%$]. No significance is conducted as Germany's figures are orders of magnitude #footnote[$log_10 (1,512,700 div 100) = 4.1797$. Comparable by population (France, Spain, Poland)] higher than comparable countries 


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

To assess the concentration of filing activity, we rank businesses by complaint volume and identify the minimum number of businesses whose cumulative complaints account for 25%, 50%, and 75% of all removal requests.  @lumen-aggregation shows the results of this analysis.

#set par(leading: 1em, justify: false)
#figure(
  table(
    columns: (1fr, 1fr, 1fr),
    table.header([Quartile], [Total Businesses], [Cumulative Complaints]),
    [$25%$], [144], [24,686],
    [$50%$], [665], [49,553],
    [$75%$], [2,227], [73,716]
  ),
  caption: [Requesting businesses, quartile distribution by complaint volume]
) <lumen-aggregation>
#set par(leading: 2em, justify: true)

A random sample of 994 URLs (representing 1% of the total population) was drawn to analyze removal rates. After excluding 11 invalid entries, the final valid sample comprised 983 URLs. The observation of whether the data was removed was made on October 31st. Among the 983 valid URLs, 840 were confirmed removed, yielding a success rate of 85.45%, with a 95% confidence interval of [83.2%; 87.7%] #footnote[Standard erorr calculated as SE = $sqrt([hat(p)(1-hat(p)) slash n])$ = $sqrt(0.8545(1-0.8545) slash 983) = 0.0112$, yielding a 95% CI of $85.45 plus.minus 1.96 dot (1.12%) = [83.2%; 87.7%] $]

These thresholds define four distinct business categories based on filing intensity: high-volume filers (top 144 businesses accounting for 25% of complaints), medium-high filers (ranks 145-665, representing the next 25% of complaints), medium-low filers (ranks 666-2,227, representing the next 25% of complaints), and occasional filers (all remaining businesses accounting for the final 25% of complaints). To determine whether r emoval success rates vary systematically across these categories, each sampled review URL was classified according to its associated business's filing volume category. 



/* Because defamation standards vary across jurisdictions, examining Germany's Article 16 volume in context provides a control for alternative explanations of high removal activity. */



/*

== Research Design and Comparative Strategy

This study follows a two‑stage empirical design to test whether institutional environments enable systematic suppressive reputation management. Stage 1 evaluates whether defamation‑based review removals occur at scale and with high enforcement rates in jurisdictions where legal and procedural preconditions align. This tests H1, assessing whether suppression functions as a context‑specific capability rather than a universal platform behavior.

Stage 2 examines reputational outcomes by comparing average Google Maps ratings for firms with and without access to effective suppression infrastructure. Specifically, ratings of German businesses that file Article 16 DSA takedown requests are compared with matched French firms operating under comparable market conditions but lacking equivalent institutional enablement (H2).


== Data Sources

The analysis draws on three primary data sources. The first is the Transparency Database @noauthor_dsa_2025, which compiles standardized disclosures submitted by Very Large Online Platforms in accordance with Articles 15–24 of the Digital Services Act @european_comission_regulation_2022. The dataset records formal removal actions reported under Article 16, corresponding to the notice‑and‑action mechanism through which platforms take down content in response to legal complaints. It documents cases where action was taken but does not include rejected or pending notices. Within this dataset, the study isolates entries concerning Google Maps to quantify the volume of formal removal actions based on personal‑rights and defamation claims. An API is provided for this dataset which allows querying the last 6 months.

The second data source is the Lumen Database @lumen_lumen_2025. The database is a voluntary initiative subscribed to by Google, who reports their legal takedown request to. The dataset provides us with a dataset of reports, their applicable jurisdiction, and the applicable review URL.

The third and last data source is complementary to the Lumen Database, which is Google itself. Through the review URLs, we're able to determine which businesses are affected by the review removals. For this, we will use the Google Places Legacy API, as it allows us to query by cID rather than Place ID, which is what we're able to extract 

== Sample Collection

The Transparency Database represents a population‑level source and therefore requires no sampling procedure. All Article 16 removal actions disclosed by Google Maps between June and September 2025 are included, providing a full enumeration of actioned notices for this period. SQL queries and cURL requests used to extract and filter relevant records are documented in Appendix A, and the resulting dataset is summarized in Section @sd

The Lumen Dataset involves multiple steps and code fragments which capture collection of  

== Sample Description <sd>

The first column of interest to us is the `source_type`. This describes whether a removal was voluntary (TOS violation, automatic detection, etc.) or whether it was due to an Article 16 action-and-notice removal. We will group by this column at first to understand the totals within the different groups

#figure(
  table(
    columns: (1fr, 100pt, 100pt),
    table.header([], [$Sigma$], [$%$]),
    [*SOURCE_VOLUNTARY*], [$20,706,257$], [$93.63%$], 
    [*SOURCE_ARTICLE_16*], [$1,406,799$], [$6.36%$], 
    [*SOURCE_TYPE_OTHER_NOTIFICATION*], [$843$], [$< 0.01%$],
    [$Sigma$], [$22,113,899$], [$100%$]
  ),
  caption: [Removal actions in the European Union by Google Maps, disaggregated by removal type]
) <a16-notices>


To interest of us are the Article 16 removals, which are affected by institutions - Non-Article 16 removals generally relate to ToS violations, which are generally identical in all EU jurisdictions. To entirely dismiss voluntary removals, we queried on the `territorial_scope` column, which identifies the territories this removal applies to, to get the number of voluntary removals which are applicable in all countries, which yielded 20,565,811, or 99.32% of all voluntary removals.

Article 16, however, tells a different story. Running an identical query on the category yielded only 1,169 results which apply to all jurisdictions, while running the query to check for Germany-only yielded 1,404,935 results, or 99.86% of all removals in the study period


*Lumen*

2 Jun (Mon)
14 Jun (Sat)
25 Jun (Wed)
4 Jul (Fri)
14 Jul (Mon)
6 Aug (Wed)
17 Aug (Sun)
28 Aug (Thu)
9 Sep (Tue)
19 Sep (Fri)

107996 ALL
107988 DE (8 non-DE only)
4 FR
2 GR
1 AT
1 IT

/*
TODOODODODODODOODODODODOODODODODDODODODOODDO

Due to system-level constraints in the OpenSearch SQL interface of the Digital Services Act transparency database, queries are limited to a 6‑month retrieval window. Accordingly, this study focuses on the period June–September 2025, which offers a complete and representative dataset for analysis within these technical limits.”

The Lumen Database (#cite(<lumen_lumen_2025>, form: "year")) archives copies of takedown requests submitted to platforms, including substantive notice content that the Transparency Database omits. To construct a representative sample of takedown requests for detailed analysis, we implemented daily sampling throughout June 2025. For each day of the month, data was accessed via Lumen's API with filters `topic_facet=Defamation`, `recipient_name_facet=Google LLC`, and `country_facet=de` for Germany or `country_facet=fr` for France. This daily sampling strategy captures variation across the month while maintaining computational feasibility, as comprehensive enumeration of all historical notices would require processing hundreds of thousands of requests. API responses return structured JSON containing notice metadata including submission dates, complainant information where disclosed, and critically, arrays of allegedly defamatory review URLs that complainants sought to remove. Raw JSON payloads are stored in Amazon S3 for reproducibility.

Review URLs returned by Lumen do not directly contain place IDs identifying the business subject to the takedown request. Instead, URLs contain encoded review identifiers embedded in the query parameters. To extract place IDs, we submit HTTP GET requests for each review URL and parse the HTML response. The HTML source contains the place ID attribute that uniquely identifies the business establishment. Importantly, this place ID is present in the HTML regardless of whether the review is still active or has been removed by Google. This allows us to accomplish two objectives: first, we can determine which reviews were actually removed (calculating the enforcement rate), and second, we can collect the place IDs of businesses that filed takedown requests. Place IDs were deduplicated within and across notices to create unique requester sets per jurisdiction, forming the treatment group for H2 analysis.

For businesses identified through this place ID extraction process, current reputation metrics were collected via Google's Places API. The API accepts place IDs as input and returns structured JSON containing rating, user_ratings_total, types (business category), geometry.location (coordinates), and parsed address components. API calls were executed programmatically with exponential backoff for rate-limit handling and response caching to minimize redundant requests. Places API data enables three critical analyses: characterization of requester businesses by sector and scale, construction of matched comparison groups, and verification that place IDs remain active and have not been delisted. Importantly, Places API returns current reputation metrics as of the query date (October 2025), not historical ratings at the time takedown requests were filed, a temporal asymmetry that constrains causal inference but remains appropriate for testing H2's descriptive prediction.

== Sample Construction

The analytical sample is constructed through sequential filtering and cross-source integration executed within Snowflake's data warehouse environment. From approximately 150 million total Transparency Database decisions loaded into the raw ingestion table, SQL transformations retained only records meeting three criteria: platform_name matching Google Maps identifiers, source_type = "ARTICLE_16" indicating user-initiated legal complaints rather than platform-initiated moderation, and territorial_scope indicating EU member states. The transformation query parsed nested JSON structures and engineered derived variables to enable subsequent filtering and aggregation. An isDefamation flag was computed through boolean logic identifying decisions where either illegal_content_explanation equaled "Defamation" or incompatible_content_ground contained the substring "defamation", capturing defamation citations regardless of whether they invoked statutory illegality or platform policy grounds. An isGermanyOnly flag marked decisions where territorial_scope arrays contained exclusively the ISO code "DE", isolating Germany-specific enforcement from EU-wide or multi-jurisdictional actions.

-- TBD FOR LUMEN. 


== Sample Description

-- TBD.

== Variable Operationalization and Measurement

-- TBD.

== Statistical Analysis

-- TBD.

== Limitations and Interpretive Constraints

-- TBD.
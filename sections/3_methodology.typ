= Methodology


== Research Design and Comparative Strategy

This study follows a two‑stage empirical design to test whether institutional environments enable systematic suppressive reputation management. Stage 1 evaluates whether defamation‑based review removals occur at scale and with high enforcement rates in jurisdictions where legal and procedural preconditions align (In our case, we're testing Germany). This tests H1, assessing whether suppression functions as a context‑specific capability rather than a universal platform behavior.

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
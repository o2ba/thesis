= Methodology


== Research Design and Comparative Strategy

This study employs a two-stage empirical strategy to examine whether institutional environments enable systematic suppressive reputation management. First, it tests whether defamation-based review removals occur at scale and with high enforcement rates in jurisdictions where legal and procedural preconditions align, establishing suppression as a functional, market-specific capability rather than a universal platform feature (H1). Second, it analyzes rating patterns to determine whether firms with access to effective suppression infrastructure, specifically German businesses filing takedown requests, exhibit higher average ratings than matched firms in a comparable market lacking such institutional entablement, represented by France (H2).


== Data Sources and Collection

Two data sources are drawn from for this study: The Transparency Database, 



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
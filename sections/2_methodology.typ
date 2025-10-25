#import "@preview/glossy:0.8.0": theme-compact
#import "@preview/glossy:0.8.0": *
#import "../glossary.typ": dsaGlossary

#show: init-glossary.with(dsaGlossary)

= Data and Methodology

== Transparency Reports

Google, pursuant to the @dsa, publishes biannual transparency reports. These are available as PDFs on their transparency center @google_google_2025. The periods published, and their respective duration in days at the time of writing are:

- *R1:* August 28th, 2023 to September 10th, 2023 - 14 days @google_vlosevlop_2023
- *R2:* September 11th, 2023 to February 29th, 2024 - 172 days @google_vlosevlop_2024-2
- *R3:* March 1st, 2024 to June 30th, 2024 - 123 days @google_vlosevlop_2024-1
- *R4:* July 1st, 2024 to December 31st, 2024 - 184 days @google_vlosevlop_2024
- *R5:* January 1st, 2025 to June 30th 2025 - 181 days @google_vlosevlop_2025

The following variables were extracted from these reports to gather information about moderation volume and resources. Only Google Maps data is extracted:

1. *Article 16 notices submitted (Total, Defamation):* number of notices submitted by EU‑based users or entities, disaggregated by type of alleged illegal content and by service.

2. *Actions pursuant to Article 16  (Total):* Number and basis of actions taken in response to Article 16 notices, by service. Note that more than one action can be taken a single Article 16 notice, we therefore cannot infer percentage of enforcement.

3. *Human moderation resources:* number of human moderators evaluating content, broken down by language and by service.

4. *Median time to take action on Article 16 notices* median number of days from Article 16 notice to action.

Because the published transparency reports vary in duration, all notice and action counts were normalized to a standard period length. For interpretability, results are expressed as the estimated number of notices or actions per 180 days (approximately the duration of a regular @dsa transparency reporting cycle). The R1 report @google_vlosevlop_2023 appears to be a test report, with a duration of merely 14 days, we will therefore exclude this report from our research.

The processed values and normalization calculations are compiled in a supplementary dataset created by the author for this study @obari_google_2025. The dataset consolidates all extracted indicators from the Google's @dsa transparency reports and formulas used for normalization, and is publicly available via Google Sheets.


== Transparency Database

To obtain more granular geographical and temporal distribution of removal actions, this study leverages the @tdb. The @tdb contains structured metadata about each moderation decision, including:

- The *type of content* moderated
- The *territorial scope* of the decision (EU-wide, multi-country or country-specific)
- The *legal or contractual ground* cited, if applicable (e.g., defamation)
- *Whether automated means were used* in detection or decision-making

Data from the @tdb were obtained in compressed Parquet format via the European Commission's public interface. A Python worker @obari_eu_2025 automated the download, decompression and initial filtering of each daily dataset, retaining only records associated with Google Maps. The processed data was uploaded to Snowflake, the data warehouse used for this research.

After full ingestion of all available @tdb parquet records, from 25 September 2023 through 30 June 2025, the dataset contained approximately 158.7 million rows ($approx 4.2$ GB) representing individual Google Maps moderation decisions.

Within Snowflake, only moderation submitted under Article 16 @dsa were retained (`source_type="ARTICLE_16"`), excluding voluntary removals initiated by Google (`source_type="SOURCE_VOLUNTARY"`). The resulting analytic table, `sor_article_16`, was enriched with several derived variables to enable later aggregation and filtering:
- `isDefamation`: Flag identifying decisions citing defamation as legal or incompatible-content ground;
- `isGermanyOnly`: Boolean flag indicating that a given enforcement decision is limited to Germany only.
- `report_period`: Categorical field assigning each record to the @dsa reporting cycles (R1-R5), this corresponds to the periods of the VLOSE/VLOP Report being published.

All type‑casting, normalization, and feature‑engineering steps were executed directly in Snowflake SQL to ensure reproducibility and consistent schema management. The final table structure served as the foundation for the temporal and geographic analyses presented in the subsequent sections. All analytical queries are found in the appendix.

Apart from light filtering and type casting in Snowflake, no major cleaning or de‑duplication procedures were necessary. As the dataset mirrors platform‑submitted statements of reasons, it reflects platform reporting activity rather than regulatory determinations or verified illegal content.

The @tdb provides case‑level granularity that complements the aggregate figures published in Google’s biannual transparency reports, which allows patterns observed at the report level to be tested against individual enforcement records.

The individual @sor and corresponding enforcement decisions contained in the @tdb are fully anonymized. As a result, the dataset does not include information that would allow inference about the underlying business type, review score, user identity, or review category.

#pagebreak()

== Lumen Database

The Lumen Database is a database that companies voluntary report legal takedown requests to. Google is a participant of this program and shares their defamation requests (*citation needed*). With the research API, we're able to query a sample of removed requests, which includes the URLs to the businesses. This will help us understand, out of a random sample of requests, what the proportion of data removed is.

Representative sampling of Lumen Database entries is critical for accurately reflecting the nature of Google Maps defamation removals. This study utilizes a stratified random sampling methodology that begins with the @tdb's `sor_article_16` table, specifically filtered for Article 16 actions related to Germany and defamation. From this granular dataset, random timestamps are selected, with the probability of selection for any given time proportional to the volume of enforcement actions recorded by the @tdb during that period.

A key consideration for linking TDB data to Lumen entries is the inherent processing delay. Since the @tdb records the *date an action was taken* on an Article 16 notice, while Lumen documents the *date a removal request is published*, a temporal adjustment is necessary. Therefore, each selected timestamp from the @tdb is lagged by the median time identified for Google to process an Article 16 notice. This adjustment aligns the sampled Lumen entries to the actual underlying moderation events, accounting for the typical time window between action and public reporting.




#pagebreak()


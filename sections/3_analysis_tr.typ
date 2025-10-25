#import "@preview/glossy:0.8.0": theme-compact
#import "@preview/glossy:0.8.0": *
#import "../glossary.typ": dsaGlossary

#show: init-glossary.with(dsaGlossary)


== Total Article 16 Notices Submitted to Google Maps

@a16-notices summarizes the number of Article 16 notices submitted to Google Maps under the @dsa across reporting periods R2 to R5. The column _Total A16 Notices_ represents all user or entity submissions under Article 16 within each period, while _Defamation A16 Notices_ isolates those explicitly citing defamation as the legal ground for removal. The final column reports the proportion of defamation‑related notices relative to all Article 16 notices.

#figure(
  table(
    columns: (48pt, 1fr, 1fr, 1fr),
    table.header([Report], [Total A16 Notices], [Defamation A16 Notices], [% Defamation]),
    [R2], [$219,497$], [$215,379$], [$98.12%$],
    [R3], [$230,511$], [$228,714$], [$99.22%$],
    [R4], [$483,391$], [$480,110$], [$99.32%$],
    [R5], [$935,387$], [$930,825$], [$99.51%$],
  ),
  caption: [Article 16 Notices Submitted to Google Maps]
) <a16-notices>

From this data, we can infer that the vast majority of Article 16 notices submitted to Google Maps are notices/complaints for Defamation. 

=== Normalized Article 16 Notices

To ensure comparability between reporting periods of unequal duration, the number of Article 16 notices was normalized to represent estimated values per 180 days - approximately the length of a standard DSA transparency reporting cycle. 

$ N_180 = N_t * 180/t $

#figure(
  table(
    columns: (50pt, 1fr, 1fr, 1fr),
    table.header([Report], [Total A16 Notices], [Defamation A16 Notices], [$Delta$ Defamation #footnote[Percentage change relative to previous reporting period]]),
    [$"R2"_n space $ #footnote[Subscript n indicates normalized values per 180 days] <nss>], [$229,706$], [$225,397$], [$dash$],
    [$"R3"_n$], [$337,333$], [$334,703$], [$48.49%$],
    [$"R4"_n$], [$472,883$], [$469,673$], [$40.32%$],
    [$"R5"_n$], [$930,219$], [$925,682$], [$97.09%$],
  ),
  caption: [Article 16 Notices Submitted to Google Maps, normalized to 180 days]
) <a16-notices-normalized>

The normalized data in @a16-notices-normalized shows a clear upward trend in defamation-related Article 16 notices becomes evident across the reporting periods. After adjusting for differences in reporting duration, defamation complaints increased by roughly 48% between R2 and R3, 40% between R3 and R4, and nearby doubled (97%) between R4 and R5. This consistent growth reflects a sharp rise in the volume of user and entity submissions under Article 16 @dsa, indicating that the notice‑and‑action mechanism is being used with growing frequency to address allegedly defamatory content. This sets the stage for later geographic analysis.

== Number of actions taken in response to Article 16 notices, by basis of action

@a16-actions summarizes the number of actions taken in response to Article 16 notices, disaggregated by the basis of the action. Actions may be taken on legal grounds, for example when content is found to violate statutory provisions such as defamation law, or on policy grounds, when content breaches Google's internal content or service policies @google_vlosevlop_2023 @google_vlosevlop_2024-2  @google_vlosevlop_2024-1 @google_vlosevlop_2024 @google_vlosevlop_2025. Accordingly, the table reflects the total number of enforcement actions rather than the unique number of Article 16 notices actioned on.

#figure(
  table(
    columns: (48pt, 1fr, 1fr, 1fr),
    table.header([Report], [Legal Ground], [Policy Ground], [% Legal]),
    [R2], [$312,788$], [$14,912$], [$95.44%$],
    [R3], [$330,682$], [$12,471$], [$96.37%$],
    [R4], [$591,984$], [$15,647$], [$97.42%$],
    [R5], [$919,363$], [$14,830$], [$98.41%$],
  ),
  caption: [Actions taken in response to Article 16 notices, by basis of action]
) <a16-actions>

According to all reporting periods, the overwhelming majority of Article 16 related actions are taken on legal grounds rather than policy grounds. This outcome is not unexpected: Article 16 of the @dsa explicitly governs responses to the allegations of illegality, making legal assessments its central function. Consequently, the high proportion of legal-ground actions should be understood as a reflection of the regulatory scope of the @dsa, rather than as limited policy enforcement by Google.

#pagebreak()

=== Normalized number of actions taken

@a16-actions-normalized presents the number of actions taken in response to Article 16 notices normalized to a standard 180-day reporting period. As in earlier sections, actions are grouped by their basis, legal or policy. A $Delta$ *Legal* column has been computed and represents the percentage change in legal-ground actions relative to the preceding period.

#figure(
  table(
    columns: (48pt, 1fr, 1fr, 1fr),
    table.header([Report], [Legal Ground], [Policy Ground], [$Delta$ Legal]),
    [R2], [$327,336$], [$15,606$], [$dash$],
    [R3], [$487,891$], [$18,400$], [$49.05%$],
    [R4], [$579,115$], [$15,307$], [$18.7%$],
    [R5], [$914,284$], [$14,748$], [$57.88%$],
  ),
  caption: [Actions taken in response to Article 16 notices, by basis of action, normalized to 180 days]
) <a16-actions-normalized>

The normalized data shows a steady increase in the number of legal-ground actions across reporting periods, broadly mirroring the upward trend in defamation-related Article 16 notices submitted to Google Maps (@a16-notices-normalized). Between R2 and R3, the increase in notice submissions ($Delta 48.05%$) closely matches the rise in legal-ground actions ($Delta 49.05%$), however, the trends diverge, with notice submissions rising more sharply than corresponding actions. This indicates that while Article 16 activity continues to expand, its output in the form of individual legal actions grows at a comparatively slower pace.

When the normalized number of actions is compared with the number of Article 16 notices submitted (@a16-notices; @a16-notices-normalized), it appears that fewer actions are being taken per notice over successive reporting periods. This pattern could point to a tightening of enforcement criteria (i.e., lower enforcement rate) or to a change in the composition of Article 16 submissions, such as a shift from bulk, multi-URL complaints toward a higher volume of individual defamation reports. Given that Google's reported median time to action has remained consistently below one week @google_vlosevlop_2023 @google_vlosevlop_2024-2 @google_vlosevlop_2024-1 @google_vlosevlop_2024 @google_vlosevlop_2025, a processing backlog on the platform's side appears unlikely. 

== Number of moderators by language

@mods presents the number of Google Maps content moderators assigned the main EU languages (German, French, Spanish and Italian) across reporting periods R2 to R5. These figures represent moderators who were available to review content in each respective language, not unique individuals. Because some reviews are multilingual, the counts may include overlap between languages. The data nonetheless provides an indication of the relative distribution of moderation resources.

#figure(
  table(
    columns: (48pt, 1fr, 1fr, 1fr, 1fr),
    table.header([Report], [German], [French], [Spanish], [Italian]),
    [R2], [$108$], [$38$], [$19$], [$12$],
    [R3], [$121$], [$37$], [$23$], [$13$],
    [R4], [$100$], [$39$], [$22$], [$17$], 
    [R5], [$128$], [$36$], [$21$], [$16$]
  ),
  caption: [Number of Google Maps moderators, by reporting period and language]
) <mods>

At first glance, German stands out with significantly more moderators than the other major EU languages. To understand whether this reflects a genuinely disproportionate allocation of resources, these figures need to be considered in relation to the size of each language community within the EU. We will use the Eurobarameter Survey "Europeans and their languages" @european_commission_special_2024, which provides the percentage of EU Citizens who have a given language as their mother tongue.

#figure(
  table(
    columns: (80pt, 1fr, 1fr, 1fr, 1fr),
    table.header([], [German], [French], [Spanish], [Italian]),
    [*% Speakers*], [$19%$], [$15%$], [$9%$], [$13%$],
    
  ),
  caption: [Percentage of EU citizens which have a given language as their mother tongue]
) <speakers-percentage>

To compare moderation resources across languages while controlling for language-community size, each moderator count $M_L$ is divided by its share of EU citizens who speak that language as their mother tongue $S_L$. This yields a moderation-intensity measure ($I_L$) per language:

$ I_L = M_L/S_L $

To present the results in an easily interpretable form, we compute the ratio of German‑language moderators to each comparison language. For example, a value of $1:2$ for French indicates that, after adjusting for language‑community size, German has twice as many moderators per native speaker as French.

$ "Adjusted Ratio"_(L:"German") = 1: I_"German" / I_L = 1: (M_"German" div S_"German") / (M_L div S_L) $

#figure(
  table(
    columns: (48pt, 1fr, 1fr, 1fr, 1fr),
    table.header([Report], [German], [French], [Spanish], [Italian]),
    [R2], [$1:1$], [$1:1.2$], [$1:2.7$], [$1:6.2$],
    [R3], [$1:1$], [$1:2.6$], [$1:2.5$], [$1:6.4$],
    [R4], [$1:1$], [$1:2$], [$1:2.2$], [$1:4$], 
    [R5], [$1:1$], [$1:2.8$], [$1:2.9$], [$1:5.5$]
  ),
  caption: [Number of Google Maps moderators, by reporting period and language]
) <mods-ratio-adjusted>

@mods-ratio-adjusted presents the moderation intensity ratios adjusted for proportion of EU citizens who speak each language as their mother tongue. The adjusted values show that, even accounting for language-community size, German continues to have a distinctly higher concentration of moderators than the other major EU languages across all reporting periods.  The relative proportions fluctuate slightly between reports but display a stable overall pattern, suggesting that language size alone does not explain Google's allocation of moderation resources. However, these figures should be interpreted cautiously, as they represent headcounts rather than working hours or contract types, meaning differences in part-time staffing or overlap across languages could influence the apparent imbalance.
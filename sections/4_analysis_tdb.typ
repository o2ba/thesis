#import "@preview/glossy:0.8.0": theme-compact
#import "@preview/glossy:0.8.0": *
#import "../glossary.typ": dsaGlossary

#show: init-glossary.with(dsaGlossary)

== Geographic Analysis of Defamation Removals

This section examines the geographic distribution of defamation-related removals under Article 16 @dsa, building on the prior analysis of trends in notices and actions. While preceding sections established that defamation constitutes nearly all Article 16 @dsa moderation activity on Google Maps and that total report volumes have risen over time, these patterns alone do not indicate whether enforcement is evenly distributed across the Union.

@geographic-analysis shows the total number and relative share of defamation-related enforcement decisions in the @tdb, disaggregated by territorial scope.

#figure(
  table(
    columns: (1fr, 1fr, 1fr),
    table.header([Territorial Scope], [Total Defamation Removals], [% Total]),
    [DE], [$1,484,595$], [$99.85%$],
    [BE], [$1,026$], [$0.069%$],
    [AT], [$432$], [$0.029%$],
    [IE], [$402$], [$0.027%$], 
    [Other], [$363$], [$0.024%$]

  ),
  caption: [Distribution of defamation‑related enforcement decisions by territorial scope]
) <geographic-analysis>

The data confirm that removals are overwhelmingly concentrated in Germany, which accounts for nearly 1.48 million ($approx 99.85%$) of all country‑specific statements of reason issued under Article 16. Other member states together represent $approx 0.24%$ of recorded cases. This pattern demonstrates that defamation enforcement under the @dsa is not an EU‑wide phenomenon, but rather one largely localized within the German jurisdictional and legal context.

== Automation of Article 16 decisions

To assess the degree of automation in enforcement activity under Article 16, the distribution of decision types was examined by their recorded automation status. The dataset distinguishes between decisions taken fully automatically, partially automatically, and those made without automation. Comparing these categories across defamation and non‑defamation cases enables an evaluation of the extent to which human moderation remains integral to Article 16 enforcement processes. @automation presents the results.


#figure(
  table(
    columns: (1fr, 1fr, 1fr, 1fr),
    table.header([Decision Type], [Not Automated], [Partially Automated], [Fully Automated]),
    [Defamation], [$91.40%$], [$8.43%$], [$0.17%$],
    [Non-Defamation], [$99.85%$], [$0.14%$], [$0.01%$],
  
  ),
  caption: [Automation status of Article 16 decisions on Google Maps, by decision type]
) <automation>

The data show that almost all Article 16 decisions concerning defamation are processed manually. More than 91 percent of defamation cases were classified as not automated, while fewer than 9 percent involved any automated component. This pattern corresponds with the higher number of German‑language moderators observed in Google’s transparency reports and the fact that the overwhelming majority of defamation removals occur in Germany. Together, these findings suggest that Article 16 defamation enforcement is predominantly a human‑driven activity, relying on manual legal and linguistic assessment rather than automated systems.


#show table.cell.where(y: 0): strong
#set table(
  inset: (x, y) => if y == 0 { (x: 8pt, y: 8pt) } else { (x: 10pt, y: 10pt) },
  stroke: (x, y) => if y == 0 {
    (bottom: 0.7pt + black)
  },
  align: left
) 

= Results

== Removal Success Rates (H1)

Hypothesis 1 predicted that review removal requests in Germany would achieve reliably high success rates once filed, reflecting platform incentives to minimize liability exposure rather than case-by-case adjudication of claim legitimacy.

=== Statistical Testing

Given platform liability incentives and German legal precedents requiring mandatory investigation of disputed reviews, I predict that removal requests will achieve reliably high success rates once filed. However, I must operationalize what constitutes "reliably high" in this context. The critical threshold is the success rate at which filing becomes strategically rational for businesses regardless of claim strength. If success rates remain around 50–60%, businesses face meaningful uncertainty: filing is only worthwhile when they possess strong evidence or confidence in their claim's merit. The expected value of contesting a marginal or weak case remains negative, limiting filing to clearly defensible disputes. By contrast, success rates approaching 70–80% shift the strategic calculus. At this level, even businesses with uncertain or weak claims can rationally expect approval, making filing worthwhile for virtually any negative review. This degree of predictability converts removal from selective legal remedy into routine reputation management tool. I therefore test whether observed removal rates exceed 70%, the threshold at which strategic use becomes rational even for marginal claims:

-- $H_0$: The removal rate $p <= 0.70$

-- $H_1$: The removal rate $p > 0.70$

#set footnote(numbering: "*")

The 70% benchmark used to define “reliably high” outcomes was determined after preliminary data exploration rather than pre‑registered in advance. Accordingly, this test should be interpreted as exploratory and descriptive rather than confirmatory.

Of the 983 verified URLs, 840 were removed, yielding an observed removal rate of $hat(p) = 0.8545$ (85.45%) with 95% CI of [83.2%, 87.7%] #footnote[Standard error calculated as SE = $sqrt([hat(p)(1-hat(p)) slash n])$ = $sqrt(0.8545(1-0.8545) slash 983) = 0.0112$, yielding a 95% CI of $85.45 plus.minus 1.96 dot (1.12%) = [83.2%; 87.7%] $]. Because multiple reviews in the sample can target the same business (businesses receive a median of roughly seven removal requests) with a highly right-skewed distribution, individual observations may not be fully independent.

To determine whether this rate represents reliably high success, I conducted a one-sample proportion test with a null hypothesis that the true removal rate equals 0.70. Under this null, the standard error is $"SE" = 0.0146$ #footnote[$sqrt(p_0 dot (1-p_0) slash n) = sqrt(0.70 dot 0.30 slash 983) = 0.0146$]. The corresponding test statistic is $z = (hat(p) - p_0) slash "SE" = (0.8545 - 0.70) slash 0.0146 = 10.58$. he one-tailed p-value corresponding to $z=10.58$ under the standard normal distribution is less than 0.001 $$, indicating that the probability of observing such a high success rate by chance under the null hypothesis is vanishingly small. The one-tailed $p < 0.001$ in both instances. As a robustness check, we test alternative thresholds of 0.75 ($z = 7.60$) and 0.80 ($z = 3.95$), where the one-tailed $p < 0.001$ in both instances.

/* Before interpreting this result, we must address whether selection bias could account for the observed success rate. If German businesses simply file only the most meritorious claims while businesses elsewhere pursue removals indiscriminately, high success rates might reflect claim quality rather than institutional factors. To evaluate this alternative explanation, I examine whether removal volumes under legal reasons in Germany are anomalous compared to other EU jurisdictions operating under identical legal and reporting frameworks.

During the same observation period (October 1–20, 2025), the DSA Transparency Database records 107,988 content moderation actions on Google Maps in Germany stemming from Article 16 legal notices, compared to just 8 such actions across all other EU member states combined. Germany accounts for 99.99% of legally motivated review removals despite representing only 19% of the EU population @eurostat_population_2025. This concentration is inconsistent with the selection bias hypothesis: if businesses universally possess the capacity to identify meritorious claims before filing, similar removal patterns should appear across jurisdictions with comparable platform usage and legal frameworks. The near-complete absence of removal activity elsewhere suggests that Germany's institutional environment, rather than superior claim, quality drives the observed pattern. */

We therefore reject $H_0$ at conventional significance levels $(z = 10.58, p < 0.001)$. The observed removal rate of $85.45%$ significantly exceeds the $70% $ threshold.


=== Interpretation

The $85.45%$ removal rate $[95% "CI": 83.2%, 87.7%]$ is consistent with businesses being able to reliably expect their removal requests to succeed. The confidence interval's lower bound of $83.2%$ indicates that even under conservative estimation, more than four out of five removal requests succeed. 

From a business decision-making perspective, an 85% success rate transforms removal from uncertain legal remedy into predictable procedural outcome. Negativity bias means that removing a single one-star review prevents more revenue loss than soliciting several five-star reviews generates @chevalier_effect_2006. When businesses face an 85% probability of successful removal, the expected return on filing complaints becomes positive for virtually any contested negative review. Removal functions as a reliable strategic tool regardless of why individual requests succeed.

The high success rate alone cannot identify the mechanism producing this reliability. It could reflect platforms approving requests by default to minimize liability exposure, as my interpretation of German court precedents suggests @noauthor_bgh_2022 @noauthor_bgh_2016. Alternatively, it could indicate that businesses file only when they possess strong evidence of legitimate violations, with high success rates reflecting claim merit rather than procedural dynamics. Both mechanisms predict the same outcome: reliable approval when requests are filed.


=== Limitations and Alternative Explanations

The most significant limitation concerns mechanism identification. The observed 85% success rate is consistent with multiple explanations:

A first interpretation could be that German legal frameworks create liability incentives for platforms to approve most removal requests without individualized merit evaluation. Mandatory verification obligations combined with evidentiary constraints make removal the legally safer response regardless of claim strength. High success rates reflect risk-averse compliance.

A second interpretation could be that businesses file removal requests only when they possess strong evidence of defamation or legitimate personality-rights violations (selection bias). High success rates reflect that filed complaints genuinely satisfy German legal standards. Platforms evaluate claims individually, and businesses self-select for likelihood of success.

A third and final interpretation could be that German defamation and personality-rights law provides businesses with broader protections than exist elsewhere. High success rates reflect that German law recognizes more review content as legitimately removable, making both filing and approval rational under that legal framework.

Observational data on success rates alone cannot distinguish between these explanations. All three predict: (1) high approval rates and (2) predictable outcomes for businesses.

This analysis establishes that removal succeeds reliably (the empirical pattern) but cannot determine why (the causal mechanism). We do not observe what evidence businesses submit, how platforms evaluate claims, whether reviewers are contacted or respond, or whether removed reviews violated German law. The data reveal that removal works predictably but not whether this predictability stems from legitimate legal enforcement or procedural exploitation.

The findings reflect removal dynamics during October 2025 on Google Maps specifically. Whether these patterns represent stable institutional equilibrium, extend to other platforms, or persist over time remains uncertain.

The findings of H1 should be interpreted narrowly: we establish that a high proportion of reviews are removed once complaints are filed, but we do not demonstrate under what circumstances businesses choose to file complaints in the first place. Section 4.2 examines complementary evidence on removal volumes, concentration patterns, and cross-jurisdictional comparisons that provide additional context for interpreting whether filing behavior reflects selective legal remedy or systematic suppression practice.


== Systematic Practice Patterns (H2)

Hypothesis 2 predicted that German businesses utilize legal review removal mechanisms at material scale. To test this, I examine aggregate volumes that establish economic materiality, cross-jurisdictional patterns that contextualize whether removal activity is Germany-specific, business-level distribution that reveals whether activity concentrates among repeat users, and the relationship between filing volume and success rates.

I analyze aggregate moderation data from the Digital Services Act Transparency Database covering June through October 2025, complemented by complaint-level data from the Lumen Database during October 2025 that enables examination of individual business filing patterns.

=== Aggregate Volume and Economic Materiality

The Digital Services Act Transparency Database records 1,512,700 content moderation actions on Google Maps in Germany classified as Article 16 removals under "illegal and harmful speech" during June 1 through October 20, 2025. This 142-day observation period yields an average of 10,653 removal actions per day. Of these actions, 1,512,595 (99.99%) were classified under "Defamation" as the specific decision ground, aligning with the theoretical framework in Section 2.4 where German personality-rights and defamation jurisprudence provides the legal mechanism through which businesses contest reviews.

To assess whether this volume constitutes material scale, I consider both absolute magnitude and comparative context. In absolute terms, 1.5 million moderation actions over approximately five months represents substantial activity. For perspective, Germany had approximately 1.3 million registered limited liability companies (GmbHs) as of November 2025 @listflix_gmbhs_2025. The volume of moderation actions thus approaches or exceeds the total number of registered businesses in major legal categories. While not all businesses on Google Maps are GmbHs and not all moderation targets are distinct businesses, this comparison illustrates the scale: moderation activity operates at a magnitude comparable to Germany's entire registered business population.

Each moderation potentially affects consumer decision-making by eliminating information from the market, and the aggregate effect across 1.5 million removals represents meaningful distortion of the information environment that shapes local commerce. The materiality of this scale becomes clearer when examined in comparative context across jurisdictions.

=== Cross-Jurisdictional Context

#set footnote(numbering: "1")

The Digital Services Act mandates uniform transparency reporting from all EU member states, and Google Maps applies identical voluntary content policies across the European Union @google_prohibited_2025. However, Article 16 moderation actions (those prompted by legal complaints rather than platform policies) reflect jurisdiction-specific defamation, personality-rights, and other national legal frameworks. Cross-jurisdictional comparison of legal moderation volumes therefore reveals whether observed patterns reflect Germany-specific institutional factors or emerge uniformly across comparable markets operating under the same reporting requirements but different national laws.

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


Of Germany's 1,512,700 Article 16 actions, the overwhelming majority invoke defamation as the legal basis. Table 5 presents the breakdown by detailed decision ground

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

Germany accounts for 99.97% of all legally-motivated moderation actions across the European Union despite representing only 19% of EU population #footnote[As of 1st of January 2025. European Union population is an estimate. Calculation: $83,577,140 slash 450,380,320 = 0.18557$]. To assess whether this concentration reflects population differences, I calculate per-capita rates. Germany records 18.1 moderation actions per thousand residents during the observation period #footnote[Calculated as $n_"moderations" slash n_"population"$], compared to 0.0015 per thousand in France (101 actions / 67 million population) and 0.0021 per thousand in Spain (99 actions / 47 million population). Germany's per-capita rate exceeds comparable EU markets by factors exceeding 12,000:1.

To formally assess whether this concentration could arise from population distribution alone, I conduct a chi-square goodness-of-fit test. Under the null hypothesis that moderation actions distribute proportionally to population, Germany (19% of EU population) would account for approximately 287,496 of the 1,513,139 total actions observed. The test statistic comparing observed to population-proportional expected frequencies is $chi_2 = 10,527.8$ with 5 degrees of freedom (p < 0.001), formally rejecting the hypothesis that activity reflects population distribution.

The near-complete concentration of moderation activity in Germany establishes that observed patterns reflect jurisdiction-specific institutional factors rather than universal business behavior or platform practices. While all EU member states operate under identical reporting requirements and Google applies uniform voluntary content policies, legally-motivated moderation activity concentrates almost exclusively in Germany, with defamation as the near-universal legal basis. The 12,000-fold per-capita difference between Germany and France cannot be explained by market size, internet penetration, or platform usage patterns, which are broadly similar across Western European markets. This pattern validates the theoretical framework in Section 2.5: German legal precedents create distinctive conditions that enable or incentivize legal complaints at scales not observed elsewhere in the EU.


=== Business-Level Concentration

=== Volume-Success Relationship


/* === Cross-Jurisdictional Concentration

If removal reflects universal business responses to defamation or universal platform moderation practices, similar patterns should appear across jurisdictions operating under identical reporting frameworks and platform policies. The Digital Services Act requires uniform transparency reporting from all EU member states, and Google Maps applies identical content policies EU-wide @google_prohibited_2025. @a16-mod-actions-by-country presents Article 16 "illegal and harmful speech" removal actions by country (EU) during June 1- October 20 2025


Germany accounts for 99.97% of all legally-motivated review removals across the European Union despite representing only 18.56% of EU population. This concentration cannot be explained by market size differences. To assess whether removal volumes reflect population proportions, I calculate per-capita filing rates: Germany records 18.2 legal removal actions per thousand residents during the observation period, compared to 0.0015 per thousand in France (population 67M) and 0.0021 per thousand in Spain (population 47M). Germany's per-capita removal rate exceeds comparable EU markets by a factor exceeding 12,000:1.

If removal requests were distributed proportionally to population, Germany would account for approximately 287,496 of the 1,513,139 total requests. A chi-square goodness-of-fit test comparing observed to population-proportional expected frequencies yields χ² > 10,000 (p < 0.001), formally rejecting the hypothesis that removal activity reflects population distribution.

Of the 1,512,700 removal actions in Germany, 1,512,595 (99.99%) were classified under "Defamation" as the decision ground. This aligns with the theoretical framework: German defamation and personality-rights jurisprudence provides the legal mechanism through which businesses contest reviews, as documented in Section 2.4.
*/


/*
This section tests both hypotheses using data from the DSA Transparency Database and the Lumen Database. Section 4.1 examines whether German businesses pursue review suppression at disproportionate scale, analyzing the volume and geographic distribution of Article 16 actions across EU member states. Section 4.2 examines whether removal requests achieve reliably high success rates, analyzing complaint-level outcomes from the Lumen sample. Each analysis presents descriptive findings followed by statistical significance testing.

== Volume and Geographic Distribution of Legal Actions

=== Digital Services Act Transparency Database



/*     "query": "select count(*) as decision_count from statement_index where received_date between '2025-06-01' and '2025-10-20' and platform_name = 'Google Maps' and source_type = 'SOURCE_ARTICLE_16' and territorial_scope = 'de' and territorial_scope = 'at' and territorial_scope = 'be' and territorial_scope = 'bg' and  territorial_scope = 'hr' and  territorial_scope = 'cy' and territorial_scope = 'cz' and  territorial_scope = 'dk' and territorial_scope = 'ee' and  territorial_scope = 'fi' and  territorial_scope = 'fr' and territorial_scope = 'gr' and  territorial_scope = 'hu' and  territorial_scope = 'ie' and territorial_scope = 'it' and  territorial_scope = 'lv' and territorial_scope = 'lt' and  territorial_scope = 'lu' and  territorial_scope = 'mt' and territorial_scope = 'nl' and  territorial_scope = 'pl' and  territorial_scope = 'pt' and  territorial_scope = 'ro' and  territorial_scope = 'sk' and territorial_scope = 'si' and  territorial_scope = 'es' and  territorial_scope = 'se'" */


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

@by-source-type presented the distribution of Google Maps moderation actions by source type for the study period (June 1 – October 20, 2025). Of 24.6 million total actions, 23.0 million (93.82%) were voluntary actions under Google's internal content policies. Article 16 cases, moderation actions initiated through external legal complaints invoking national law, represent 1,515,000 actions (6.17% of total). @jur-composition demonstrates that voluntary actions apply uniformly across jurisdictions: 99.25% of voluntary actions are implemented EU-wide, reflecting Google's standardized content policies that operate identically regardless of geography @google_prohibited_2025. This uniformity makes voluntary actions unsuitable for examining cross-country variation in suppressive reputation management; any geographic differences in total moderation activity must therefore originate from the Article 16 category, where national legal frameworks govern platform obligations.

While numerically smaller, Article 16 cases exhibit substantial cross-country variation in how businesses leverage legal mechanisms to contest platform content. Table 2 shows that only 0.08% (1,229) of Article 16 actions apply EU-wide, while the overwhelming majority target specific national jurisdictions. This jurisdictional targeting makes Article 16 the primary focus of this analysis.

@mod-actions-by-cat disaggregates Article 16 actions by stated legal basis. Illegal or harmful speech accounts for 1,513,139 actions (99.88% of Article 16 total). Intellectual property infringement (1,772 actions, 0.12%), data protection violations (29 actions, \<0.01%), and other legal bases appear only marginally. This concentration indicates that defamation-based personality rights claims, rather than copyright or privacy concerns, drive the overwhelming majority of legally-prompted content actions on Google Maps. 

Considering that other categories are negligible in numbers, and that the legal framework discussed earlier focused on defamation specifically, @a16-mod-actions-by-country presents a breakdown by country, but specifically for illegal and harmful speech actions. This aligns with the court rulings presented earlier, which cite defamation, a form of harmful speech, as the primary mechanism for contestation.

@a16-mod-actions-by-country reveals a striking geographic concentration. Germany by itself represented 99.97% of all jurisdiction-specific actions filed under Article 16 for illegal and harmful speech, with 1,512,700 total moderation actions. To contextualize this concentration: France, the second-highest country by action volume, recorded 101 actions. Spain recorded 99, Poland 74, and Austria 49. All remaining EU countries combined account for fewer than 91 #footnote[Jurisdiction-specific actions only. There are up to 25 multi-jurisdiction actions in the study period, meaning they may cover multiple countries simultaneously] actions. Germany's volume exceeds France by a factor of approximately 15,000, a difference of roughly four orders of magnitude. This is not a proportional difference that might reflect market size or population; it is a categorical difference in moderation action activity. Spain, with 49 million inhabitants @instituto_nacional_de_estadistica_inebase_2025 and a mature digital economy, recorded 99 actions in the same period during which Germany recorded over 1.5 million. Poland, with 38 million inhabitants @statistics_poland_statistics_2025, recorded 74. Even Austria, which shares linguistic traditions with Germany, recorded only 49 actions.
The magnitude of this disparity eliminates the need for normalization or per-capita adjustment to establish disproportionality. When one jurisdiction accounts for 99.97% of a phenomenon while representing approximately 19% of EU #footnote[As of 1st of January 2025, computed from Eurostat data $83,577,140 slash 450,380,320 = 18.557%$ @eurostat_population_2025] population, no statistical correction is required to demonstrate that action activity does not track underlying market fundamentals. The difference is extreme both in absolute and relative terms.

@illegal-reason-breakdown breaks down the specific legal mechanism cited for actioning content deemed to constitute illegal or harmful speech. Of the 1,512,700 Germany-specific removals in this category, 1,512,595 (99.99%) cite defamation as the legal basis. Only 105 actions (0.01%) cite court orders as their removal mechanism. The transparency database does not specify what legal grounds these court orders invoke, making it unclear whether they represent defamation rulings, other personality-rights claims, or entirely different legal violations. Regardless, the distribution is unambiguous: defamation claims filed directly by businesses, rather than court-ordered removals, account for virtually all legal takedown activity on Google Maps in Germany.

To contextualize this concentration further, Germany's defamation-based removals can be expressed as a share of all Article 16 actions across the entire European Union. Recall from @mod-actions-by-cat that Article 16 actions totaled 1,514,957 across all legal categories and jurisdictions. Germany's 1,512,595 defamation removals therefore represent 99.84% of all legally-motivated content moderation actions on Google Maps EU-wide. In other words, nearly every legal complaint that prompts content removal on Google Maps anywhere in the European Union originates from Germany and invokes German defamation law.

/* === Alternative Explanations

Several alternative explanations warrant consideration before attributing this 
concentration to institutional factors. The most fundamental challenge to any 
market-based explanation comes from platform incentive theory itself. @dellarocas_digitization_2003 established that reputation systems function only when consumers perceive aggregated feedback as trustworthy, platforms must moderate content to preserve system credibility. If the removed reviews were genuinely defamatory (fabricated by non-customers, containing false claims, or otherwise illegitimate), Google would have clear economic incentives to remove them everywhere, not just in Germany. Allowing fraudulent reviews to persist in France, Spain, or Poland would degrade platform trustworthiness and signal quality equally in those markets. The fact that removal activity concentrates almost exclusively in Germany (99.97%) while remaining negligible elsewhere therefore reveals that these are not responses to universally recognizable defamation. Instead, the pattern indicates that German legal framework reclassifies content as removable that platforms, and other jurisdictions, treat as legitimate consumer feedback. If review quality or authenticity drove removal decisions, the distribution would track review volumes and fraud rates across markets. The observed four order of magnitude concentration demonstrates that legal institutions, not content characteristics, determine removal outcomes. */

=== Testing Hypothesis 1

To test H1, we perform a binomial test comparing Germany's observed removal proportion (99.93%) against the null hypothesis that removals are distributed proportionally to population (18.6%).

Test parameters:
- $H_0$: $p_"germany"$ = 0.186 (population-proportional)
- $H_a$: $p_"germany"$ > 0.186 (disproportionate concentration)
- n = 1,513,728 total removals
- x = 1,512,595 Germany removals
- Observed proportion: p̂ = 0.9993

H1 predicted that German businesses pursue systematic review suppression at scale on Google Maps. The data provide unambiguous support. Germany accounts for 99.84% of all Article 16 actions EU-wide, representing 1,512,595 defamation-based moderation actions during the 4.7-month study period. Because Article 16 actions are initiated exclusively through external legal complaints, this volume directly reflects business filing behavior. The concentration is systematic rather than occasional: 99.99% of actions use standardized direct defamation claims rather than court orders, indicating proceduralized suppression through platform complaint mechanisms. The pattern sustains consistently across the study period and exceeds comparable jurisdictions by four orders of magnitude. The alternative explanations analysis established that platform incentives would drive uniform removal of genuinely defamatory content @dellarocas_digitization_2003, yet removal concentrates exclusively in Germany, confirming that institutional factors, specifically, German court precedents lowering evidentiary thresholds and shifting verification burdens to platforms, enable suppression as routine business practice rather than exceptional legal remedy. H1 is supported.

== Success Rate of Removals

Large-scale removal activity demonstrates that businesses pursue suppression, but does not establish whether they can reliably expect success. If removal outcomes remain uncertain, suppression functions as a legal gamble rather than a dependable strategic tool. Analysis of complaint-level data from the Lumen Database reveals otherwise.

Of the 983 valid review URLs sampled from defamation-based takedown requests filed during October 1–20, 2025, 840 were confirmed removed at the time of verification on October 31. This yields a success rate of 85.45%, with a 95% confidence interval of [83.2%; 87.7%]. The lower bound of this interval substantially exceeds the 50% threshold specified in H2, indicating that businesses achieve removal in the overwhelming majority of cases when they contest reviews through defamation claims. The confidence interval [83.2%; 87.7%] deserves particular attention. Even at its lower bound, the success rate exceeds 83%, meaning that businesses can expect removal in more than four out of five attempts. The high success rate validates the theoretical prediction that platforms facing liability asymmetries will choose compliance over resistance. Google's self-reported median processing time for Article 16 notices is less than one day (Google, 2025b, § 2.4). The combination of 85% success rates and sub-24-hour processing indicates systematic approval of removal requests. This rapid, high-approval pattern is consistent with the institutional framework established earlier: when German court precedents place the burden of proving customer contact on platforms, and when data protection law prevents platforms from obtaining such evidence, compliance becomes the legally safer response than case-by-case adjudication. Whether Google actually conducts thorough verification remains unobservable from the available data, but the outcome pattern aligns with what economic theory predicts when one party can make claims that the other party cannot feasibly refute.

The procedural pathway through which businesses achieve these outcomes reinforces the interpretation that suppression operates systematically. Recall from Table 5 that 99.99% of German removals cite direct defamation claims rather than court orders. This means businesses achieve 85% success rates without obtaining judicial determinations first. They file complaints directly with Google through standardized Notice and Takedown forms, assert that reviews lack customer relationships or contain defamatory statements, and receive removal within one day in the median case. Courts function primarily as off-stage enforcers whose precedents shape platform behavior, but individual businesses need not engage the judicial system to achieve removal. This proceduralization is precisely what enables high success rates: platforms apply standards designed to minimize liability risk rather than adjudicating claims on their merits. The combination of high volume (H1) and high success rates (H2) together establish that suppressive reputation management functions as an institutionalized practice in Germany. Volume alone might reflect widespread filing of speculative complaints with low success rates. High success rates alone might reflect rare but meritorious cases where removal is clearly justified. The conjunction of both patterns indicates instead that businesses pursue suppression systematically because they can reliably expect compliance. This is the economic equilibrium predicted by the theoretical framework: when platforms face asymmetric liability and businesses face negligible costs, removal becomes routine.

=== Alternative Explanations

One alternative explanation warrants consideration: selection bias in complaint filing. If businesses only contest reviews when confident of success, the 85% success rate might reflect strategic case selection rather than permissive platform standards. Under this interpretation, high success rates indicate business restraint in filing only strong claims, not systematic platform compliance.

This explanation is difficult to reconcile with the volume findings from H1. If businesses exercised substantial restraint, removal volumes would approximate the actual incidence of fraudulent reviews. Instead, Germany exhibits 1.5 million removals in 4.7 months, volumes that exceed comparable markets by four orders of magnitude. Moreover, the existence and business model of Löschagenturen contradicts the restraint hypothesis: these agencies advertise fixed-price removal services for any unwanted review, not selective representation for clearly meritorious cases. The conjunction of extreme volume and high success rates indicates systematic approval rather than careful pre-filtering by businesses.

=== Testing Hypothesis 2

H2 predicted that review removal requests achieve reliably high success rates, operationalized as exceeding 50%. The Lumen Database analysis provides strong support. Of 983 sampled URLs from defamation-based takedown requests, 840 were confirmed removed, yielding a success rate of 85.45% with a 95% confidence interval of [83.2%; 87.7%]. The lower bound substantially exceeds the 50% threshold, confirming that businesses can reasonably expect removal when contesting reviews through defamation claims. When businesses in Germany contest reviews, removal is not merely a possible outcome but the expected outcome. The predictability of this process, evidenced by both high success rates and narrow confidence intervals, establishes that suppression functions as a dependable strategic tool rather than an uncertain legal remedy. H2 is supported.
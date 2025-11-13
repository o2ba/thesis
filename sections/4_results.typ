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


Of the 983 verified URLs, 840 were removed, yielding an observed removal rate of $hat(p) = 0.8545$ (85.45%) with 95% CI of [83.2%, 87.7%]#footnote[Standard error calculated as SE = $sqrt([hat(p)(1-hat(p)) slash n])$ = $sqrt(0.8545(1-0.8545) slash 983) = 0.0112$, yielding a 95% CI of $85.45 plus.minus 1.96 dot (1.12%) = [83.2%; 87.7%]$]. This means more than four out of five removal requests succeed. Because multiple reviews in the sample can target the same business (businesses receive a median of roughly seven removal requests) with a highly right-skewed distribution, individual observations may not be fully independent.

To assess whether this rate makes removal strategically rational for businesses, we consider the decision calculus facing firms contemplating whether to contest negative reviews. Given negativity bias, where removing one negative review prevents more revenue loss than adding multiple positive reviews generates @chevalier_effect_2006, businesses face strong economic incentives to pursue removal if outcomes are predictable. However, the rationality of filing depends critically on success probability.

At success rates around 50-60%, businesses face meaningful uncertainty. Filing becomes worthwhile only when they possess strong evidence or confidence in their claim's merit, as the expected value of contesting marginal or weak cases remains negative. This uncertainty limits filing to clearly defensible disputes. By contrast, success rates approaching 70-80% shift the strategic calculus fundamentally. At this level, even businesses with uncertain or marginal claims face positive expected value from filing, making removal worthwhile for virtually any contested negative review regardless of case strength.

The observed 85.45% success rate places removal firmly in this latter category. Even under conservative estimation using the confidence interval's lower bound of 83.2%, more than four out of five removal requests succeed. This level of predictability converts removal from selective legal remedy into accessible reputation management tool. Businesses can rationally expect approval when filing complaints, making removal a reliable strategic option regardless of individual claim merit.



// Given platform liability incentives and German legal precedents requiring mandatory investigation of disputed reviews, I predict that removal requests will achieve reliably high success rates once filed. However, I must operationalize what constitutes "reliably high" in this context. The critical threshold is the success rate at which filing becomes strategically rational for businesses regardless of claim strength. If success rates remain around 50–60%, businesses face meaningful uncertainty: filing is only worthwhile when they possess strong evidence or confidence in their claim's merit. The expected value of contesting a marginal or weak case remains negative, limiting filing to clearly defensible disputes. By contrast, success rates approaching 70–80% shift the strategic calculus. At this level, even businesses with uncertain or weak claims can rationally expect approval, making filing worthwhile for virtually any negative review. This degree of predictability converts removal from selective legal remedy into routine reputation management tool. I therefore test whether observed removal rates exceed 70%, the threshold at which strategic use becomes rational even for marginal claims:

// -- $H_0$: The removal rate $p <= 0.70$

// -- $H_1$: The removal rate $p > 0.70$

// #set footnote(numbering: "*")

// The 70% benchmark used to define “reliably high” outcomes was determined after preliminary data exploration rather than pre‑registered in advance. Accordingly, this test should be interpreted as exploratory and descriptive rather than confirmatory.

// Of the 983 verified URLs, 840 were removed, yielding an observed removal rate of $hat(p) = 0.8545$ (85.45%) with 95% CI of [83.2%, 87.7%] #footnote[Standard error calculated as SE = $sqrt([hat(p)(1-hat(p)) slash n])$ = $sqrt(0.8545(1-0.8545) slash 983) = 0.0112$, yielding a 95% CI of $85.45 plus.minus 1.96 dot (1.12%) = [83.2%; 87.7%] $]. Because multiple reviews in the sample can target the same business (businesses receive a median of roughly seven removal requests) with a highly right-skewed distribution, individual observations may not be fully independent.

// To determine whether this rate represents reliably high success, I conducted a one-sample proportion test with a null hypothesis that the true removal rate equals 0.70. Under this null, the standard error is $"SE" = 0.0146$ #footnote[$sqrt(p_0 dot (1-p_0) slash n) = sqrt(0.70 dot 0.30 slash 983) = 0.0146$]. The corresponding test statistic is $z = (hat(p) - p_0) slash "SE" = (0.8545 - 0.70) slash 0.0146 = 10.58$. he one-tailed p-value corresponding to $z=10.58$ under the standard normal distribution is less than 0.001 $$, indicating that the probability of observing such a high success rate by chance under the null hypothesis is vanishingly small. The one-tailed $p < 0.001$ in both instances. As a robustness check, we test alternative thresholds of 0.75 ($z = 7.57$) and 0.80 ($z = 4.27$), where the one-tailed $p < 0.001$ in both instances.

// We therefore reject $H_0$ at conventional significance levels $(z = 10.58, p < 0.001)$. The observed removal rate of $85.45%$ significantly exceeds the $70% $ threshold.


=== Interpretation

The 85.45% removal rate establishes that removal succeeds reliably once requests are filed. From a business decision-making perspective, this predictability makes removal a viable strategic tool regardless of the underlying mechanism producing it. However, the high success rate alone cannot identify why requests succeed.

The observed pattern is consistent with multiple mechanisms. Platforms may systematically approve requests to minimize liability exposure under German court precedents @noauthor_bgh_2022 @noauthor_bgh_2016, making removal the legally safer response regardless of individual claim merit. Alternatively, businesses may file only when possessing strong evidence of legitimate violations, with high success rates reflecting case strength rather than procedural leniency. Both mechanisms predict the same empirical outcome: reliable approval when requests are filed.

// The $85.45%$ removal rate $[95% "CI": 83.2%, 87.7%]$ is consistent with businesses being able to reliably expect their removal requests to succeed. The confidence interval's lower bound of $83.2%$ indicates that even under conservative estimation, more than four out of five removal requests succeed. 

// From a business decision-making perspective, an 85% success rate makes removal outcomes highly predictable, regardless of the underlying mechanism producing this reliability. Negativity bias means that removing a single one-star review prevents more revenue loss than soliciting several five-star reviews generates @chevalier_effect_2006. When businesses face an 85% probability of successful removal, the expected return on filing complaints becomes positive for virtually any contested negative review. Removal functions as a reliable strategic tool regardless of why individual requests succeed.

// The high success rate alone cannot identify the mechanism producing this reliability. It could reflect platforms systematically approving requests to minimize liability exposure under German court precedents @noauthor_bgh_2022 @noauthor_bgh_2016. Alternatively, it could indicate that businesses file only when they possess strong evidence of legitimate violations, with high success rates reflecting claim merit rather than procedural dynamics. Both mechanisms predict the same outcome: reliable approval when requests are filed.


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

The near-complete concentration of moderation activity in Germany establishes that observed patterns reflect jurisdiction-specific institutional factors rather than universal business behavior or platform practices. While all EU member states operate under identical reporting requirements and Google applies uniform voluntary content policies, legally-motivated moderation activity concentrates almost exclusively in Germany, with defamation as the near-universal legal basis. The 12,000-fold per-capita difference between Germany and France cannot be explained by market size, internet penetration, or platform usage patterns, which are broadly similar across Western European markets. This pattern validates the theoretical framework in Section 2.5: German legal precedents create distinctive conditions that enable or incentivize legal complaints at scales not observed elsewhere in the EU.


=== Business-Level Concentration


Having established that legally-motivated moderation operates at material scale in Germany specifically, I examine how this activity distributes among businesses. This distribution reveals whether observed filing volumes are consistent with defensive responses to actual defamation exposure or suggest more systematic practice.

The Lumen Database records 98,106 defamation-based removal requests filed during October 1 through 20, 2025, targeting 13,691 unique businesses on Google Maps. The distribution of requests per business exhibits substantial right skew. The median business experiences 2 removal requests during the observation period, while the mean is 7.16 requests per business. The maximum is 863 requests targeting a single business in 20 days, equivalent to 43 removal requests per day.

Removal activity concentrates heavily among a small subset of businesses. The most active 114 businesses, representing less than 1% of all businesses filing requests (0.83%), account for 25% of total removal activity. The top 665 businesses (4.9%) account for 50% of all requests, and the top 2,226 businesses (16.3%) account for 75% of requests. This concentration indicates that while thousands of businesses file removal requests, a minority of intensive users drive the majority of activity.

The volume extremes warrant careful interpretation. A business filing 863 removal requests in 20 days represents approximately 43 requests daily. While this could reflect coordinated review attacks, multiple business locations, or other exceptional circumstances, the frequency of such high-volume patterns (2021 total businesses have more than 100 removals in the 20-day period) suggests these are not isolated anomalies. For comparison, this single business filed more removal requests during the 20-day window than the entire countries of France (101 total Article 16 actions), Spain (99), Poland (74), and Austria (49) combined #footnote[We did not collect filing data for these countries, but this can be inferred from moderation activity: No Article 16 moderation action can be performed if no legal notice has been filed.]. 

If these volumes reflected defensive responses to actual defamation exposure proportional to genuine harm, we would need to posit either that German businesses face extraordinarily higher rates of defamatory review content than businesses elsewhere, or that specific businesses within Germany experience defamation at rates orders of magnitude exceeding baseline. The cross-jurisdictional evidence in Section 4.2.2 undermines the first explanation: comparable businesses in France and Spain do not generate similar removal activity. The second becomes implausible when multiple businesses exhibit extreme filing volumes, suggesting a pattern rather than isolated exceptional cases.

The concentration pattern becomes more interpretable when examined alongside success rates across different filing volumes. The combination of extreme filing volumes and success rates approaching procedural certainty provides insight into whether removal operates through individualized case evaluation or systematized processing. Table 6 presents removal success rates partitioned by business filing frequency:


#set par(leading: 1em, justify: false)
#figure(
  table(
    columns: (1fr, 1fr, 1fr, 100pt),
    table.header([Business Category], [Success Rate], [95% CI], [Sample Size #footnote[Sample size of observed removals, not businesses]]),
    [All], [$85.45%$], [$[83.2%, 87.7%]$], [$983$],
    [Top 25%], [$95.54%$], [$[92.7%, 98.4%]$], [$202$],
    [Top 50%], [$86.77%$], [$[82.6%, 90.9%]$], [$257$],
    [Top 75%], [$84.19%$], [$[79.5%, 88.9%]$], [$234$],
    [Bottom 25%], [$78.28%$], [$[73.5%, 83.0%]$], [$290$]
  ),
  caption: [Removal success rate based on filing volume]
) <illegal-reason-breakdown>
#set par(leading: 2em, justify: true)


To assess whether success rates differ significantly between high-volume and low-volume filers, I conduct a two-proportion z-test comparing the top 25% of businesses (most active filers) to the bottom 25% (least active filers) #footnote[$"Top" 25%: 193/202 = 95.54%, "Bottom" 25% = 227/290 = 78.28%$. Difference: $95.54%-78.28% = 17.26%$. Pooled proportion: $(193 + 227) slash (202 + 290) = 420 slash 492 = 0.8537$. $"SE" = sqrt(0.8537 dot 0.1463 dot (1 slash 202 + 1 slash 290)) = 0.0324$. $z = (0.9554 - 0.7827) slash 0.0324 = 5.33$. Two-tailed p < 0.001]. The top 25% achieve a 95.54% success rate compared to 78.28% for the bottom 25%, a difference of 17.3 percentage points. The test statistic is z = 5.33 (p < 0.001), indicating that high-volume filers achieve significantly higher success rates than low-volume filers.

The most active 25% of businesses achieve a 95.54% success rate, approaching near-certainty. When a business filing 863 removal requests in 20 days achieves this success rate, the volume-success combination strains plausibility as individualized adjudication. Evaluating 43 defamation claims daily on their individual merits while maintaining 95% approval would require either that virtually all claims possess exceptional strength or that evaluation does not meaningfully assess case-specific merit.

When platforms face mandatory verification obligations but cannot obtain transaction-level evidence to fulfill them, removal becomes the procedurally safer response regardless of claim strength. Under these conditions, businesses filing at industrial scale can maintain near-certain success rates because approval depends on procedural compliance rather than substantive merit. The $95.5%$ success rate among intensive users is consistent with commercial deletion services developing standardized filing procedures optimized for such proceduralized approval.

=== Interpretation and Synthesis

Hypothesis 2 predicted that German businesses would utilize legal review removal mechanisms at material scale, with patterns consistent with systematic practice rather than episodic legal remedy. The evidence provides strong support for this prediction across multiple independent dimensions.

The scale of removal activity is substantial by any measure. Over 1.5 million defamation-based moderation actions in five months represents activity at a magnitude comparable to Germany's entire registered business population. Approximately one percent of German corporations #footnote[Estimated based on total number of GmbH and unique businesses extracted from Lumen] filed removal requests during a 20-day observation period, indicating widespread participation rather than isolated use by a small set of affected businesses. This volume substantially exceeds what episodic defensive responses to exceptional violations would predict.

The Germany-specific concentration of this activity is stark. Germany accounts for 99.97% of all legally motivated removals across the European Union despite representing only 19% of EU population and operating under identical platform policies and DSA reporting requirements. Per-capita removal rates exceed France by 12,000 to one and Spain by comparable margins. This concentration indicates that observed patterns reflect jurisdiction-specific institutional factors rather than universal business responses to defamation exposure. All EU member states maintain personality rights protections and defamation law, yet removal activity concentrates almost exclusively where specific court precedents impose mandatory platform verification obligations that platforms struggle to fulfill.

The business-level patterns reveal characteristics consistent with systematic practice. Removal activity exhibits pronounced concentration, with the most active one percent of businesses accounting for 25% of total requests. Individual businesses file hundreds of requests within weeks while maintaining success rates approaching certainty. The positive correlation between filing volume and success rates, where intensive users achieve 96% approval compared to 78% for occasional filers, suggests procedural optimization. Businesses filing 863 requests in 20 days while maintaining 95% success rates strain plausibility as individualized responses to sporadic defamation exposure, instead suggesting systematic engagement with predictable procedural outcomes.

These patterns converge to support the theoretical framework developed earlier. German court precedents impose mandatory verification obligations on platforms when businesses contest reviews, requiring investigation of claimed customer relationships while data protection law prevents platforms from obtaining the transaction evidence necessary to conduct such verification. This creates asymmetric decision calculus where removal eliminates liability with certainty while retention requires successful verification through processes platforms cannot fully control. When compliance becomes legally safer than adjudication, approval rates should become uniformly high, activity should concentrate in the jurisdiction imposing these obligations, and businesses recognizing procedural reliability should file systematically at volumes exceeding what sporadic violations would generate. Each element finds empirical confirmation in the documented patterns.

An alternative interpretation holds that these patterns reflect effective enforcement of legitimate personality rights violations rather than systematic exploitation of procedural vulnerabilities. Under this view, German concentration indicates not that businesses game weak procedures but that German courts take personality rights seriously while other jurisdictions fail to provide functional remedies for comparable violations. High volumes would represent accumulated legitimate grievances, and business-level concentration would reflect unequal distribution of actual defamation exposure.

This interpretation faces empirical challenges when confronted with the full pattern of evidence. It requires explaining why some businesses would experience hundreds of legitimate personality rights violations in 20 days while most experience two, a distribution difficult to reconcile with random defamation exposure. It must account for why businesses filing intensively achieve systematically higher success rates, suggesting procedural learning rather than uniform evaluation of claim merit. Most critically, it must explain why French and Spanish businesses, facing presumably comparable defamation exposure and possessing legal personality rights protections, generate removal activity at levels 12,000 times lower per capita. While differential institutional capacity to enforce rights could explain some disparity, the magnitude strains explanations that do not reference Germany-specific procedural characteristics. The patterns are more parsimoniously explained by institutional mechanisms that make removal predictably successful in Germany specifically than by assuming defamation exposure differs by four orders of magnitude across otherwise comparable European markets.

The convergence of evidence across independent dimensions substantially strengthens inference. No single pattern proves the institutional mechanism operates. High success rates could reflect selection, Germany-specific volumes could reflect legal standards, concentration could reflect various factors. However, their joint occurrence in the predicted configuration, where each pattern emerges as the theoretical framework anticipates while alternative explanations require multiple auxiliary assumptions, provides strong support for systematic practice interpretation. The findings indicate that review removal in Germany functions as accessible reputation management tool operating at material scale rather than as selective legal remedy for exceptional violations, with patterns consistent with businesses responding rationally to predictable procedural outcomes created by jurisdiction-specific institutional conditions.


/*
The analysis of success rates identified that the 85% removal rate alone cannot distinguish between alternative explanations. The institutional mechanism predicted high success rates based on platform liability incentives under German court precedents. However, selection bias, where businesses file only strong claims, and expansive legal standards could also produce high approval rates. The additional evidence on volumes, jurisdictional concentration, and business-level patterns now allows us to discriminate among these competing interpretations.

The selection bias explanation holds that businesses file removal requests only when they possess strong evidence of defamation or legitimate personality rights violations, making high success rates reflect genuine claim merit rather than platform default approval. This interpretation faces multiple empirical challenges. The volume of 98,106 requests in 20 days strains plausibility as selective filing of only exceptional defamation cases. For this to reflect high-merit claims would require either epidemic rates of actual defamation in German reviews or extraordinary business capacity to distinguish valid from invalid claims before filing. The business-level concentration pattern further challenges this interpretation. One business filing 863 requests in 20 days while maintaining success rates exceeding 95% would require implausibly high and business-specific defamation exposure. The cross-jurisdictional evidence presents perhaps the strongest challenge. If selection bias drove high success rates, comparable businesses in France and Spain should exhibit similar patterns when they file legitimate claims. Instead, these countries generate negligible removal activity, 101 and 99 total actions respectively, suggesting that observed patterns reflect institutional frameworks rather than universal business behavior. The positive correlation between filing volume and success rates, where intensive users achieve 96% success compared to 78% for occasional filers, presents a more ambiguous test. This pattern could reflect that frequent filers develop superior capacity to identify legitimate claims before filing. However, this interpretation requires explaining why such selection capacity would be concentrated among specific businesses rather than diffused across firms facing genuine defamation, and why this capacity would emerge specifically in Germany when comparable businesses elsewhere do not exhibit similar learning patterns.


The legal standards explanation holds that German defamation and personality rights law simply recognizes more review content as legitimately removable. This interpretation correctly identifies that German legal frameworks differ from other jurisdictions but cannot independently explain the concentration patterns. If German law merely defined broader categories of removable content, we would expect businesses across Germany to face similar removal needs based on their actual exposure to violating content. Instead, extreme concentration where the most active 1% of businesses account for 25% of all activity, and where individual businesses file hundreds of requests within weeks, suggests strategic behavior rather than defensive responses proportional to underlying harm. Moreover, this explanation cannot account for per-capita removal rates exceeding comparable European jurisdictions by four orders of magnitude. France maintains personality rights protections and defamation law yet generates removal activity at levels 12,000 times lower per capita. Unless German consumers write reviews violating legal standards at rates fundamentally different from French or Spanish consumers, an assumption with no independent empirical support, the legal standards explanation proves insufficient.
The institutional mechanism explanation holds that German court precedents create platform incentives for default approval by imposing mandatory verification obligations that platforms cannot fulfill due to evidentiary constraints and data protection law. This mechanism parsimoniously accounts for the full pattern through unified causal logic. Mandatory verification requirements combined with practical inability to obtain transaction-level evidence predict high uniform success rates through proceduralized compliance rather than individualized adjudication. When removal eliminates liability with certainty while retention requires successful verification through a process platforms cannot control, expeditious approval becomes the legally rational response. This same dynamic predicts material scale. When success becomes predictable, filing barriers decrease, transforming removal from uncertain legal remedy into accessible reputation management tool. The mechanism predicts Germany-specific concentration because the relevant legal precedents establishing mandatory platform obligations operate only within German jurisdiction, despite uniform platform policies across the EU. Business-level concentration follows naturally when sophisticated businesses recognize and exploit predictable procedural outcomes, with commercial deletion services developing standardized processes optimized for such environments. Positive correlation between filing volume and success rates emerges through procedural learning. Intensive users achieve near-certainty not because they possess stronger individual claims but because they optimize filing procedures for systems that default to approval.
The theoretical framework made specific predictions about observable patterns if the institutional mechanism operated as theorized. High success rates approaching but not reaching total compliance would reflect defensive risk-averse moderation rather than individualized assessment. Material scale would emerge as predictable outcomes incentivize widespread adoption. Germany-specific concentration would manifest because relevant legal obligations derive from national court precedents. Business-level concentration and learning effects would arise as sophisticated actors recognize procedural reliability. Each prediction finds empirical confirmation.
The strength of inference derives not from any single pattern but from their convergence. High success rates alone could reflect selection bias. Germany-specific volumes alone could reflect legal standards. Business-level concentration alone could reflect various factors. However, their joint occurrence in the predicted configuration, each pattern emerging as the institutional mechanism anticipates while each alternative explanation requires multiple auxiliary assumptions, substantially increases confidence in the underlying theory. The institutional mechanism is not merely consistent with the data but explains the full pattern more parsimoniously than alternatives that each face independent empirical challenges across multiple dimensions.
The findings indicate that review removal in Germany operates as a systematic practice at material scale rather than as episodic legal remedy for exceptional violations. Approximately one percent of German corporations filed removal requests during the observation period, achieving success rates that transform removal from uncertain litigation into predictable procedural outcome. For businesses filing intensively, success rates approach near-certainty, suggesting that removal functions reliably regardless of individual claim circumstances. The convergence of evidence across multiple independent measures provides strong support for the theoretical framework, while acknowledging that observational methods face inherent limitations in establishing causal mechanisms with experimental certainty.

// The aggregate evidence presents three converging patterns that characterize removal activity in Germany. First, the scale is substantial: 1.5 million defamation-based moderation actions over five months represents activity at a magnitude comparable to Germany's entire registered business population. Second, this activity concentrates almost exclusively in Germany despite uniform DSA reporting requirements and identical platform policies across the EU, with per-capita rates exceeding comparable markets by four orders of magnitude. Third, removal activity exhibits pronounced business-level concentration, with the most active 1% of businesses accounting for 25% of total requests, and these intensive users achieving significantly higher success rates than occasional filers.

// These patterns are difficult to reconcile with episodic defensive responses to defamation exposure. If removal reflected businesses protecting themselves against genuine legal violations proportional to actual harm, we would expect more uniform distribution across comparable European markets operating under similar e-commerce conditions. The 12,000-fold per-capita difference between Germany and France suggests institutional factors rather than differential defamation incidence. Similarly, the business-level concentration, where individual businesses file hundreds of requests within weeks while maintaining near-certain approval, strains plausibility as individualized case adjudication.

// The positive correlation between filing volume and success rates warrants particular attention. Low-volume filers achieve 78% success, while businesses in the top quartile achieve 96% success. If platforms evaluated claims on individual merit, we might expect the opposite: occasional filers would pursue only their strongest cases while frequent filers would submit weaker marginal claims. The observed pattern instead suggests that procedural familiarity or optimization improves outcomes, consistent with removal functioning as a learned practice rather than uncertain legal remedy.

// While these patterns align with systematic suppression practice, the evidence remains exploratory rather than conclusive. The data establish that removal operates at material scale, concentrates in Germany specifically, and exhibits characteristics associated with proceduralized activity. However, demonstrating correlation between these patterns and identifying their causal mechanism are distinct claims. Section 5 discusses what additional evidence would be required to distinguish between competing explanations more definitively.
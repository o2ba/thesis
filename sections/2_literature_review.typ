= Literature Review and Theoretical Framework

#set par(leading: 1em, justify: false)

#show table.cell.where(y: 0): strong
#set table(
  inset: (x, y) => if y == 0 { (x: 8pt, y: 8pt) } else { (x: 10pt, y: 10pt) },
  stroke: (x, y) => if y == 0 {
    (bottom: 0.7pt + black)
  },
  align: left
) 

*Literature Table*

#table(
  columns: (130pt, 1fr),
  table.header([Author (Year)], [Core Argument(s)]),
  [#cite(<akerlof_market_1970>, form: "prose")],  [Markets fail when buyers cannot observe quality ex ante],
  [#cite(<nelson_information_1970>, form: "prose")],[Quality becomes knowable only through consumption],
  [#cite(<shapiro_premiums_1983>, form: "prose")],  [Reputation functions as a form of intangible capital; firms expect future profits in exchange for maintaining the reputation today],
  [#cite(<chevalier_effect_2006>, form: "prose")], [Higher average ratings and more positive reviews lead to higher sales (for books); Negative reviews are more influential than positive ones (negativity bias)],
  [#cite(<mayzlin_promotional_2014>, form: "prose")], [Firms post fake positive reviews for themselves and fake negative reviews for competitors; higher competition leads to higher faking],
  [#cite(<hennig-thurau_electronic_2004>, form: "prose")], [Defines eWOM; Online articulation is driven primarily by social benefits, altruism, self-enhancement, and economic incentives],
  [#cite(<dellarocas_digitization_2003>, form: "prose")], [Online feedback systems build large‑scale trust by aggregating user evaluations; platform trustworthiness is central to their effectiveness],
  [#cite(<park_information_2009>, form: "prose")], [Negative eWOM has stronger influence than positive; negativity effect is amplified for experience goods; source credibility moderates impact],
  [#cite(<you_meta-analysis_2015>, form: "prose")], [eWOM volume and valence increase sales; effects strongest for private, low‑trialability products and independent review sites],
  [#cite(<babic_rosario_effect_2016>, form: "prose")], [eWOM volume and valence positively affect sales],
  [#cite(<anderson_learning_2012>, form: "prose")], [Yelp half‑star increases raise restaurant demand by \~19 ppts (+49%); effects strongest where other info is scarce],
  [#cite(<baumeister_bad_2001>, form: "prose")], [Across diverse domains, negative events, emotions, and feedback exert stronger, longer, and broader effects than positive ones],
  [#cite(<luca_fake_2016>, form: "prose")], [Weak reputation and competition increase review fraud],
  [#cite(<babic_rosario_conceptualizing_2020>, form: "prose")], [Conceptualizes eWOM process in three stages: creation, exposure, and evaluation; organizes literature using consumer motivation-opportunity-ability (MOA) framework],
)

*Legal Rulings Summary*

#table(
  columns: (160pt, 1fr),
  table.header([Case], [Decision(s)]),
  [Gynecologist ./ Jameda
  @noauthor_bgh_2014], [Gynecologist wanted his entire history removed from Jameda. He argued that the inclusion on the platform violated his personal rights. Court ruled in favor of the platform.],
  [Dentist ./. Jameda \ #cite(<noauthor_bgh_2016>, form: "normal")],  [A user posted a negative review on a dentist's profile on Jameda. Dentist argued there was no customer relationship. Court held that Jameda did not do enough to verify relationship],
  [Holiday park operator ./. HolidayCheck \ @noauthor_bgh_2022], [Holiday park operator claimed multiple reviews lacked customer contact. Court held that business's unverified assertion of non-contact obligates platform to investigate; burden of proving contact falls on platform]
)

*Directives and Law*

#table(
  columns: (160pt, 1fr),
  table.header([Case], [Summary]),
  [E-Commerce Directive \ @noauthor_directive_2000], [Establishes basic legal framework for online services in the EU, granting conditional liability for user-generated content if they act promptly on knowledge of illegal material],
  [Digital Services Act @european_comission_regulation_2022],  [Modernizes and expands EU platform regulation, mandating transparency, risk mangement and due process in content moderating],
)


#set par(leading: 2em, justify: true)

#pagebreak()

== Information Asymmetry in Markets for Experience Goods <lr-info-asym>

Markets function efficiently when buyers and sellers possess symmetric information about the quality of goods being exchanged. Yet in many consumer markets, this condition fails systematically. #cite(<akerlof_market_1970>, form: "prose") formalized how pre-purchase information asymmetries undermine market efficiency: when sellers possess private information about product quality that buyers cannot verify before transaction, adverse selection may drive high-quality goods from the market. His analysis of used automobile markets, where dealers know whether a car is reliable but buyers cannot distinguish lemons from peaches, demonstrated how asymmetric information creates welfare losses and potential market collapse.

Experience goods present a distinct but related informational challenge. #cite(<nelson_information_1970>, form: "prose") distinguished between search goods (e.g clothing or furniture) whose quality can be verified through inspection before purchase, and experience goods, whose quality becomes known only through consumption. Restaurants, medical services, personal-care providers, and most consumer services fall into the latter category: a diner cannot assess food quality by examining a menu, and a patient cannot evaluate clinical competence by inspecting a waiting room. Unlike #cite(<akerlof_market_1970>, form: "author")'s used-car market, where sellers possess private information about objective quality attributes that buyers lack, experience goods involve quality dimensions that are inherently unknowable ex-ante by both parties.

In such environments, reputation emerges as the primary mechanism for reducing information asymmetry. #cite(<shapiro_premiums_1983>, form: "prose") formalized reputation as a form of intangible capital that sellers invest in and consumers rely upon when quality cannot be directly verified. Through repeated interactions, high-quality providers build reputational assets that signal credibility, while low-quality providers face reputational sanctions that constrain future demand. Reputation thus functions as a substitute for direct quality observation: by aggregating past consumers' experiences, it enables future consumers to make inferred quality assessments and provides firms with feedback about how their service performance is perceived. The efficiency of this mechanism depends critically on how experiential information circulates among market participants - that is, on the information architecture through which post-consumption feedback becomes observable and actionable.

In contemporary markets, these reputational signals are no longer exchanged interpersonally but through digital intermediaries that aggregate and rank consumer feedback at scale @chevalier_effect_2006. Control over these visibility mechanisms determines whose experiences shape perceived quality, making the governance of online reputation a core determinant of market transparency. Critically, this creates incentives for strategic manipulation not only through adding favorable signals @mayzlin_promotional_2014, but also through suppressing unfavorable ones, a distinction with important implications for how reputation systems function in practice.

While Shapiro's model assumed reputational information circulated through repeated bilateral interactions, contemporary markets concentrate this information flow through digital platforms.

== Electronic Word-of-Mouth in Digital Markets

Digital review platforms have transformed reputation from informal social knowledge into quantifiable market information. Online reviews, termed electronic word-of-mouth @hennig-thurau_electronic_2004, aggregate individual consumer experiences into numerical ratings that function as quality signals for experience goods. Unlike traditional interpersonal recommendations, these evaluations persist indefinitely, reach mass audiences, and become algorithmically ranked by platforms into summary metrics @dellarocas_digitization_2003. For businesses, this quantification has direct economic consequences: numerical ratings influence search visibility, shape consumer choice @park_information_2009, and measurably affect revenue @you_meta-analysis_2015 @babic_rosario_conceptualizing_2020

The economic consequences of online reviews for firm performance are substantial and well-documented. Meta-analyses consistently find positive elasticities between ratings and sales: #cite(<you_meta-analysis_2015>, form: "prose") estimate that a one-percentage-point increase in online ratings corresponds to approximately 0.24% higher product sales across 96 studies, while #cite(<babic_rosario_effect_2016>, form: "prose") confirm significant positive effects across 1,035 effect sizes spanning multiple platforms and product categories. These aggregate patterns translate into measurable revenue consequences for individual businesses, particularly in service industries where consumers rely heavily on peer recommendations to resolve quality uncertainty.

The magnitude of these effects is especially pronounced in local service markets. @anderson_learning_2012 demonstrate that restaurants on Yelp whose average ratings fall just above half-star rounding thresholds, displaying as 4.0 rather than 3.5 stars for instance, experience 49% higher reservation demand than observationally similar restaurants whose ratings fall just below the threshold, despite underlying quality differences of as little as 0.01 rating points. For a restaurant operating near this margin, a single negative review that drops the displayed rating by half a star can eliminate nearly half of potential customers.
This economic impact exhibits systematic asymmetry. @chevalier_effect_2006 find that one-star reviews depress book sales more than five-star reviews increase them, documenting what psychologists term negativity bias: consumers weight negative information more heavily than positive information in quality assessments @baumeister_bad_2001. In practical terms, removing one damaging review prevents more revenue loss than soliciting several positive reviews generates revenue gain. This pattern proves robust across product categories and platforms.


== Reputation Management

Given the measurable revenue effects of online ratings, firms have strong financial incentives to shape the reviews that appear on digital platforms. Academic research has documented various forms of strategic intervention in online review systems. #cite(<mayzlin_promotional_2014>, form: "prose") demonstrated that hotels systematically post promotional reviews for themselves on competing platforms while posting negative reviews for competitors, with such behavior concentrated among independent businesses facing competitive pressure. #cite(<luca_fake_2016>, form: "prose") found that restaurants with weak or recently damaged reputations are more likely to engage in positive review fraud, while increased competition from independent rivals drives negative fake reviews targeting competitors. Beyond direct fabrication, businesses solicit reviews selectively from satisfied customers while discouraging feedback from dissatisfied ones, creating sample selection bias even when individual reviews remain authentic. Regulators now frame these practices as consumer deception that degrades decision-making quality @bundeskartellamt_sektoruntersuchung_2020 @federal_trade_commission_decision_2025

These documented strategies share a common feature: they inject positive signals into the information environment or prevent negative signals from entering it. However, the effectiveness of such additive approaches is fundamentally constrained by negativity bias @baumeister_bad_2001 @chevalier_effect_2006.

This asymmetry has direct implications for reputation management strategy. If removing a single one-star review prevents more demand loss than adding multiple five-star reviews generates demand gain, firms face particularly strong incentives to suppress negative feedback rather than dilute it with positive signals. Yet despite this motivation, comprehensive reviews of electronic word-of-mouth literature address review creation, volume, valence, and their effects on consumer behavior @babic_rosario_conceptualizing_2020 @you_meta-analysis_2015, but the examination of negative review removal as a reputation management strategy remains sparse. This gap is notable: negativity bias suggests that suppression may be the most effective form of reputation intervention available to firms.

== Institutional Context in Germany

Because businesses have strong incentives to manipulate incentives to manipulate online reviews, platforms must also act as arbitrators to preserve the credibility of their feedback systems. #cite(<dellarocas_digitization_2003>, form: "prose") argues that reputation mechanisms function effectively only when consumers perceive aggregated feedback as trustworthy, making content moderation central to platform viability.

The European Digital Services Act, which governs platform content moderation across the EU, distinguishes between voluntary removal based on platform policies and legally mandated removal following external complaints  #cite(<european_comission_regulation_2022>, supplement: "Article 17 (3)(b)"). Voluntary removals, in the case of Google, apply uniformly across jurisdictions: prohibited and restricted content standards are identical everywhere @google_prohibited_2025. Legal removals, by contrast, respond to jurisdiction-specific defamation, personality-rights, or other legal claims, making their incidence sensitive to national legal frameworks. Platform treatment of such claims is governed by conditional immunity provisions. The E-Commerce Directive @noauthor_directive_2000 grants platforms immunity from liability for user-generated content but withdraws that protection once the platform obtains "actual knowledge" of unlawful material. What exactly constitutes unlawful content, however, is determined by national law. In Germany, judicial interpretation has transformed this conditional immunity framework into a system that effectively mandates review removal when businesses contest authenticity.

A sequence of Federal Court rulings progressively expanded platform obligations when businesses challenge reviews. In Jameda I @noauthor_bgh_2014, the court initially recognized review platforms as serving socially desirable informational functions while establishing that businesses possess personality rights warranting protection. @noauthor_bgh_2016 then imposed heightened verification duties: when a business claims no customer relationship exists, platforms must request detailed evidence from reviewers and forward non-identifying information to the business. Critically, the court held that platform failure to adequately investigate results in the business's claim being deemed admitted. Most recently, BGH VI ZR 1244/20 (#cite(<noauthor_bgh_2022>, form: "year")) lowered evidentiary thresholds further, holding that a business's simple assertion of non-existent customer contact obligates platforms to investigate, with the burden of proving contact falling on the platform.
Because data protection law prevents platforms from disclosing reviewer identities or detailed transaction information, verification often proves practically impossible. This creates a procedural asymmetry: businesses need only claim no transaction occurred, while platforms cannot obtain evidence to refute that claim without violating privacy regulations. Deletion thus becomes the legally safest response, transforming what might otherwise be a discretionary moderation decision into a compelled action.

== Research Framework and Hypotheses

The theoretical foundation identifies a reciprocal incentive structure between firms and platforms. Firms have strong economic motivation to remove negative reviews because negativity bias means that a single one-star review inflicts more damage than multiple five-star reviews can repair @baumeister_bad_2001 @chevalier_effect_2006. For platforms operating in Germany, expansive personality-rights protections and Federal Court rulings convert legal notice into obligation, making removal the economically rational response to liability risk @noauthor_bgh_2014 @noauthor_bgh_2016 @noauthor_bgh_2022. When both sides of the market face aligned incentives, businesses seeking suppression and platforms seeking liability avoidance, systematic deletion becomes a predictable equilibrium outcome rather than an occasional legal remedy.

This convergence should manifest empirically in two observable patterns. First, if Germany's institutional environment truly enables suppressive reputation management, removal activity should occur at substantial volume. The Digital Services Act's mandatory transparency reporting makes this pattern observable: platforms must now disclose removal requests and their legal basis across all EU member states @european_comission_regulation_2022. Germany's protective legal regime, where businesses can trigger platform investigation obligations through simple assertion of non-contact, should produce significant removal activity reflecting systematic use of legal mechanisms for reputation management.

Second, if removal has become a reliable strategy rather than an uncertain legal gamble, businesses should experience high success rates when they contest reviews. Platforms facing potential liability under German court precedents likely find compliance more attractive than litigation: removal becomes the path of least resistance, cheaper than court defense and less risky than maintaining potentially actionable content. If this logic holds, businesses claiming reviews lack valid customer relationships should achieve consistently high removal rates. In contrast, if removal remained genuinely discretionary or required substantive evidence of illegitimacy, success rates would reflect the actual distribution of fraudulent versus authentic negative reviews, likely producing considerably lower approval rates. Moreover, if suppression functions as a reliable tool, we should observe businesses using it systematically and repeatedly rather than as an occasional legal remedy. These expectations yield two testable hypotheses:


_ -- H1: Germany’s protective defamation and personality-right regime enables businesses to pursue suppressive reputation-management strategies, resulting in a higher incidence of online review removals. _

_ -- H2: In the German context, businesses that request removal of negative reviews can reliably expect compliance, with systematic use by repeat filers indicating this has become a standardized practice_
// Additive: Increase visibility of positive signals, Suppressive: Signal jamming

/*

- Builds proper foundations (§2.1-2.2): Readers understand why reputation matters

- Establishes stakes (§2.3): Economic evidence shows magnitude of reputation effects

- Explains transformation (§2.4): Platforms changed game

- Introduces framework (§2.5): Additive vs. suppressive as analytical lens

- Provides context (§2.6): German legal environment explains mechanism

- Identifies gap (§2.7): Sets up your empirical contribution

*/

// Recipe for suppressive removals
// Though I dont think I can prove it (even with lit), I think suupressive is actually better than additive as we saw in one research that the impact of 1 star is higher than 5 star, meaning removing 1 star review is better than adding 5 star reviews (forgot who said this)
// - The business cares about their reputation
// - A business has a negative reputation
// - An abuse mechanism exists
//   - Platform liability (usually required)
//   - Government regulation / business protection (defamation laws in germany)
//   - Reporting mechanisms (DSA)
// - Economic feasability
// 


// Introduce information asym: dual information asym unlike Akerlof's market for lemons

// Introduce early WOM, prove that WOM is an tool used by consumers for purchase decisions. Early interpersonal mechanisms? Maybe also short thing about influencers

// Page 2: Show managerial and consumer impact of information asym (sets the baseline for WHY a business might engage in rep mgmt)

// Page 3: Bridge to eWOM maybe ? Chevalier & Mayzlin?

// Page 4: Maybe I can now introduce my frameowrk on additivie vs suppressive rep mgmt., or maybe this is too early


= Literature Review and Theoretical Framework

== Information Asymmetry in Markets for Experience Goods

Markets function efficiently when buyers and sellers possess symmetric information about the quality of goods being exchanged. Yet in many consumer markets, this condition fails systematically. #cite(<akerlof_market_1970>, form: "prose") formalized how pre-purchase information asymmetries undermine market efficiency: when sellers possess private information about product quality that buyers cannot verify before transaction, adverse selection may drive high-quality goods from the market. His analysis of used automobile markets, where dealers know whether a car is reliable but buyers cannot distinguish lemons from peaches, demonstrated how asymmetric information creates welfare losses and potential market collapse.

Experience goods present a distinct but related informational challenge. #cite(<nelson_information_1970>, form: "prose") distinguished between search goods, whose quality can be verified through inspection before purchase, and experience goods, whose quality becomes known only through consumption. Restaurants, medical services, personal-care providers, and most consumer services fall into the latter category: a diner cannot assess food quality by examining a menu, and a patient cannot evaluate clinical competence by inspecting a waiting room. Unlike #cite(<akerlof_market_1970>, form: "author")'s used-car market - where sellers possess private information about objective quality attributes that buyers lack, experience goods involve quality dimensions that are inherently unknowable ex-ante by both parties. Service quality is co-produced through the interaction of provider inputs and consumer characteristics, varies across transactions, and depends partly on subjective evaluation: as #cite(<parasuraman_conceptual_1985>, form: "prose") formalized, service quality reflects the difference between perceived and expected service. A restaurant meal's quality emerges from ingredients, preparation, timing, and the diner's particular preferences and mood; it cannot be fully specified in advance.

// We can revisit this parasuraman paper later by saying that reviews are not a perfect metric for actual service quality, but rather as observed based on percieved and expected service - we will reuse in § 2.4

This creates an informational structure more complex than #cite(<akerlof_market_1970>, form: "author")'s unidirectional asymmetry. On the demand side, consumers face an #cite(<akerlof_market_1970>, form: "author")-type problem: they cannot distinguish high-quality from low-quality providers before experience, creating potential for adverse selection. On the supply side, firms face their own informational constraint: while they control service inputs and processes, consumer perceptions and satisfaction remain largely opaque until feedback is voluntarily expressed or actively solicited. A physician may follow clinical best practices yet remain unaware that patients find their manner dismissive; a restaurateur may use premium ingredients yet not realize customers consider portions inadequate. This creates dual opacity: consumers cannot assess provider quality, and providers cannot observe consumer perceptions. Neither party can rely on direct observation.

// honestly very good paragraph. very good for image. will keep this way

In such environments, reputation emerges as the primary mechanism for reducing information asymmetry. #cite(<shapiro_premiums_1983>, form: "prose") formalized reputation as a form of intangible capital that sellers invest in and consumers rely upon when quality cannot be directly verified. Through repeated interactions, high-quality providers build reputational assets that signal credibility, while low-quality providers face reputational sanctions that constrain future demand. Reputation thus functions as a substitute for direct quality observation: by aggregating past consumers' experiences, it enables future consumers to make inferred quality assessments and provides firms with feedback about how their service performance is perceived. The efficiency of this mechanism depends critically on how experiential information circulates among market participants - that is, on the information architecture through which post-consumption feedback becomes observable and actionable.

Yet the architecture through which feedback circulated in pre-digital  markets imposed severe constraints. Informal interpersonal word-of-mouth, while personally trusted, remained geographically  bounded, temporally ephemeral, and informationally incomplete for both consumers and firms @arndt_role_1967.

/* #cite(<akerlof_market_1970>, form: "author") himself identified seller-initiated mechanisms that could mitigate adverse selection: warranties and guarantees function as costly signals by shifting risk from buyer to seller, credibly distinguishing high-quality providers willing to absorb potential returns from low-quality providers who would face unsustainable warranty costs. Spence (1973) formalized this logic more generally: when quality is unobservable, costly signals enable high-quality actors to separate themselves from low-quality imitators, provided the signal's cost is negatively correlated with underlying quality. Yet these mechanisms presuppose objectively verifiable quality dimensions. A car either starts or it doesn't; a warranty claim is adjudicable. Experience goods resist such contractibility: subjective perceptions of service quality - whether a waiter was attentive, a massage was relaxing, a diagnosis was empathetic - cannot be credibly guaranteed ex-ante. The solution that emerged was consumer-generated signaling: word-of-mouth communication, and later online reviews, function as credibly costly signals (in time, effort, and social capital) that transmit experiential information from past consumers to future ones. These signals differ from Spence's education credential or Akerlof's warranty in a crucial respect: they originate from third parties rather than sellers, making them less susceptible to strategic manipulation. Yet as digital platforms centralized the transmission of these signals, they also created new vulnerabilities: if reputational signals can be systematically suppressed or jammed, the informational infrastructure that supports market efficiency becomes itself subject to strategic distortion */


== Pre-Digital Word-of-Mouth Communication

// Hm, we ignore reputation generation through influencer marketing/advertising
Prior to the emergence of digital platforms, consumers relied primarily on interpersonal word-of-mouth to resolve uncertainty in experience-goods markets. #cite(<arndt_role_1967>, form: "prose") provided early empirical evidence of this mechanism: in a study of new product diffusion through a housing community, recipients of negative word-of-mouth were significantly less likely to purchase than those who received positive reports or no word-of-mouth at all. Experiential knowledge circulated through social networks, allowing consumers to convert others' post-consumption information into their own pre-purchase signals without bearing the cost of personal trial.

Yet pre-digital word-of-mouth operated under severe structural constraints. It was geographically bounded, rarely extending beyond immediate social circles; temporally ephemeral, leaving no permanent record; and non-aggregable, presenting anecdotes rather than patterns. A dissatisfied customer might warn friends about poor service, but this signal decayed quickly and reached few potential consumers. More importantly, firms themselves remained largely invisible to these conversations. #cite(<richins_negative_1983>, form: "prose") found that dissatisfied consumers were motivated both to warn others (Altruism) and to retaliate (Vengeance) against firms by damaging their reputations, yet most negative experiences were shared with other consumers rather than reported to the firms themselves. A patient who experienced dismissive treatment might tell acquaintances to avoid that doctor, leaving management unaware while negative perceptions circulated through the community. While consumers transmitted experiences among themselves, service providers learned about perceptions primarily through aggregate market outcomes, declining sales or customer churn, which provided no diagnostic information about which service attributes drove dissatisfaction.

This asymmetry between complaint behavior and word-of-mouth activity meant firms operated with incomplete and biased feedback: they oversampled extreme complainers willing to voice concerns directly while remaining blind to the broader circulation of negative perceptions in consumer networks @hirschman_exit_1970. Consumers made decisions based on limited and potentially unrepresentative information from their immediate networks. Firms invested in quality improvements without systematic visibility into how their efforts were perceived. Both inefficiencies reflected the same underlying constraint: the absence of a mechanism that could make post-consumption feedback simultaneously persistent, aggregable, and bidirectionally visible to both consumers and producers. Digital platforms would eliminate this constraint, and in doing so, transform reputation from an informal social process into a formalized, measurable, and strategically manageable asset.

== Digital Reputation as Intangible Marketing Asset

As documented in the introduction, online ratings causally affect consumer demand and firm revenue, establishing that platform-mediated reputation functions as intangible capital that must be strategically managed @anderson_learning_2012 @luca_fake_2016. Yet the relationship between reviews and demand is not symmetric.

// Bad is stronger than good. I could also cite Baumeister and al.

#cite(<chevalier_effect_2006>, form: "prose"), analyzing book sales on Amazon and Barnes & Noble, found that negative reviews exerted stronger marginal influence on purchasing behavior than positive reviews of equivalent magnitude. A one-star decrease had a larger absolute impact on sales than a one-star increase, even controlling for review volume and product characteristics. This pattern reflects a broader psychological principle: across contexts ranging from interpersonal relationships to risk assessment, negative information carries disproportionate weight in judgment and decision-making @baumeister_bad_2001

The existence of this negativity bias has important strategic implications for reputation management. If negative reviews impose disproportionate costs on demand, firms face strong economic incentives to manage their digital reputation, not merely to cultivate positive signals but to minimize the visibility of negative ones. The mechanisms through which firms exercise these incentives, and the extent to which platforms facilitate or constrain such efforts, depend on how digital platforms structure and govern reputational information flows.

== Electronic Word-of-Mouth and Platform Intermediation


Digital platforms fundamentally restructured the information architecture through which experiential knowledge circulates. #cite(<dellarocas_digitization_2003>, form: "prose") conceptualizes online feedback mechanisms as systems that harness the Internet's bidirectional communication capabilities to engineer large-scale word-of-mouth networks. Unlike pre-digital WOM, which was geographically bounded, temporally ephemeral, and informationally incomplete, platforms made feedback persistent: digital reviews remain indefinitely accessible, accumulating into archives that document consumption histories across time. Platforms also made feedback aggregable by converting subjective experiences into quantified ratings, enabling statistical summarization that transforms individual anecdotes into comparable metrics. Most critically, platforms made feedback bidirectionally visible: businesses gained real-time access to consumer perceptions expressed directly and publicly.

Yet platforms do not function as neutral infrastructure. They actively mediate the information they host through design choices that determine what feedback becomes visible and how it is displayed. A platform might show only recent reviews, display average ratings more prominently than review text, or allow businesses to flag content for removal. These choices shape which reputational signals reach consumers and create potential mechanisms for manipulation. In Germany, this gatekeeping function carries particular weight: a 2025 Federal Cartel Office ruling identified Google's control over points-of-interest data as a de facto monopoly @bundeskartellamt_beschluss_2025 over local business visibility. By determining which businesses appear in search results and which reviews are displayed, Google effectively determines which reputational signals become publicly legible within Germany's digital marketplaces.

This concentration of gatekeeping power raises questions about how firms navigate platform moderation when economic incentives favor reputation management. Understanding these dynamics requires examining the strategies firms employ and the institutional mechanisms platforms provide for disputing or removing unfavorable content


== Reputation Management

The transformation of reputation from informal social process to platform-mediated information system created systematic opportunities for firms to strategically intervene in their own reputational outcomes. Drawing on information economics, reputation can be understood as a signal about unobservable quality @shapiro_premiums_1983: reviews communicate consumption experiences that prospective customers cannot directly verify ex-ante. Platform-mediated reputation management thus involves strategic manipulation of the signals available to consumers. We distinguish two fundamental dimensions along which firms can intervene: additive strategies that increase the visibility of favorable signals, and suppressive strategies that reduce the visibility of unfavorable signals.

Additive strategies inject positive signals into the information environment, soliciting reviews from satisfied customers, incentivizing favorable feedback, or creating promotional content masquerading as authentic opinion. These practices shift the distribution of visible signals toward the positive end. Suppressive strategies remove negative signals from the information environment. Rather than competing within the marketplace of signals, suppression controls which signals enter it. In information, theoretic terms, suppressive reputation management functions as signal jamming: interfering with the transmission of unfavorable information from consumers to prospective customers.

Additive strategies accept the platform's informational structure and seek advantage within it. Suppressive strategies challenge that structure by contesting specific signals' legitimacy through external authority; legal systems, platform policies, social norms. The firm repositions from self-interested actor to rights-holder defending against illegitimate attacks, transforming suppression from manipulation into redress.

Academic research has focused predominantly on additive manipulation. #cite(<mayzlin_promotional_2014>, form: "prose") demonstrated that hotels post promotional reviews on competing platforms; #cite(<luca_fake_2016>, form: "prose") estimated 16 percent of Yelp reviews may be fake. Regulators now frame such practices as consumer deception degrading decision-making quality @bundeskartellamt_sektoruntersuchung_2020 @federal_trade_commission_decision_2025. Platform responses emphasize detection algorithms and filtering mechanisms.

Yet suppression requires specific institutional conditions: legal frameworks permitting content challenges, platform liability regimes incentivizing compliance, and professionalized intermediaries reducing transaction costs. Germany may present such an alignment. Investigative journalism has documented instances where reputation-management firms systematically flag content until platforms remove it @brauer_google-bewertungen_2025 @wulfers_warum_2025. A market of Löschagenturen (deletion agencies) now openly advertises review-removal services with fixed-price packages, as low as €10 per deletion, and self-reported success rates exceeding 90 percent @wulfers_warum_2025.

Given the negativity bias, suppressive strategies offer three theoretical advantages over additive approaches. First, effectiveness: removing a one-star review prevents more demand loss than adding a five-star review generates demand gain @chevalier_effect_2006. Second, regulatory risk: suppression invokes legal rights (defamation, personality rights), framing removal as legitimate redress rather than market manipulation. This avoids regulatory scrutiny faced by additive strategies (e.g., FTC enforcement against fake reviews). Third, permanence: successfully removed reviews disappear permanently with no decay. Moreover, suppression targets the most damaging information directly, while addition only indirectly addresses it by shifting aggregate statistics.

Despite these theoretical advantages and preliminary evidence of commercial suppression services, systematic empirical research remains absent. Comprehensive reviews of electronic word-of-mouth literature @babic_rosario_conceptualizing_2020 discuss review creation, exposure, and influence on consumer behavior but do not examine how firms systematically suppress negative reviews through legal mechanisms. We lack basic descriptive knowledge about prevalence, cross-national variation, and sectoral patterns of legally-driven review removal. Yet even preliminary evidence of commercial deletion services raises institutional questions: Which legal frameworks facilitate suppression? How do platform governance procedures process removal requests? Why might Germany's regulatory environment prove particularly conducive to legally-driven suppression? Understanding these mechanisms requires examining the intersection of national defamation law, platform liability regimes, and content moderation practices.

== Institutional Preconditions For Suppressive Reputation Management

Suppressive reputation management does not emerge from economic incentive alone. While the negativity bias establishes universal motivation to remove negative content, systematic suppression requires enabling institutions that convert incentive into action. Three preconditions must align: legal frameworks that provide grounds for contesting content, platform liability structures that incentivize compliance with removal requests, and low transaction costs that make suppression economically feasible at scale. Where any precondition is absent, suppression remains sporadic rather than systematic.

Systematic suppression requires legal doctrines that provide businesses with standing to challenge negative reviews. Jurisdictions vary in the grounds they recognize. Narrow defamation frameworks limit challenges to demonstrably false statements of fact, excluding opinions and subjective evaluations. Broader frameworks encompass personality rights, dignity protections, or reputational harm independent of factual falsity. The threshold matters: where law requires proof of actual malice, deliberate falsehood, or material harm, few reviews meet removal standards. Where law protects against reputational damage even from truthful but harmful statements, more content becomes contestable. The scope of these legal frameworks determines the range of reviews that firms can plausibly challenge.

Legal frameworks acquire practical force only when platforms face consequences for non-compliance. Liability regimes determine whether platforms treat removal requests as optional suggestions or legal obligations. Where platforms enjoy broad immunity for user content, they may adjudicate disputes conservatively, requiring clear evidence of illegality before removing content. Where platforms face financial penalties for hosting unlawful material, risk calculus shifts: the cost of incorrectly removing legitimate content is primarily reputational and diffuse, while the cost of failing to remove unlawful content is concentrated and financial. Liability thus creates asymmetric incentives that favor removal. Standardized notice-and-action procedures further reduce platforms' decision-making burden: when complaints invoke statutory obligations with defined timeframes, compliance becomes an operational routine rather than a case-by-case legal judgment.

Even where legal frameworks permit challenges and platform liability encourages compliance, suppression remains constrained by the costs of initiating removal requests. Engaging legal counsel to draft takedown notices invoking defamation or personality-rights doctrines represents a fixed cost accessible primarily to larger firms with dedicated legal departments. Professionalized intermediaries alter this calculus by standardizing knowledge and procedure. When deletion agencies commodify the process through fixed-price packages, suppression becomes economically feasible for small businesses operating on thin margins. The emergence of such intermediaries signals that suppression has achieved sufficient reliability and volume to support a specialized service industry.

Germany presents a case where all three preconditions align. Its substantive legal framework provides broad grounds for challenging reviews: constitutional personality rights extend to legal persons under Art. 1-2 GG, while criminal defamation provisions (§§185-187 StGB) establish liability for insult, malicious gossip, and defamation. Unlike narrower frameworks requiring proof of factual falsity or actual malice, German personality-rights doctrine protects against reputational harm even from subjective evaluations, lowering the threshold for actionable content. These protections provide the first precondition: legal grounds for challenging negative reviews.
#cite(<bundesrepublik_deutschland_grundgesetz_1949>, form: none)
#cite(<bundesrepublik_deutschland_strafgesetzbuch_1949>, form: none)

Platform liability, the second precondition, creates risk that discourages platforms from defending disputed reviews. In BGH VI ZR 1244/20 (#cite(<noauthor_bgh_2022>, form: "year")), Germany's Federal Court of Justice held that a business's bare assertion of missing customer contact suffices to trigger platform investigation duties, even when the review contains details suggesting genuine service. The court reasoned that businesses "cannot verify" anonymous reviewers' claims and need provide no supporting evidence. Platforms that fail to investigate face liability as "indirect disturbers." This creates asymmetric risk: platforms face legal exposure for non-removal but no liability for wrongful removal, since anonymous reviewers lack standing. The decision establishes predictable incentives favoring removal over contestation.

Additional judicial decisions reinforce this environment. In OLG Köln 6 U 83/22 (#cite(<noauthor_olg_2022>, form: "year")), a regional appeals court held that one-star reviews without factual explanation constitute actionable disparagement under competition law, treating such ratings as "blanket denigration" when reviewers provide no substantive justification for their assessment. The decision extends removal grounds beyond personality-rights claims into unfair competition doctrine, creating multiple legal pathways through which businesses can challenge negative feedback.

The Digital Services Act @european_comission_regulation_2022 formalized notice-and-action obligations at EU scale. Article 16 requires platforms to act expeditiously on complaints invoking national law, while Article 24 mandates that Very Large Online Platforms publish transparency reports detailing complaint processing. The DSA does not create new substantive grounds but procedurally reinforces existing national-law obligations with standardized reporting infrastructure. For researchers, this transparency requirement provides the first systematic data on legal-takedown practices previously visible only through anecdotal reporting.

The third precondition, low transaction costs, manifests through Germany's market of specialized deletion agencies (Löschagenturen). These intermediaries advertise fixed-price packages as low as €10 per removal with self-reported success rates exceeding 90 percent @wulfers_warum_2025. By standardizing complaint templates and filing procedures, they commodify what would otherwise require individualized legal counsel. The economic viability of transaction-based pricing signals operational maturity: German suppression is sufficiently predictable and routinized to support a specialized service industry accessible even to small businesses.

The institutional framework predicts a testable pattern: if broad legal grounds, low liability thresholds, and professionalized intermediaries enable systematic suppression, takedown requests should succeed at significantly higher rates in Germany than in jurisdictions where any precondition is absent. The Digital Services Act's transparency mandates provide the first opportunity to test this prediction empirically.

== Research Framework and Hypotheses

The preceding review establishes that digital reputation functions as intangible marketing capital that firms must strategically manage to maintain competitive position. Online ratings causally affect consumer demand and firm revenue @anderson_learning_2012 @luca_fake_2016, transforming platform-mediated reputation into a measurable marketing asset with direct performance implications. Negative reviews impose disproportionate costs due to negativity bias @baumeister_bad_2001 @chevalier_effect_2006, creating universal economic incentive for firms to minimize negative signal visibility. Yet suppressive reputation management, the strategic removal of negative reviews through legal mechanisms, cannot emerge from economic incentive alone. Section 2.6 identified three institutional preconditions that convert motivation into systematic marketing capability: legal frameworks providing grounds to challenge content, platform liability regimes incentivizing compliance with removal requests, and professionalized intermediaries reducing transaction costs. Where these conditions align, suppression transforms from sporadic redress into routine marketing practice, conferring market-specific competitive advantages unavailable to firms operating under different institutional constraints.

Germany and France provide a natural experiment in institutional divergence. Both countries share civil law traditions, comparable economic structures, similar digital platform adoption, and equivalent obligations under the DSA's Article 16 notice-and-action mechanism. Yet their judicial interpretations of platform liability and evidentiary standards diverge sharply. German Federal Court rulings established that businesses' bare assertions of missing customer contact suffice to trigger platform investigation duties, with platforms facing liability as "indirect disturbers" for non-removal @noauthor_bgh_2022. Courts extended removal grounds to encompass one-star ratings lacking factual explanation, treating such reviews as actionable disparagement @noauthor_olg_2022. French courts maintain substantially higher evidentiary burdens, requiring that defamation allegations be provable "sans difficulté" (without difficulty) and placing the burden of proof on complainants @ollard_jurisprudence_2011. This institutional divergence enables a first hypothesis:

-- *H1: Germany's institutional environment enables functional suppressive reputation management infrastructure.*

If elevated enforcement rates enable systematic suppression as a predictable strategy, businesses with suppression access should exhibit rating patterns consistent with successful negative-signal removal. Yet establishing causality requires isolating the institutional mechanism from confounding factors such as underlying quality differences or selection into complaint behavior. This motivates a cross-jurisdictional comparison: German businesses filing takedown requests serve as the treatment group, while matched French businesses in equivalent categories provide a quasi-experimental control. France shares similar consumer protection frameworks and experiences comparable platform governance, but lacks Germany's suppression infrastructure with professionalized deletion intermediaries, low evidentiary thresholds, and strong personality-rights enforcement. French businesses face identical reputational incentives and negative reviews, yet cannot systematically suppress criticism. Rating divergence between German requesters and French comparators therefore isolates the institutional effect rather than reflecting quality or selection. This enables a second hypothesis:

-- *H2: Access to functional suppression infrastructure produces observable rating premiums.*

Testing H2 compares German firms that file defamation-based takedowns with matched French firms operating under similar market and platform conditions but lacking equivalent suppression infrastructure. If suppression access inflates visible ratings, it would confirm that institutional differences, not inherent quality—drive reputational outcomes.

This study focuses on Google Maps because the Federal Cartel Office's 2025 ruling established Google's de facto monopoly over local business visibility in Germany @bundeskartellamt_beschluss_2025, making Google Maps the decisive reputation platform for points-of-interest businesses.

Supporting H1 would demonstrate that firms' marketing capabilities vary systematically by institutional market context, with identical strategies (filing takedown requests) producing divergent outcomes depending on jurisdiction-specific enforcement environments. This would establish suppressive reputation management as a market-specific competitive advantage unavailable to firms in jurisdictions lacking institutional enablement. Supporting H2 would provide first empirical evidence that legal mechanisms systematically distort the informational signals consumers rely upon for quality assessment in experience-goods markets. Together, these findings would reveal how institutional environments shape the distribution of intangible marketing assets: German firms possess reputation-management capabilities that function as de facto barriers to informational transparency, creating asymmetric competitive conditions within  harmonized regulatory frameworks and raising questions about whether digital reputation remains a reliable market signal when subject to systematic suppression.

/*

The transformation of reputation from informal social process to platform-mediated information system created systematic opportunities for firms to strategically intervene in their own reputational outcomes. Drawing on information economics, reputation can be understood as a signal about unobservable quality @shapiro_premiums_1983: reviews communicate consumption experiences that prospective customers cannot directly verify ex-ante. Platform-mediated reputation management thus involves strategic manipulation of the signals available to consumers. We distinguish two fundamental dimensions along which firms can intervene: additive strategies that increase the visibility of favorable signals, and suppressive strategies that reduce the visibility of unfavorable signals.

Additive strategies inject positive signals into the information environment, soliciting reviews from satisfied customers, incentivizing favorable feedback, or creating promotional content masquerading as authentic opinion. These practices shift the distribution of visible signals toward the positive end. Suppressive strategies remove negative signals from the information environment. Rather than competing within the marketplace of signals, suppression controls which signals enter it. In information, theoretic terms, suppressive reputation management functions as signal jamming: interfering with the transmission of unfavorable information from consumers to prospective customers.

The distinction is not merely operational but conceptual. Additive strategies accept the platform's informational structure and seek advantage within it. Suppressive strategies challenge that structure by contesting specific signals' legitimacy through external authority; legal systems, platform policies, social norms. The firm repositions from self-interested actor to rights-holder defending against illegitimate attacks, transforming suppression from manipulation into redress.

Academic research has focused predominantly on additive manipulation. #cite(<mayzlin_promotional_2014>, form: "prose") demonstrated that hotels post promotional reviews on competing platforms; #cite(<luca_fake_2016>, form: "prose") estimated 16 percent of Yelp reviews may be fake. Regulators now frame such practices as consumer deception degrading decision-making quality @bundeskartellamt_sektoruntersuchung_2020 @federal_trade_commission_decision_2025. Platform responses emphasize detection algorithms and filtering mechanisms.

Yet suppression requires specific institutional conditions: legal frameworks permitting content challenges, platform liability regimes incentivizing compliance, and professionalized intermediaries reducing transaction costs. Germany may present such an alignment. Investigative journalism has documented instances where reputation-management firms systematically flag content until platforms remove it @brauer_google-bewertungen_2025 @wulfers_warum_2025. Remarkably, a market of Löschagenturen (deletion agencies) now openly advertises review-removal services with fixed-price packages, as low as €10 per deletion, and self-reported success rates exceeding 90 percent @wulfers_warum_2025. The emergence of such services suggests that deletion has become sufficiently reliable and routinized to support commercial intermediaries, though whether this reflects systematic suppression at scale or represents marketing claims by niche operators remains empirically unresolved.

Given the negativity bias, suppressive strategies offer three theoretical advantages over additive approaches. First, effectiveness: removing a one-star review prevents more demand loss than adding a five-star review generates demand gain @chevalier_effect_2006. Signal jamming leverages this asymmetric impact more efficiently than signal injection. Second, legal risk: suppression invokes legal rights (defamation protections, personality rights) to justify removal, repositioning the firm as rights-holder rather than manipulator. Additive manipulation, in contrast, violates Google and Yelp's platform policies, whether through fraudulent content or selective solicitation of positive reviews and faces increasing regulatory enforcement @federal_trade_commission_decision_2025. Third, permanence: successfully removed reviews disappear permanently with no decay. Fake positive reviews become diluted as authentic reviews accumulate over time; their marginal impact declines. Moreover, suppression targets the most damaging information directly, while addition only indirectly addresses it by shifting aggregate statistics.

Despite these theoretical advantages and preliminary evidence of commercial suppression services, systematic empirical research remains absent. Comprehensive reviews of electronic word-of-mouth literature @babic_rosario_conceptualizing_2020 discuss review creation, exposure, and influence on consumer behavior but do not examine how firms systematically suppress negative reviews through legal mechanisms. We lack basic descriptive knowledge about prevalence, cross-national variation, and sectoral patterns of legally-driven review removal. Yet even preliminary evidence of commercial deletion services raises institutional questions: Which legal frameworks facilitate suppression? How do platform governance procedures process removal requests? Why might Germany's regulatory environment prove particularly conducive to legally-driven suppression? Understanding these mechanisms requires examining the intersection of national defamation law, platform liability regimes, and content moderation practices.
*/


// I will use this to develop that for businesses to manage their reputation, it has to first be VISIBLE to them (solved by eWOM), and that reputation management becomes necessary when conusmers rely on it. It also explains the economic logic of loeschanleitungen


/*

Markets for experience goods are characterized by an ex-ante double information asymmetry: consumers cannot assess quality before purchase, and producers may not fully understand how their service performance will be perceived by consumers. Nelson’s (#cite(<nelson_information_1970>, form: 
"year")) analysis of information and consumer behavior formalized this uncertainty as a structural feature of markets rather than a behavioral anomaly. He distinguished between search goods, where quality can be verified ex-ante, and experience goods, where quality becomes known only through consumption. In such environments, traditional price and advertising signals fail to convey reliability, making repeated interactions and reputation essential for market efficiency. Reputation thus functions as a decentralized information mechanism: through feedback from past transactions, it enables future consumers to infer unobservable quality. Yet because these feedback loops operate only after experience, they depend critically on how post-consumption information circulates across market participants.


Early research on information diffusion in consumer markets emphasized interpersonal communication as the primary channel through which experiential knowledge circulated. #cite(<arndt_role_1967>, form: "prose") showed that early adopters’ consumption experiences shaped others’ pre‑purchase evaluations, transmitting experiential knowledge through social networks before most consumers had direct experience of a product. Yet these informal communication loops operated primarily on the consumer side: they transmitted experience across demand but rarely back to producers. As a result, firms learned little from such exchanges unless mediated through market outcomes such as repeat purchase, switching, or complaint. The circulation of post‑consumption information thus remained decentralized and incomplete, underscoring the need for more structured mechanisms through which both consumers and producers could observe and respond to performance feedback.

// We get signals now bidirectionally with eWOM. Those help us understand directly how consumers feel. We can either use it to adjust experience, or we can fuck with the signals


/*

== Digital Mediation

== Points of Interest and Search

== Reputation Management as a Market Practice

== Preconditions for Suppressive Reputation Management




// Speak of influencers

/*
His framework shows that when quality cannot be observed ex-ante, market efficiency depends critically on mechanisms that aggregate and transmit post-consumption information to future market participants. Traditional economic theory suggests that repeated interactions and reputation mechanisms can mitigate these information asymmetries, allowing high-quality providers to signal their superiority and consumers to make more informed choices. When neither buyers nor sellers possess complete information about quality ex-ante, market outcomes depend critically on how information is revealed through the exchange process itself.
*/

// There's this one paper where i read that the effect of a 1 star review is greater than the effect of a 5 star review, and that consumers don't just look at the aggregate. good for a bridge between additive and suppressive imo

/*

additive (known, measured) → suppressive (neglected, emerging) → regulation (why it’s changing).
*/


/*
While online reviews have become a critical infrastructure of consumer trust, scholarly attention to how firms strategically manage these reputational signals has been uneven. A broad stream of research in economics and information systems has examined what might be termed _additive reputation management_, referring to the deliberate amplification of positive content through selective solicitation, incentivization, or manipulation of ratings @chevalier_effect_2006 @mayzlin_promotional_2014 @luca_fake_2016. This literature conceptualizes online reputation as a competitive market signal that firms can strategically optimize to influence demand and consumer perception. However, the complementary logic of suppressive reputation management, which involves the strategic removal or concealment of negative content, remains comparatively underexplored.


/*
Your contribution becomes:


- When cheap review removal is available, businesses may choose strategic ignorance over quality improvement

- This creates welfare losses because: (a) consumers get biased information, AND (b) businesses don't improve

- It's not just about information asymmetry - it's about incentives for quality investment

The German angle:


- €10 deletion services make suppression cheaper than improvement

- Strong defamation laws make removal easier

- Creates an equilibrium where businesses systematically choose ignorance over learning
*/

/* Reputation as an informational signal that reduces uncertainty (Akerlof 1970; Resnick & Zeckhauser 2002). */
/*
For conceptual clarity, this thesis defines additive reputation management as the set of firm-initiated practices that increase the visibility or volume of positive online feedback without directly removing criticism. 

/*

Chevalier & Mayzlin (2006, JMR) → consumer reviews drive sales; reputation as market signal.

Mayzlin, Dover & Chevalier (2014, AER) → firms generate promotional reviews to manipulate reputation.

Luca & Zervas (2016, Management Science) → fake or fraudulent reviews as competitive tactics.

Anderson & Magruder (2012, Economic Journal) → causal link between ratings and demand.

*/
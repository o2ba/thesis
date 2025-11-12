#heading(outlined: false, offset: 1)[Legal Rulings]

#set par(leading: 1em, justify: false)

#show table.cell.where(y: 0): strong
#set table(
  inset: (x, y) => if y == 0 { (x: 8pt, y: 8pt) } else { (x: 10pt, y: 10pt) },
  stroke: (x, y) => if y == 0 {
    (bottom: 0.7pt + black)
  },
  align: left
) 

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
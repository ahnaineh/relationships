enum Types {
  person,

  femaleAscendant,
  maleAscendant,

  // (full father's sibling)
  paternalUncle,
  // (father's paternal half brother)
  paternalPaternalHalfUncle,
  // (father's maternal half brother)
  paternalMaternalHalfUncle,

  // (full mother's sibling)
  maternalUncle,
  // (mother's paternal half brother)
  maternalPaternalHalfUncle,
  // (mother's maternal half brother)
  maternalMaternalHalfUncle,

  // (full father's sister)
  paternalAunt,
  // (father's paternal half sister)
  paternalPaternalHalfAunt,
  // (father's maternal half sister)
  paternalMaternalHalfAunt,

  // (full mother's sister)
  maternalAunt,
  // (mother's paternal half sister)
  maternalPaternalHalfAunt,
  // (mother's maternal half sister)
  maternalMaternalHalfAunt,

  // (full father's sibling's son)
  paternalMaleCousin,
  // (father's paternal half sibling's son)
  paternalPaternalHalfMaleCousin,
  // (father's maternal half sibling's son)
  paternalMaternalHalfMaleCousin,

  // (full father's sibling's daughter)
  paternalFemaleCousin,
  // (father's paternal half sibling's daughter)
  paternalPaternalHalfFemaleCousin,
  // (father's maternal half sibling's daughter)
  paternalMaternalHalfFemaleCousin,

  // (full mother's sibling's son)
  maternalMaleCousin,
  // (mother's paternal half sibling's son)
  maternalPaternalHalfMaleCousin,
  // (mother's maternal half sibling's son)
  maternalMaternalHalfMaleCousin,

  // (full mother's sibling's daughter)
  maternalFemaleCousin,
  // (mother's paternal half sibling's daughter)
  maternalPaternalHalfFemaleCousin,
  // (mother's maternal half sibling's daughter)
  maternalMaternalHalfFemaleCousin,

  husband,
  wife,

  fullBrother,
  // brother's son
  fraternalNephew,
  // brother's daughter
  fraternalNiece,

  // paternal half-brother
  paternalHalfBrother,
  // maternal half-brother
  maternalHalfBrother,

  // maternal half-brother's son
  maternalFraternalHalfNephew,
  // maternal half-brother's daughter
  maternalFraternalHalfNiece,

  // paternal half-brother's son
  paternalFraternalHalfNephew,
  // paternal half-brother's daughter
  paternalFraternalHalfNiece,

  fullSister, // sister
  // maternal half-sister
  maternalHalfSister,
  // paternal half-sister
  paternalHalfSister,

  // sister's son
  sororalNephew,
  // sister's daughter
  sororalNiece,

  // maternal half-sister's son
  maternalSororalHalfNephew,
  // maternal half-sister's daughter
  maternalSororalHalfNiece,

  // paternal half-sister's son
  paternalSororalHalfNephew,
  // paternal half-sister's daughter
  paternalSororalHalfNiece,

  maleDescendant,
  femaleDescendant,

  // maleDescendantDaughter,
  manumitter,
  treasury,
}

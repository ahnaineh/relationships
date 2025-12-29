///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsEn with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsEn({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsEn _root = this; // ignore: unused_field

	@override 
	TranslationsEn $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsEn(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsTypesEn types = _TranslationsTypesEn._(_root);
	@override late final _TranslationsRelationshipsEn relationships = _TranslationsRelationshipsEn._(_root);
}

// Path: types
class _TranslationsTypesEn implements TranslationsTypesAr {
	_TranslationsTypesEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get person => 'Person';
	@override String get femaleAscendant => 'Female Ascendant';
	@override String get maleAscendant => 'Male Ascendant';
	@override String get paternalUncle => 'Paternal Uncle';
	@override String get paternalPaternalHalfUncle => 'Paternal Uncle (Father\'s Side)';
	@override String get paternalMaternalHalfUncle => 'Paternal Uncle (Mother\'s Side)';
	@override String get maternalUncle => 'Maternal Uncle';
	@override String get maternalPaternalHalfUncle => 'Maternal Uncle (Father\'s Side)';
	@override String get maternalMaternalHalfUncle => 'Maternal Uncle (Mother\'s Side)';
	@override String get paternalAunt => 'Paternal Aunt';
	@override String get paternalPaternalHalfAunt => 'Paternal Aunt (Father\'s Side)';
	@override String get paternalMaternalHalfAunt => 'Paternal Aunt (Mother\'s Side)';
	@override String get maternalAunt => 'Maternal Aunt';
	@override String get maternalPaternalHalfAunt => 'Maternal Aunt (Father\'s Side)';
	@override String get maternalMaternalHalfAunt => 'Maternal Aunt (Mother\'s Side)';
	@override String get paternalMaleCousin => 'Paternal Male Cousin';
	@override String get paternalPaternalHalfMaleCousin => 'Paternal Male Cousin (Father\'s Side)';
	@override String get paternalMaternalHalfMaleCousin => 'Paternal Male Cousin (Mother\'s Side)';
	@override String get paternalFemaleCousin => 'Paternal Female Cousin';
	@override String get paternalPaternalHalfFemaleCousin => 'Paternal Female Cousin (Father\'s Side)';
	@override String get paternalMaternalHalfFemaleCousin => 'Paternal Female Cousin (Mother\'s Side)';
	@override String get maternalMaleCousin => 'Maternal Male Cousin';
	@override String get maternalPaternalHalfMaleCousin => 'Maternal Male Cousin (Father\'s Side)';
	@override String get maternalMaternalHalfMaleCousin => 'Maternal Male Cousin (Mother\'s Side)';
	@override String get maternalFemaleCousin => 'Maternal Female Cousin';
	@override String get maternalPaternalHalfFemaleCousin => 'Maternal Female Cousin (Father\'s Side)';
	@override String get maternalMaternalHalfFemaleCousin => 'Maternal Female Cousin (Mother\'s Side)';
	@override String get husband => 'Husband';
	@override String get wife => 'Wife';
	@override String get fullBrother => 'Brother';
	@override String get fraternalNephew => 'Nephew (Brother\'s Son)';
	@override String get fraternalNiece => 'Niece (Brother\'s Daughter)';
	@override String get paternalHalfBrother => 'Paternal Half-Brother';
	@override String get maternalHalfBrother => 'Maternal Half-Brother';
	@override String get maternalFraternalHalfNephew => 'Nephew (Maternal Half-Brother\'s Son)';
	@override String get maternalFraternalHalfNiece => 'Niece (Maternal Half-Brother\'s Daughter)';
	@override String get paternalFraternalHalfNephew => 'Nephew (Paternal Half-Brother\'s Son)';
	@override String get paternalFraternalHalfNiece => 'Niece (Paternal Half-Brother\'s Daughter)';
	@override String get fullSister => 'Sister';
	@override String get maternalHalfSister => 'Maternal Half-Sister';
	@override String get paternalHalfSister => 'Paternal Half-Sister';
	@override String get sororalNephew => 'Nephew (Sister\'s Son)';
	@override String get sororalNiece => 'Niece (Sister\'s Daughter)';
	@override String get maternalSororalHalfNephew => 'Nephew (Maternal Half-Sister\'s Son)';
	@override String get maternalSororalHalfNiece => 'Niece (Maternal Half-Sister\'s Daughter)';
	@override String get paternalSororalHalfNephew => 'Nephew (Paternal Half-Sister\'s Son)';
	@override String get paternalSororalHalfNiece => 'Niece (Paternal Half-Sister\'s Daughter)';
	@override String get maleDescendant => 'Male Descendant';
	@override String get femaleDescendant => 'Female Descendant';
	@override String get manumitter => 'Manumitter';
	@override String get treasury => 'Treasury';
}

// Path: relationships
class _TranslationsRelationshipsEn implements TranslationsRelationshipsAr {
	_TranslationsRelationshipsEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsRelationshipsBaseEn base = _TranslationsRelationshipsBaseEn._(_root);
	@override late final _TranslationsRelationshipsModifiersEn modifiers = _TranslationsRelationshipsModifiersEn._(_root);
	@override late final _TranslationsRelationshipsPossessiveEn possessive = _TranslationsRelationshipsPossessiveEn._(_root);
	@override late final _TranslationsRelationshipsPatternsEn patterns = _TranslationsRelationshipsPatternsEn._(_root);
	@override late final _TranslationsRelationshipsSpecialEn special = _TranslationsRelationshipsSpecialEn._(_root);
	@override late final _TranslationsRelationshipsConstructsEn constructs = _TranslationsRelationshipsConstructsEn._(_root);
}

// Path: relationships.base
class _TranslationsRelationshipsBaseEn implements TranslationsRelationshipsBaseAr {
	_TranslationsRelationshipsBaseEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get father => 'father';
	@override String get mother => 'mother';
	@override String get son => 'son';
	@override String get daughter => 'daughter';
	@override String get grandfather => 'grandfather';
	@override String get grandmother => 'grandmother';
	@override String get brother => 'brother';
	@override String get sister => 'sister';
	@override String get husband => 'husband';
	@override String get wife => 'wife';
	@override String get uncle => 'uncle';
	@override String get aunt => 'aunt';
	@override String get nephew => 'nephew';
	@override String get niece => 'niece';
	@override String get cousin => 'cousin';
	@override String get parent => 'parent';
	@override String get child => 'child';
	@override String get grandparent => 'grandparent';
	@override String get grandchild => 'grandchild';
	@override String get sibling => 'sibling';
	@override String get spouse => 'spouse';
	@override String get stepSon => 'step-son';
	@override String get stepDaughter => 'step-daughter';
	@override String get grandson => 'grandson';
	@override String get granddaughter => 'granddaughter';
	@override String get greatGrandfather => 'great-grandfather';
	@override String get greatGrandmother => 'great-grandmother';
	@override String get greatGrandson => 'great-grandson';
	@override String get greatGranddaughter => 'great-granddaughter';
	@override String get maternalUncle => 'maternal uncle';
	@override String get maternalAunt => 'maternal aunt';
}

// Path: relationships.modifiers
class _TranslationsRelationshipsModifiersEn implements TranslationsRelationshipsModifiersAr {
	_TranslationsRelationshipsModifiersEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get paternal => 'paternal';
	@override String get maternal => 'maternal';
	@override String get full => 'full';
	@override String get half => 'half';
	@override String get paternalHalf => 'paternal half';
	@override String get maternalHalf => 'maternal half';
	@override String get great => 'great';
	@override String get grand => 'grand';
	@override String get first => 'first';
	@override String get second => 'second';
	@override String get male => 'male';
	@override String get female => 'female';
	@override String get fullFemale => 'full';
}

// Path: relationships.possessive
class _TranslationsRelationshipsPossessiveEn implements TranslationsRelationshipsPossessiveAr {
	_TranslationsRelationshipsPossessiveEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get ofFather => 'of the father';
	@override String get ofMother => 'of the mother';
	@override String get ofBrother => 'of the brother';
	@override String get ofSister => 'of the sister';
	@override String get ofSon => 'of the son';
	@override String get ofDaughter => 'of the daughter';
	@override String get ofFullBrother => 'of the full brother';
	@override String get ofFullSister => 'of the full sister';
	@override String get ofPaternalBrother => 'of the paternal brother';
	@override String get ofPaternalSister => 'of the paternal sister';
	@override String get ofMaternalBrother => 'of the maternal brother';
	@override String get ofMaternalSister => 'of the maternal sister';
}

// Path: relationships.patterns
class _TranslationsRelationshipsPatternsEn implements TranslationsRelationshipsPatternsAr {
	_TranslationsRelationshipsPatternsEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get paternalGrandparent => 'paternal grandfather';
	@override String get paternalGrandmother => 'paternal grandmother';
	@override String get maternalGrandparent => 'maternal grandfather';
	@override String get maternalGrandmother => 'maternal grandmother';
	@override String paternalLineage({required Object type, required Object relative}) => '${type} (father\'s ${relative})';
	@override String maternalLineage({required Object type, required Object relative}) => '${type} (mother\'s ${relative})';
	@override String pathDescription({required Object path}) => '(${path})';
	@override String siblingOfParent({required Object uncle, required Object parent}) => '${uncle} of ${parent}';
	@override String childOfSibling({required Object child, required Object sibling}) => '${child} of ${sibling}';
	@override String get throughBrother => 'through brother';
	@override String get throughSister => 'through sister';
	@override String get throughFullBrother => 'through full brother';
	@override String get throughFullSister => 'through full sister';
}

// Path: relationships.special
class _TranslationsRelationshipsSpecialEn implements TranslationsRelationshipsSpecialAr {
	_TranslationsRelationshipsSpecialEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get self => 'self';
	@override String get manumitter => 'manumitter (person who freed from slavery)';
	@override String get treasury => 'treasury (Bayt al-Mal)';
	@override String get distantRelative => 'distant relative';
	@override String get extendedFamily => 'extended family member';
	@override String get relatedPerson => 'related person';
}

// Path: relationships.constructs
class _TranslationsRelationshipsConstructsEn implements TranslationsRelationshipsConstructsAr {
	_TranslationsRelationshipsConstructsEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get fathersFather => 'father\'s father';
	@override String get fathersMother => 'father\'s mother';
	@override String get mothersFather => 'mother\'s father';
	@override String get mothersMother => 'mother\'s mother';
	@override String get sonOfBrother => 'brother\'s son';
	@override String get daughterOfBrother => 'brother\'s daughter';
	@override String get sonOfSister => 'sister\'s son';
	@override String get daughterOfSister => 'sister\'s daughter';
	@override String get sonOfSon => 'son\'s son';
	@override String get daughterOfSon => 'son\'s daughter';
	@override String get sonOfDaughter => 'daughter\'s son';
	@override String get daughterOfDaughter => 'daughter\'s daughter';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsEn {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'types.person' => 'Person',
			'types.femaleAscendant' => 'Female Ascendant',
			'types.maleAscendant' => 'Male Ascendant',
			'types.paternalUncle' => 'Paternal Uncle',
			'types.paternalPaternalHalfUncle' => 'Paternal Uncle (Father\'s Side)',
			'types.paternalMaternalHalfUncle' => 'Paternal Uncle (Mother\'s Side)',
			'types.maternalUncle' => 'Maternal Uncle',
			'types.maternalPaternalHalfUncle' => 'Maternal Uncle (Father\'s Side)',
			'types.maternalMaternalHalfUncle' => 'Maternal Uncle (Mother\'s Side)',
			'types.paternalAunt' => 'Paternal Aunt',
			'types.paternalPaternalHalfAunt' => 'Paternal Aunt (Father\'s Side)',
			'types.paternalMaternalHalfAunt' => 'Paternal Aunt (Mother\'s Side)',
			'types.maternalAunt' => 'Maternal Aunt',
			'types.maternalPaternalHalfAunt' => 'Maternal Aunt (Father\'s Side)',
			'types.maternalMaternalHalfAunt' => 'Maternal Aunt (Mother\'s Side)',
			'types.paternalMaleCousin' => 'Paternal Male Cousin',
			'types.paternalPaternalHalfMaleCousin' => 'Paternal Male Cousin (Father\'s Side)',
			'types.paternalMaternalHalfMaleCousin' => 'Paternal Male Cousin (Mother\'s Side)',
			'types.paternalFemaleCousin' => 'Paternal Female Cousin',
			'types.paternalPaternalHalfFemaleCousin' => 'Paternal Female Cousin (Father\'s Side)',
			'types.paternalMaternalHalfFemaleCousin' => 'Paternal Female Cousin (Mother\'s Side)',
			'types.maternalMaleCousin' => 'Maternal Male Cousin',
			'types.maternalPaternalHalfMaleCousin' => 'Maternal Male Cousin (Father\'s Side)',
			'types.maternalMaternalHalfMaleCousin' => 'Maternal Male Cousin (Mother\'s Side)',
			'types.maternalFemaleCousin' => 'Maternal Female Cousin',
			'types.maternalPaternalHalfFemaleCousin' => 'Maternal Female Cousin (Father\'s Side)',
			'types.maternalMaternalHalfFemaleCousin' => 'Maternal Female Cousin (Mother\'s Side)',
			'types.husband' => 'Husband',
			'types.wife' => 'Wife',
			'types.fullBrother' => 'Brother',
			'types.fraternalNephew' => 'Nephew (Brother\'s Son)',
			'types.fraternalNiece' => 'Niece (Brother\'s Daughter)',
			'types.paternalHalfBrother' => 'Paternal Half-Brother',
			'types.maternalHalfBrother' => 'Maternal Half-Brother',
			'types.maternalFraternalHalfNephew' => 'Nephew (Maternal Half-Brother\'s Son)',
			'types.maternalFraternalHalfNiece' => 'Niece (Maternal Half-Brother\'s Daughter)',
			'types.paternalFraternalHalfNephew' => 'Nephew (Paternal Half-Brother\'s Son)',
			'types.paternalFraternalHalfNiece' => 'Niece (Paternal Half-Brother\'s Daughter)',
			'types.fullSister' => 'Sister',
			'types.maternalHalfSister' => 'Maternal Half-Sister',
			'types.paternalHalfSister' => 'Paternal Half-Sister',
			'types.sororalNephew' => 'Nephew (Sister\'s Son)',
			'types.sororalNiece' => 'Niece (Sister\'s Daughter)',
			'types.maternalSororalHalfNephew' => 'Nephew (Maternal Half-Sister\'s Son)',
			'types.maternalSororalHalfNiece' => 'Niece (Maternal Half-Sister\'s Daughter)',
			'types.paternalSororalHalfNephew' => 'Nephew (Paternal Half-Sister\'s Son)',
			'types.paternalSororalHalfNiece' => 'Niece (Paternal Half-Sister\'s Daughter)',
			'types.maleDescendant' => 'Male Descendant',
			'types.femaleDescendant' => 'Female Descendant',
			'types.manumitter' => 'Manumitter',
			'types.treasury' => 'Treasury',
			'relationships.base.father' => 'father',
			'relationships.base.mother' => 'mother',
			'relationships.base.son' => 'son',
			'relationships.base.daughter' => 'daughter',
			'relationships.base.grandfather' => 'grandfather',
			'relationships.base.grandmother' => 'grandmother',
			'relationships.base.brother' => 'brother',
			'relationships.base.sister' => 'sister',
			'relationships.base.husband' => 'husband',
			'relationships.base.wife' => 'wife',
			'relationships.base.uncle' => 'uncle',
			'relationships.base.aunt' => 'aunt',
			'relationships.base.nephew' => 'nephew',
			'relationships.base.niece' => 'niece',
			'relationships.base.cousin' => 'cousin',
			'relationships.base.parent' => 'parent',
			'relationships.base.child' => 'child',
			'relationships.base.grandparent' => 'grandparent',
			'relationships.base.grandchild' => 'grandchild',
			'relationships.base.sibling' => 'sibling',
			'relationships.base.spouse' => 'spouse',
			'relationships.base.stepSon' => 'step-son',
			'relationships.base.stepDaughter' => 'step-daughter',
			'relationships.base.grandson' => 'grandson',
			'relationships.base.granddaughter' => 'granddaughter',
			'relationships.base.greatGrandfather' => 'great-grandfather',
			'relationships.base.greatGrandmother' => 'great-grandmother',
			'relationships.base.greatGrandson' => 'great-grandson',
			'relationships.base.greatGranddaughter' => 'great-granddaughter',
			'relationships.base.maternalUncle' => 'maternal uncle',
			'relationships.base.maternalAunt' => 'maternal aunt',
			'relationships.modifiers.paternal' => 'paternal',
			'relationships.modifiers.maternal' => 'maternal',
			'relationships.modifiers.full' => 'full',
			'relationships.modifiers.half' => 'half',
			'relationships.modifiers.paternalHalf' => 'paternal half',
			'relationships.modifiers.maternalHalf' => 'maternal half',
			'relationships.modifiers.great' => 'great',
			'relationships.modifiers.grand' => 'grand',
			'relationships.modifiers.first' => 'first',
			'relationships.modifiers.second' => 'second',
			'relationships.modifiers.male' => 'male',
			'relationships.modifiers.female' => 'female',
			'relationships.modifiers.fullFemale' => 'full',
			'relationships.possessive.ofFather' => 'of the father',
			'relationships.possessive.ofMother' => 'of the mother',
			'relationships.possessive.ofBrother' => 'of the brother',
			'relationships.possessive.ofSister' => 'of the sister',
			'relationships.possessive.ofSon' => 'of the son',
			'relationships.possessive.ofDaughter' => 'of the daughter',
			'relationships.possessive.ofFullBrother' => 'of the full brother',
			'relationships.possessive.ofFullSister' => 'of the full sister',
			'relationships.possessive.ofPaternalBrother' => 'of the paternal brother',
			'relationships.possessive.ofPaternalSister' => 'of the paternal sister',
			'relationships.possessive.ofMaternalBrother' => 'of the maternal brother',
			'relationships.possessive.ofMaternalSister' => 'of the maternal sister',
			'relationships.patterns.paternalGrandparent' => 'paternal grandfather',
			'relationships.patterns.paternalGrandmother' => 'paternal grandmother',
			'relationships.patterns.maternalGrandparent' => 'maternal grandfather',
			'relationships.patterns.maternalGrandmother' => 'maternal grandmother',
			'relationships.patterns.paternalLineage' => ({required Object type, required Object relative}) => '${type} (father\'s ${relative})',
			'relationships.patterns.maternalLineage' => ({required Object type, required Object relative}) => '${type} (mother\'s ${relative})',
			'relationships.patterns.pathDescription' => ({required Object path}) => '(${path})',
			'relationships.patterns.siblingOfParent' => ({required Object uncle, required Object parent}) => '${uncle} of ${parent}',
			'relationships.patterns.childOfSibling' => ({required Object child, required Object sibling}) => '${child} of ${sibling}',
			'relationships.patterns.throughBrother' => 'through brother',
			'relationships.patterns.throughSister' => 'through sister',
			'relationships.patterns.throughFullBrother' => 'through full brother',
			'relationships.patterns.throughFullSister' => 'through full sister',
			'relationships.special.self' => 'self',
			'relationships.special.manumitter' => 'manumitter (person who freed from slavery)',
			'relationships.special.treasury' => 'treasury (Bayt al-Mal)',
			'relationships.special.distantRelative' => 'distant relative',
			'relationships.special.extendedFamily' => 'extended family member',
			'relationships.special.relatedPerson' => 'related person',
			'relationships.constructs.fathersFather' => 'father\'s father',
			'relationships.constructs.fathersMother' => 'father\'s mother',
			'relationships.constructs.mothersFather' => 'mother\'s father',
			'relationships.constructs.mothersMother' => 'mother\'s mother',
			'relationships.constructs.sonOfBrother' => 'brother\'s son',
			'relationships.constructs.daughterOfBrother' => 'brother\'s daughter',
			'relationships.constructs.sonOfSister' => 'sister\'s son',
			'relationships.constructs.daughterOfSister' => 'sister\'s daughter',
			'relationships.constructs.sonOfSon' => 'son\'s son',
			'relationships.constructs.daughterOfSon' => 'son\'s daughter',
			'relationships.constructs.sonOfDaughter' => 'daughter\'s son',
			'relationships.constructs.daughterOfDaughter' => 'daughter\'s daughter',
			_ => null,
		};
	}
}

///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsAr = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ar,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ar>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	late final TranslationsTypesAr types = TranslationsTypesAr._(_root);
	late final TranslationsRelationshipsAr relationships = TranslationsRelationshipsAr._(_root);
}

// Path: types
class TranslationsTypesAr {
	TranslationsTypesAr._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ar: 'شخص'
	String get person => 'شخص';

	/// ar: 'أصل أنثى'
	String get femaleAscendant => 'أصل أنثى';

	/// ar: 'أصل ذكر'
	String get maleAscendant => 'أصل ذكر';

	/// ar: 'عم'
	String get paternalUncle => 'عم';

	/// ar: 'عم لأب'
	String get paternalPaternalHalfUncle => 'عم لأب';

	/// ar: 'عم لأم'
	String get paternalMaternalHalfUncle => 'عم لأم';

	/// ar: 'خال'
	String get maternalUncle => 'خال';

	/// ar: 'خال لأب'
	String get maternalPaternalHalfUncle => 'خال لأب';

	/// ar: 'خال لأم'
	String get maternalMaternalHalfUncle => 'خال لأم';

	/// ar: 'عمة'
	String get paternalAunt => 'عمة';

	/// ar: 'عمة لأب'
	String get paternalPaternalHalfAunt => 'عمة لأب';

	/// ar: 'عمة لأم'
	String get paternalMaternalHalfAunt => 'عمة لأم';

	/// ar: 'خالة'
	String get maternalAunt => 'خالة';

	/// ar: 'خالة لأب'
	String get maternalPaternalHalfAunt => 'خالة لأب';

	/// ar: 'خالة لأم'
	String get maternalMaternalHalfAunt => 'خالة لأم';

	/// ar: 'ابن عم'
	String get paternalMaleCousin => 'ابن عم';

	/// ar: 'ابن عم لأب'
	String get paternalPaternalHalfMaleCousin => 'ابن عم لأب';

	/// ar: 'ابن عم لأم'
	String get paternalMaternalHalfMaleCousin => 'ابن عم لأم';

	/// ar: 'بنت عم'
	String get paternalFemaleCousin => 'بنت عم';

	/// ar: 'بنت عم لأب'
	String get paternalPaternalHalfFemaleCousin => 'بنت عم لأب';

	/// ar: 'بنت عم لأم'
	String get paternalMaternalHalfFemaleCousin => 'بنت عم لأم';

	/// ar: 'ابن خال'
	String get maternalMaleCousin => 'ابن خال';

	/// ar: 'ابن خال لأب'
	String get maternalPaternalHalfMaleCousin => 'ابن خال لأب';

	/// ar: 'ابن خال لأم'
	String get maternalMaternalHalfMaleCousin => 'ابن خال لأم';

	/// ar: 'بنت خال'
	String get maternalFemaleCousin => 'بنت خال';

	/// ar: 'بنت خال لأب'
	String get maternalPaternalHalfFemaleCousin => 'بنت خال لأب';

	/// ar: 'بنت خال لأم'
	String get maternalMaternalHalfFemaleCousin => 'بنت خال لأم';

	/// ar: 'زوج'
	String get husband => 'زوج';

	/// ar: 'زوجة'
	String get wife => 'زوجة';

	/// ar: 'أخ شقيق'
	String get fullBrother => 'أخ شقيق';

	/// ar: 'ابن أخ'
	String get fraternalNephew => 'ابن أخ';

	/// ar: 'بنت أخ'
	String get fraternalNiece => 'بنت أخ';

	/// ar: 'أخ لأب'
	String get paternalHalfBrother => 'أخ لأب';

	/// ar: 'أخ لأم'
	String get maternalHalfBrother => 'أخ لأم';

	/// ar: 'ابن أخ لأم'
	String get maternalFraternalHalfNephew => 'ابن أخ لأم';

	/// ar: 'بنت أخ لأم'
	String get maternalFraternalHalfNiece => 'بنت أخ لأم';

	/// ar: 'ابن أخ لأب'
	String get paternalFraternalHalfNephew => 'ابن أخ لأب';

	/// ar: 'بنت أخ لأب'
	String get paternalFraternalHalfNiece => 'بنت أخ لأب';

	/// ar: 'أخت شقيقة'
	String get fullSister => 'أخت شقيقة';

	/// ar: 'أخت لأم'
	String get maternalHalfSister => 'أخت لأم';

	/// ar: 'أخت لأب'
	String get paternalHalfSister => 'أخت لأب';

	/// ar: 'ابن أخت'
	String get sororalNephew => 'ابن أخت';

	/// ar: 'بنت أخت'
	String get sororalNiece => 'بنت أخت';

	/// ar: 'ابن أخت لأم'
	String get maternalSororalHalfNephew => 'ابن أخت لأم';

	/// ar: 'بنت أخت لأم'
	String get maternalSororalHalfNiece => 'بنت أخت لأم';

	/// ar: 'ابن أخت لأب'
	String get paternalSororalHalfNephew => 'ابن أخت لأب';

	/// ar: 'بنت أخت لأب'
	String get paternalSororalHalfNiece => 'بنت أخت لأب';

	/// ar: 'فرع ذكر'
	String get maleDescendant => 'فرع ذكر';

	/// ar: 'فرع أنثى'
	String get femaleDescendant => 'فرع أنثى';

	/// ar: 'معتِق'
	String get manumitter => 'معتِق';

	/// ar: 'بيت المال'
	String get treasury => 'بيت المال';
}

// Path: relationships
class TranslationsRelationshipsAr {
	TranslationsRelationshipsAr._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsRelationshipsBaseAr base = TranslationsRelationshipsBaseAr._(_root);
	late final TranslationsRelationshipsModifiersAr modifiers = TranslationsRelationshipsModifiersAr._(_root);
	late final TranslationsRelationshipsPossessiveAr possessive = TranslationsRelationshipsPossessiveAr._(_root);
	late final TranslationsRelationshipsPatternsAr patterns = TranslationsRelationshipsPatternsAr._(_root);
	late final TranslationsRelationshipsSpecialAr special = TranslationsRelationshipsSpecialAr._(_root);
	late final TranslationsRelationshipsConstructsAr constructs = TranslationsRelationshipsConstructsAr._(_root);
}

// Path: relationships.base
class TranslationsRelationshipsBaseAr {
	TranslationsRelationshipsBaseAr._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ar: 'أب'
	String get father => 'أب';

	/// ar: 'أم'
	String get mother => 'أم';

	/// ar: 'ابن'
	String get son => 'ابن';

	/// ar: 'بنت'
	String get daughter => 'بنت';

	/// ar: 'جد'
	String get grandfather => 'جد';

	/// ar: 'جدة'
	String get grandmother => 'جدة';

	/// ar: 'أخ'
	String get brother => 'أخ';

	/// ar: 'أخت'
	String get sister => 'أخت';

	/// ar: 'زوج'
	String get husband => 'زوج';

	/// ar: 'زوجة'
	String get wife => 'زوجة';

	/// ar: 'عم'
	String get uncle => 'عم';

	/// ar: 'عمة'
	String get aunt => 'عمة';

	/// ar: 'خال'
	String get maternalUncle => 'خال';

	/// ar: 'خالة'
	String get maternalAunt => 'خالة';

	/// ar: 'ابن أخ'
	String get nephew => 'ابن أخ';

	/// ar: 'بنت أخت'
	String get niece => 'بنت أخت';

	/// ar: 'ابن عم'
	String get cousin => 'ابن عم';

	/// ar: 'والد'
	String get parent => 'والد';

	/// ar: 'ولد'
	String get child => 'ولد';

	/// ar: 'جد'
	String get grandparent => 'جد';

	/// ar: 'حفيد'
	String get grandchild => 'حفيد';

	/// ar: 'أخ'
	String get sibling => 'أخ';

	/// ar: 'زوج'
	String get spouse => 'زوج';

	/// ar: 'ربيب'
	String get stepSon => 'ربيب';

	/// ar: 'ربيبة'
	String get stepDaughter => 'ربيبة';

	/// ar: 'حفيد'
	String get grandson => 'حفيد';

	/// ar: 'حفيدة'
	String get granddaughter => 'حفيدة';

	/// ar: 'جد الجد'
	String get greatGrandfather => 'جد الجد';

	/// ar: 'جدة الجد'
	String get greatGrandmother => 'جدة الجد';

	/// ar: 'ابن الحفيد'
	String get greatGrandson => 'ابن الحفيد';

	/// ar: 'بنت الحفيد'
	String get greatGranddaughter => 'بنت الحفيد';
}

// Path: relationships.modifiers
class TranslationsRelationshipsModifiersAr {
	TranslationsRelationshipsModifiersAr._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ar: 'لأب'
	String get paternal => 'لأب';

	/// ar: 'لأم'
	String get maternal => 'لأم';

	/// ar: 'شقيق'
	String get full => 'شقيق';

	/// ar: 'شقيقة'
	String get fullFemale => 'شقيقة';

	/// ar: 'غير شقيق'
	String get half => 'غير شقيق';

	/// ar: 'لأب'
	String get paternalHalf => 'لأب';

	/// ar: 'لأم'
	String get maternalHalf => 'لأم';

	/// ar: 'أكبر'
	String get great => 'أكبر';

	/// ar: 'كبير'
	String get grand => 'كبير';

	/// ar: 'أول'
	String get first => 'أول';

	/// ar: 'ثاني'
	String get second => 'ثاني';

	/// ar: 'ذكر'
	String get male => 'ذكر';

	/// ar: 'أنثى'
	String get female => 'أنثى';
}

// Path: relationships.possessive
class TranslationsRelationshipsPossessiveAr {
	TranslationsRelationshipsPossessiveAr._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ar: 'الأب'
	String get ofFather => 'الأب';

	/// ar: 'الأم'
	String get ofMother => 'الأم';

	/// ar: 'الأخ'
	String get ofBrother => 'الأخ';

	/// ar: 'الأخت'
	String get ofSister => 'الأخت';

	/// ar: 'الابن'
	String get ofSon => 'الابن';

	/// ar: 'البنت'
	String get ofDaughter => 'البنت';

	/// ar: 'الأخ الشقيق'
	String get ofFullBrother => 'الأخ الشقيق';

	/// ar: 'الأخت الشقيقة'
	String get ofFullSister => 'الأخت الشقيقة';

	/// ar: 'الأخ لأب'
	String get ofPaternalBrother => 'الأخ لأب';

	/// ar: 'الأخت لأب'
	String get ofPaternalSister => 'الأخت لأب';

	/// ar: 'الأخ لأم'
	String get ofMaternalBrother => 'الأخ لأم';

	/// ar: 'الأخت لأم'
	String get ofMaternalSister => 'الأخت لأم';
}

// Path: relationships.patterns
class TranslationsRelationshipsPatternsAr {
	TranslationsRelationshipsPatternsAr._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ar: 'الجد لأب'
	String get paternalGrandparent => 'الجد لأب';

	/// ar: 'الجدة لأب'
	String get paternalGrandmother => 'الجدة لأب';

	/// ar: 'الجد لأم'
	String get maternalGrandparent => 'الجد لأم';

	/// ar: 'الجدة لأم'
	String get maternalGrandmother => 'الجدة لأم';

	/// ar: '${type} (أب ${relative})'
	String paternalLineage({required Object type, required Object relative}) => '${type} (أب ${relative})';

	/// ar: '${type} (أم ${relative})'
	String maternalLineage({required Object type, required Object relative}) => '${type} (أم ${relative})';

	/// ar: '(${path})'
	String pathDescription({required Object path}) => '(${path})';

	/// ar: '${uncle} ${parent}'
	String siblingOfParent({required Object uncle, required Object parent}) => '${uncle} ${parent}';

	/// ar: '${child} ${sibling}'
	String childOfSibling({required Object child, required Object sibling}) => '${child} ${sibling}';

	/// ar: 'ابن الأخ'
	String get throughBrother => 'ابن الأخ';

	/// ar: 'ابن الأخت'
	String get throughSister => 'ابن الأخت';

	/// ar: 'ابن الأخ الشقيق'
	String get throughFullBrother => 'ابن الأخ الشقيق';

	/// ar: 'ابن الأخت الشقيقة'
	String get throughFullSister => 'ابن الأخت الشقيقة';
}

// Path: relationships.special
class TranslationsRelationshipsSpecialAr {
	TranslationsRelationshipsSpecialAr._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ar: 'النفس'
	String get self => 'النفس';

	/// ar: 'معتِق'
	String get manumitter => 'معتِق';

	/// ar: 'بيت المال'
	String get treasury => 'بيت المال';

	/// ar: 'قريب بعيد'
	String get distantRelative => 'قريب بعيد';

	/// ar: 'فرد من العائلة الممتدة'
	String get extendedFamily => 'فرد من العائلة الممتدة';

	/// ar: 'شخص ذو صلة قرابة'
	String get relatedPerson => 'شخص ذو صلة قرابة';
}

// Path: relationships.constructs
class TranslationsRelationshipsConstructsAr {
	TranslationsRelationshipsConstructsAr._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ar: 'أبو الأب'
	String get fathersFather => 'أبو الأب';

	/// ar: 'أم الأب'
	String get fathersMother => 'أم الأب';

	/// ar: 'أبو الأم'
	String get mothersFather => 'أبو الأم';

	/// ar: 'أم الأم'
	String get mothersMother => 'أم الأم';

	/// ar: 'ابن الأخ'
	String get sonOfBrother => 'ابن الأخ';

	/// ar: 'بنت الأخ'
	String get daughterOfBrother => 'بنت الأخ';

	/// ar: 'ابن الأخت'
	String get sonOfSister => 'ابن الأخت';

	/// ar: 'بنت الأخت'
	String get daughterOfSister => 'بنت الأخت';

	/// ar: 'ابن الابن'
	String get sonOfSon => 'ابن الابن';

	/// ar: 'بنت الابن'
	String get daughterOfSon => 'بنت الابن';

	/// ar: 'ابن البنت'
	String get sonOfDaughter => 'ابن البنت';

	/// ar: 'بنت البنت'
	String get daughterOfDaughter => 'بنت البنت';
}

/// The flat map containing all translations for locale <ar>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'types.person' => 'شخص',
			'types.femaleAscendant' => 'أصل أنثى',
			'types.maleAscendant' => 'أصل ذكر',
			'types.paternalUncle' => 'عم',
			'types.paternalPaternalHalfUncle' => 'عم لأب',
			'types.paternalMaternalHalfUncle' => 'عم لأم',
			'types.maternalUncle' => 'خال',
			'types.maternalPaternalHalfUncle' => 'خال لأب',
			'types.maternalMaternalHalfUncle' => 'خال لأم',
			'types.paternalAunt' => 'عمة',
			'types.paternalPaternalHalfAunt' => 'عمة لأب',
			'types.paternalMaternalHalfAunt' => 'عمة لأم',
			'types.maternalAunt' => 'خالة',
			'types.maternalPaternalHalfAunt' => 'خالة لأب',
			'types.maternalMaternalHalfAunt' => 'خالة لأم',
			'types.paternalMaleCousin' => 'ابن عم',
			'types.paternalPaternalHalfMaleCousin' => 'ابن عم لأب',
			'types.paternalMaternalHalfMaleCousin' => 'ابن عم لأم',
			'types.paternalFemaleCousin' => 'بنت عم',
			'types.paternalPaternalHalfFemaleCousin' => 'بنت عم لأب',
			'types.paternalMaternalHalfFemaleCousin' => 'بنت عم لأم',
			'types.maternalMaleCousin' => 'ابن خال',
			'types.maternalPaternalHalfMaleCousin' => 'ابن خال لأب',
			'types.maternalMaternalHalfMaleCousin' => 'ابن خال لأم',
			'types.maternalFemaleCousin' => 'بنت خال',
			'types.maternalPaternalHalfFemaleCousin' => 'بنت خال لأب',
			'types.maternalMaternalHalfFemaleCousin' => 'بنت خال لأم',
			'types.husband' => 'زوج',
			'types.wife' => 'زوجة',
			'types.fullBrother' => 'أخ شقيق',
			'types.fraternalNephew' => 'ابن أخ',
			'types.fraternalNiece' => 'بنت أخ',
			'types.paternalHalfBrother' => 'أخ لأب',
			'types.maternalHalfBrother' => 'أخ لأم',
			'types.maternalFraternalHalfNephew' => 'ابن أخ لأم',
			'types.maternalFraternalHalfNiece' => 'بنت أخ لأم',
			'types.paternalFraternalHalfNephew' => 'ابن أخ لأب',
			'types.paternalFraternalHalfNiece' => 'بنت أخ لأب',
			'types.fullSister' => 'أخت شقيقة',
			'types.maternalHalfSister' => 'أخت لأم',
			'types.paternalHalfSister' => 'أخت لأب',
			'types.sororalNephew' => 'ابن أخت',
			'types.sororalNiece' => 'بنت أخت',
			'types.maternalSororalHalfNephew' => 'ابن أخت لأم',
			'types.maternalSororalHalfNiece' => 'بنت أخت لأم',
			'types.paternalSororalHalfNephew' => 'ابن أخت لأب',
			'types.paternalSororalHalfNiece' => 'بنت أخت لأب',
			'types.maleDescendant' => 'فرع ذكر',
			'types.femaleDescendant' => 'فرع أنثى',
			'types.manumitter' => 'معتِق',
			'types.treasury' => 'بيت المال',
			'relationships.base.father' => 'أب',
			'relationships.base.mother' => 'أم',
			'relationships.base.son' => 'ابن',
			'relationships.base.daughter' => 'بنت',
			'relationships.base.grandfather' => 'جد',
			'relationships.base.grandmother' => 'جدة',
			'relationships.base.brother' => 'أخ',
			'relationships.base.sister' => 'أخت',
			'relationships.base.husband' => 'زوج',
			'relationships.base.wife' => 'زوجة',
			'relationships.base.uncle' => 'عم',
			'relationships.base.aunt' => 'عمة',
			'relationships.base.maternalUncle' => 'خال',
			'relationships.base.maternalAunt' => 'خالة',
			'relationships.base.nephew' => 'ابن أخ',
			'relationships.base.niece' => 'بنت أخت',
			'relationships.base.cousin' => 'ابن عم',
			'relationships.base.parent' => 'والد',
			'relationships.base.child' => 'ولد',
			'relationships.base.grandparent' => 'جد',
			'relationships.base.grandchild' => 'حفيد',
			'relationships.base.sibling' => 'أخ',
			'relationships.base.spouse' => 'زوج',
			'relationships.base.stepSon' => 'ربيب',
			'relationships.base.stepDaughter' => 'ربيبة',
			'relationships.base.grandson' => 'حفيد',
			'relationships.base.granddaughter' => 'حفيدة',
			'relationships.base.greatGrandfather' => 'جد الجد',
			'relationships.base.greatGrandmother' => 'جدة الجد',
			'relationships.base.greatGrandson' => 'ابن الحفيد',
			'relationships.base.greatGranddaughter' => 'بنت الحفيد',
			'relationships.modifiers.paternal' => 'لأب',
			'relationships.modifiers.maternal' => 'لأم',
			'relationships.modifiers.full' => 'شقيق',
			'relationships.modifiers.fullFemale' => 'شقيقة',
			'relationships.modifiers.half' => 'غير شقيق',
			'relationships.modifiers.paternalHalf' => 'لأب',
			'relationships.modifiers.maternalHalf' => 'لأم',
			'relationships.modifiers.great' => 'أكبر',
			'relationships.modifiers.grand' => 'كبير',
			'relationships.modifiers.first' => 'أول',
			'relationships.modifiers.second' => 'ثاني',
			'relationships.modifiers.male' => 'ذكر',
			'relationships.modifiers.female' => 'أنثى',
			'relationships.possessive.ofFather' => 'الأب',
			'relationships.possessive.ofMother' => 'الأم',
			'relationships.possessive.ofBrother' => 'الأخ',
			'relationships.possessive.ofSister' => 'الأخت',
			'relationships.possessive.ofSon' => 'الابن',
			'relationships.possessive.ofDaughter' => 'البنت',
			'relationships.possessive.ofFullBrother' => 'الأخ الشقيق',
			'relationships.possessive.ofFullSister' => 'الأخت الشقيقة',
			'relationships.possessive.ofPaternalBrother' => 'الأخ لأب',
			'relationships.possessive.ofPaternalSister' => 'الأخت لأب',
			'relationships.possessive.ofMaternalBrother' => 'الأخ لأم',
			'relationships.possessive.ofMaternalSister' => 'الأخت لأم',
			'relationships.patterns.paternalGrandparent' => 'الجد لأب',
			'relationships.patterns.paternalGrandmother' => 'الجدة لأب',
			'relationships.patterns.maternalGrandparent' => 'الجد لأم',
			'relationships.patterns.maternalGrandmother' => 'الجدة لأم',
			'relationships.patterns.paternalLineage' => ({required Object type, required Object relative}) => '${type} (أب ${relative})',
			'relationships.patterns.maternalLineage' => ({required Object type, required Object relative}) => '${type} (أم ${relative})',
			'relationships.patterns.pathDescription' => ({required Object path}) => '(${path})',
			'relationships.patterns.siblingOfParent' => ({required Object uncle, required Object parent}) => '${uncle} ${parent}',
			'relationships.patterns.childOfSibling' => ({required Object child, required Object sibling}) => '${child} ${sibling}',
			'relationships.patterns.throughBrother' => 'ابن الأخ',
			'relationships.patterns.throughSister' => 'ابن الأخت',
			'relationships.patterns.throughFullBrother' => 'ابن الأخ الشقيق',
			'relationships.patterns.throughFullSister' => 'ابن الأخت الشقيقة',
			'relationships.special.self' => 'النفس',
			'relationships.special.manumitter' => 'معتِق',
			'relationships.special.treasury' => 'بيت المال',
			'relationships.special.distantRelative' => 'قريب بعيد',
			'relationships.special.extendedFamily' => 'فرد من العائلة الممتدة',
			'relationships.special.relatedPerson' => 'شخص ذو صلة قرابة',
			'relationships.constructs.fathersFather' => 'أبو الأب',
			'relationships.constructs.fathersMother' => 'أم الأب',
			'relationships.constructs.mothersFather' => 'أبو الأم',
			'relationships.constructs.mothersMother' => 'أم الأم',
			'relationships.constructs.sonOfBrother' => 'ابن الأخ',
			'relationships.constructs.daughterOfBrother' => 'بنت الأخ',
			'relationships.constructs.sonOfSister' => 'ابن الأخت',
			'relationships.constructs.daughterOfSister' => 'بنت الأخت',
			'relationships.constructs.sonOfSon' => 'ابن الابن',
			'relationships.constructs.daughterOfSon' => 'بنت الابن',
			'relationships.constructs.sonOfDaughter' => 'ابن البنت',
			'relationships.constructs.daughterOfDaughter' => 'بنت البنت',
			_ => null,
		};
	}
}

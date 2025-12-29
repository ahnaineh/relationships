import '../../../i18n/strings.g.dart';
import '../../core/person.dart';
import '../core/lineage.dart';
import '../core/sibling_type.dart';

class DetailedDescriptionBuilder {
  static String buildDirectRelationship({
    required Gender gender,
    required String relationType,
  }) {
    final translations = t.relationships.base;

    switch (relationType) {
      case 'father':
        return translations.father;
      case 'mother':
        return translations.mother;
      case 'son':
        return translations.son;
      case 'daughter':
        return translations.daughter;
      case 'husband':
        return translations.husband;
      case 'wife':
        return translations.wife;
      case 'parent':
        return gender == Gender.male ? translations.father : translations.mother;
      case 'child':
        return gender == Gender.male ? translations.son : translations.daughter;
      case 'spouse':
        return gender == Gender.male ? translations.husband : translations.wife;
      default:
        return relationType;
    }
  }

  static String buildAscendantDescription({
    required int generationGap,
    required Gender gender,
    required Lineage lineage,
    String? pathDescription,
  }) {
    final translations = t.relationships;
    String base;

    final isArabic = LocaleSettings.currentLocale == AppLocale.ar;

    switch (generationGap.abs()) {
      case 1:
        base = gender == Gender.male ? translations.base.father : translations.base.mother;
        break;
      case 2:
        if (isArabic) {
          base = gender == Gender.male ? translations.base.grandfather : translations.base.grandmother;
          if (lineage == Lineage.paternal) {
            base = gender == Gender.male ? translations.patterns.paternalGrandparent : translations.patterns.paternalGrandmother;
          } else if (lineage == Lineage.maternal) {
            base = gender == Gender.male ? translations.patterns.maternalGrandparent : translations.patterns.maternalGrandmother;
          }
        } else {
          base = gender == Gender.male ? translations.base.grandfather : translations.base.grandmother;
          if (lineage == Lineage.paternal) {
            base = '${translations.modifiers.paternal} $base';
          } else if (lineage == Lineage.maternal) {
            base = '${translations.modifiers.maternal} $base';
          }
        }
        break;
      case 3:
        if (isArabic) {
          base = gender == Gender.male ? translations.base.greatGrandfather : translations.base.greatGrandmother;
        } else {
          final greatPrefix = translations.modifiers.great;
          base = gender == Gender.male
            ? '$greatPrefix-${translations.base.grandfather}'
            : '$greatPrefix-${translations.base.grandmother}';
          if (lineage == Lineage.paternal) {
            base = '${translations.modifiers.paternal} $base';
          } else if (lineage == Lineage.maternal) {
            base = '${translations.modifiers.maternal} $base';
          }
        }
        break;
      default:
        if (isArabic) {
          final greatsCount = generationGap.abs() - 2;
          base = gender == Gender.male
            ? 'الجد الأكبر $greatsCount'
            : 'الجدة الكبرى $greatsCount';
        } else {
          final greats = '${translations.modifiers.great}-' * (generationGap.abs() - 2);
          base = gender == Gender.male
            ? '$greats${translations.base.grandfather}'
            : '$greats${translations.base.grandmother}';
          if (lineage == Lineage.paternal) {
            base = '${translations.modifiers.paternal} $base';
          } else if (lineage == Lineage.maternal) {
            base = '${translations.modifiers.maternal} $base';
          }
        }
    }

    if (pathDescription != null && pathDescription.isNotEmpty) {
      if (isArabic) {
        base = '$base (${pathDescription})';
      } else {
        base = '$base ($pathDescription)';
      }
    }

    return base;
  }

  static String buildDescendantDescription({
    required int generationGap,
    required Gender gender,
  }) {
    final translations = t.relationships;
    final isArabic = LocaleSettings.currentLocale == AppLocale.ar;

    switch (generationGap) {
      case 1:
        return gender == Gender.male ? translations.base.son : translations.base.daughter;
      case 2:
        if (isArabic) {
          return gender == Gender.male ? translations.base.grandson : translations.base.granddaughter;
        } else {
          return gender == Gender.male ? 'grandson' : 'granddaughter';
        }
      case 3:
        if (isArabic) {
          return gender == Gender.male ? translations.base.greatGrandson : translations.base.greatGranddaughter;
        } else {
          return gender == Gender.male ? 'great-grandson' : 'great-granddaughter';
        }
      default:
        if (isArabic) {
          final greatsCount = generationGap - 2;
          return gender == Gender.male
            ? 'حفيد الحفيد $greatsCount'
            : 'حفيدة الحفيد $greatsCount';
        } else {
          final greats = '${translations.modifiers.great}-' * (generationGap - 2);
          return gender == Gender.male ? '${greats}grandson' : '${greats}granddaughter';
        }
    }
  }

  static String buildSiblingDescription({
    required Gender gender,
    required SiblingType siblingType,
  }) {
    final translations = t.relationships;
    final isArabic = LocaleSettings.currentLocale == AppLocale.ar;

    String base = gender == Gender.male ? translations.base.brother : translations.base.sister;

    switch (siblingType) {
      case SiblingType.full:
        if (isArabic) {
          return gender == Gender.male
            ? 'أخ شقيق'
            : 'أخت شقيقة';
        } else {
          return base;
        }
      case SiblingType.paternalHalf:
        if (isArabic) {
          return gender == Gender.male
            ? 'أخ ${translations.modifiers.paternal}'
            : 'أخت ${translations.modifiers.paternal}';
        } else {
          return '${translations.modifiers.paternalHalf}-$base';
        }
      case SiblingType.maternalHalf:
        if (isArabic) {
          return gender == Gender.male
            ? 'أخ ${translations.modifiers.maternal}'
            : 'أخت ${translations.modifiers.maternal}';
        } else {
          return '${translations.modifiers.maternalHalf}-$base';
        }
      case SiblingType.none:
        return base;
    }
  }

  static String buildNieceNephewDescription({
    required Gender gender,
    required SiblingType siblingType,
    required bool isBrothersSide,
  }) {
    final translations = t.relationships;
    final isArabic = LocaleSettings.currentLocale == AppLocale.ar;

    if (isArabic) {
      String siblingPart;
      switch (siblingType) {
        case SiblingType.full:
          siblingPart = isBrothersSide
            ? translations.constructs.sonOfBrother.replaceAll('ابن الأخ', translations.possessive.ofFullBrother)
            : translations.constructs.sonOfSister.replaceAll('ابن الأخت', translations.possessive.ofFullSister);
          break;
        case SiblingType.paternalHalf:
          siblingPart = isBrothersSide
            ? translations.possessive.ofPaternalBrother
            : translations.possessive.ofPaternalSister;
          break;
        case SiblingType.maternalHalf:
          siblingPart = isBrothersSide
            ? translations.possessive.ofMaternalBrother
            : translations.possessive.ofMaternalSister;
          break;
        case SiblingType.none:
          siblingPart = isBrothersSide
            ? translations.possessive.ofBrother
            : translations.possessive.ofSister;
          break;
      }

      return gender == Gender.male
        ? 'ابن $siblingPart'
        : 'بنت $siblingPart';
    } else {
      final baseRole = gender == Gender.male ? 'nephew' : 'niece';
      String siblingDesc;

      switch (siblingType) {
        case SiblingType.full:
          siblingDesc = isBrothersSide ? "brother's" : "sister's";
          break;
        case SiblingType.paternalHalf:
          siblingDesc = isBrothersSide
            ? "paternal half-brother's"
            : "paternal half-sister's";
          break;
        case SiblingType.maternalHalf:
          siblingDesc = isBrothersSide
            ? "maternal half-brother's"
            : "maternal half-sister's";
          break;
        case SiblingType.none:
          siblingDesc = '';
          break;
      }

      final childPart = gender == Gender.male ? 'son' : 'daughter';
      return siblingDesc.isEmpty
        ? baseRole
        : '$baseRole ($siblingDesc $childPart)';
    }
  }

  static String buildAuntUncleDescription({
    required Gender gender,
    required bool isPaternal,
    required SiblingType siblingType,
  }) {
    final translations = t.relationships;
    final isArabic = LocaleSettings.currentLocale == AppLocale.ar;

    if (isArabic) {
      String base;
      if (isPaternal) {
        base = gender == Gender.male ? translations.base.uncle : translations.base.aunt;
      } else {
        base = gender == Gender.male ? translations.base.maternalUncle : translations.base.maternalAunt;
      }

      switch (siblingType) {
        case SiblingType.paternalHalf:
          return '$base ${translations.modifiers.paternal}';
        case SiblingType.maternalHalf:
          return '$base ${translations.modifiers.maternal}';
        case SiblingType.full:
        case SiblingType.none:
          return base;
      }
    } else {
      final lineage = isPaternal ? translations.modifiers.paternal : translations.modifiers.maternal;
      final baseRole = gender == Gender.male ? 'uncle' : 'aunt';

      String siblingDesc = '';
      switch (siblingType) {
        case SiblingType.full:
          siblingDesc = isPaternal ? " (father's sibling)" : " (mother's sibling)";
          break;
        case SiblingType.paternalHalf:
          siblingDesc = isPaternal
            ? " (father's paternal half-sibling)"
            : " (mother's paternal half-sibling)";
          break;
        case SiblingType.maternalHalf:
          siblingDesc = isPaternal
            ? " (father's maternal half-sibling)"
            : " (mother's maternal half-sibling)";
          break;
        case SiblingType.none:
          break;
      }

      return '$lineage $baseRole$siblingDesc';
    }
  }

  static String buildCousinDescription({
    required Gender gender,
    required bool isPaternal,
    required SiblingType siblingType,
  }) {
    final translations = t.relationships;
    final isArabic = LocaleSettings.currentLocale == AppLocale.ar;

    if (isArabic) {
      String base;
      if (isPaternal) {
        base = gender == Gender.male ? 'ابن عم' : 'بنت عم';
      } else {
        base = gender == Gender.male ? 'ابن خال' : 'بنت خال';
      }

      switch (siblingType) {
        case SiblingType.paternalHalf:
          return '$base ${translations.modifiers.paternal}';
        case SiblingType.maternalHalf:
          return '$base ${translations.modifiers.maternal}';
        case SiblingType.full:
        case SiblingType.none:
          return base;
      }
    } else {
      final lineage = isPaternal ? translations.modifiers.paternal : translations.modifiers.maternal;
      final genderStr = gender == Gender.male ? translations.modifiers.male : translations.modifiers.female;

      String siblingDesc = '';
      switch (siblingType) {
        case SiblingType.full:
          siblingDesc = isPaternal
            ? " (father's sibling's child)"
            : " (mother's sibling's child)";
          break;
        case SiblingType.paternalHalf:
          siblingDesc = isPaternal
            ? " (father's paternal half-sibling's child)"
            : " (mother's paternal half-sibling's child)";
          break;
        case SiblingType.maternalHalf:
          siblingDesc = isPaternal
            ? " (father's maternal half-sibling's child)"
            : " (mother's maternal half-sibling's child)";
          break;
        case SiblingType.none:
          break;
      }

      return '$lineage $genderStr cousin$siblingDesc';
    }
  }

  static String buildSpecialRelationship(String type) {
    final special = t.relationships.special;

    switch (type) {
      case 'self':
        return special.self;
      case 'manumitter':
        return special.manumitter;
      case 'treasury':
        return special.treasury;
      case 'distantRelative':
        return special.distantRelative;
      case 'extendedFamily':
        return special.extendedFamily;
      case 'relatedPerson':
        return special.relatedPerson;
      default:
        return type;
    }
  }

  static String buildStepChildDescription(Gender gender) {
    final translations = t.relationships.base;
    return gender == Gender.male ? translations.stepSon : translations.stepDaughter;
  }
}

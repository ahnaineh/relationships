import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/person.dart';
import '../types.dart';
import 'lineage.dart';
import 'relationship_path.dart';
import 'relationship_step.dart';

part 'relationship.freezed.dart';

@freezed
sealed class Relationship with _$Relationship {
  const factory Relationship({
    required Person subject,
    required Person relativeTo,
    required Types type,
    required RelationshipPath path,
    required int generationGap, // 0 for siblings/spouses, positive for descendants, negative for ancestors
    required List<Gender> genderPath, // Gender of each person in the path
    required List<RelationshipStep> stepPath, // The relationship steps taken
    required bool isDirect, // true for direct line (parent-child only)
    required bool isBloodRelation, // false for spouses/in-laws/manumitter
    required String detailedDescription, // e.g., "paternal grandfather (father's father)"
    required Lineage lineage, // paternal, maternal, or mixed
    required Map<String, dynamic> metadata, // Additional context
    required String genealogyNotation, // Standard notation like "FF" for father's father
    required int relationshipDegree, // Degree of relationship for legal/inheritance
  }) = _Relationship;

  const Relationship._();

  @override
  String toString() {
    return '''Relationship(
  subject: ${subject.name},
  relativeTo: ${relativeTo.name},
  type: $type,
  path: $path,
  generationGap: $generationGap,
  genderPath: $genderPath,
  stepPath: $stepPath,
  isDirect: $isDirect,
  isBloodRelation: $isBloodRelation,
  detailedDescription: "$detailedDescription",
  lineage: $lineage,
  metadata: $metadata,
  genealogyNotation: "$genealogyNotation",
  relationshipDegree: $relationshipDegree
)''';
  }
}
import '../../core/person.dart';
import 'relationship_step.dart';

class RelationshipPath {
  final List<Person> path;
  final List<RelationshipStep> steps;

  RelationshipPath({required this.path, required this.steps});
}

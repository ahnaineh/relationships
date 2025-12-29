// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'relationship.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Relationship {

 Person get subject; Person get relativeTo; Types get type; RelationshipPath get path; int get generationGap;// 0 for siblings/spouses, positive for descendants, negative for ancestors
 List<Gender> get genderPath;// Gender of each person in the path
 List<RelationshipStep> get stepPath;// The relationship steps taken
 bool get isDirect;// true for direct line (parent-child only)
 bool get isBloodRelation;// false for spouses/in-laws/manumitter
 String get detailedDescription;// e.g., "paternal grandfather (father's father)"
 Lineage get lineage;// paternal, maternal, or mixed
 Map<String, dynamic> get metadata;// Additional context
 String get genealogyNotation;// Standard notation like "FF" for father's father
 int get relationshipDegree;
/// Create a copy of Relationship
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RelationshipCopyWith<Relationship> get copyWith => _$RelationshipCopyWithImpl<Relationship>(this as Relationship, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Relationship&&(identical(other.subject, subject) || other.subject == subject)&&(identical(other.relativeTo, relativeTo) || other.relativeTo == relativeTo)&&(identical(other.type, type) || other.type == type)&&(identical(other.path, path) || other.path == path)&&(identical(other.generationGap, generationGap) || other.generationGap == generationGap)&&const DeepCollectionEquality().equals(other.genderPath, genderPath)&&const DeepCollectionEquality().equals(other.stepPath, stepPath)&&(identical(other.isDirect, isDirect) || other.isDirect == isDirect)&&(identical(other.isBloodRelation, isBloodRelation) || other.isBloodRelation == isBloodRelation)&&(identical(other.detailedDescription, detailedDescription) || other.detailedDescription == detailedDescription)&&(identical(other.lineage, lineage) || other.lineage == lineage)&&const DeepCollectionEquality().equals(other.metadata, metadata)&&(identical(other.genealogyNotation, genealogyNotation) || other.genealogyNotation == genealogyNotation)&&(identical(other.relationshipDegree, relationshipDegree) || other.relationshipDegree == relationshipDegree));
}


@override
int get hashCode => Object.hash(runtimeType,subject,relativeTo,type,path,generationGap,const DeepCollectionEquality().hash(genderPath),const DeepCollectionEquality().hash(stepPath),isDirect,isBloodRelation,detailedDescription,lineage,const DeepCollectionEquality().hash(metadata),genealogyNotation,relationshipDegree);



}

/// @nodoc
abstract mixin class $RelationshipCopyWith<$Res>  {
  factory $RelationshipCopyWith(Relationship value, $Res Function(Relationship) _then) = _$RelationshipCopyWithImpl;
@useResult
$Res call({
 Person subject, Person relativeTo, Types type, RelationshipPath path, int generationGap, List<Gender> genderPath, List<RelationshipStep> stepPath, bool isDirect, bool isBloodRelation, String detailedDescription, Lineage lineage, Map<String, dynamic> metadata, String genealogyNotation, int relationshipDegree
});




}
/// @nodoc
class _$RelationshipCopyWithImpl<$Res>
    implements $RelationshipCopyWith<$Res> {
  _$RelationshipCopyWithImpl(this._self, this._then);

  final Relationship _self;
  final $Res Function(Relationship) _then;

/// Create a copy of Relationship
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? subject = null,Object? relativeTo = null,Object? type = null,Object? path = null,Object? generationGap = null,Object? genderPath = null,Object? stepPath = null,Object? isDirect = null,Object? isBloodRelation = null,Object? detailedDescription = null,Object? lineage = null,Object? metadata = null,Object? genealogyNotation = null,Object? relationshipDegree = null,}) {
  return _then(_self.copyWith(
subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as Person,relativeTo: null == relativeTo ? _self.relativeTo : relativeTo // ignore: cast_nullable_to_non_nullable
as Person,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as Types,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as RelationshipPath,generationGap: null == generationGap ? _self.generationGap : generationGap // ignore: cast_nullable_to_non_nullable
as int,genderPath: null == genderPath ? _self.genderPath : genderPath // ignore: cast_nullable_to_non_nullable
as List<Gender>,stepPath: null == stepPath ? _self.stepPath : stepPath // ignore: cast_nullable_to_non_nullable
as List<RelationshipStep>,isDirect: null == isDirect ? _self.isDirect : isDirect // ignore: cast_nullable_to_non_nullable
as bool,isBloodRelation: null == isBloodRelation ? _self.isBloodRelation : isBloodRelation // ignore: cast_nullable_to_non_nullable
as bool,detailedDescription: null == detailedDescription ? _self.detailedDescription : detailedDescription // ignore: cast_nullable_to_non_nullable
as String,lineage: null == lineage ? _self.lineage : lineage // ignore: cast_nullable_to_non_nullable
as Lineage,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,genealogyNotation: null == genealogyNotation ? _self.genealogyNotation : genealogyNotation // ignore: cast_nullable_to_non_nullable
as String,relationshipDegree: null == relationshipDegree ? _self.relationshipDegree : relationshipDegree // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Relationship].
extension RelationshipPatterns on Relationship {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Relationship value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Relationship() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Relationship value)  $default,){
final _that = this;
switch (_that) {
case _Relationship():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Relationship value)?  $default,){
final _that = this;
switch (_that) {
case _Relationship() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Person subject,  Person relativeTo,  Types type,  RelationshipPath path,  int generationGap,  List<Gender> genderPath,  List<RelationshipStep> stepPath,  bool isDirect,  bool isBloodRelation,  String detailedDescription,  Lineage lineage,  Map<String, dynamic> metadata,  String genealogyNotation,  int relationshipDegree)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Relationship() when $default != null:
return $default(_that.subject,_that.relativeTo,_that.type,_that.path,_that.generationGap,_that.genderPath,_that.stepPath,_that.isDirect,_that.isBloodRelation,_that.detailedDescription,_that.lineage,_that.metadata,_that.genealogyNotation,_that.relationshipDegree);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Person subject,  Person relativeTo,  Types type,  RelationshipPath path,  int generationGap,  List<Gender> genderPath,  List<RelationshipStep> stepPath,  bool isDirect,  bool isBloodRelation,  String detailedDescription,  Lineage lineage,  Map<String, dynamic> metadata,  String genealogyNotation,  int relationshipDegree)  $default,) {final _that = this;
switch (_that) {
case _Relationship():
return $default(_that.subject,_that.relativeTo,_that.type,_that.path,_that.generationGap,_that.genderPath,_that.stepPath,_that.isDirect,_that.isBloodRelation,_that.detailedDescription,_that.lineage,_that.metadata,_that.genealogyNotation,_that.relationshipDegree);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Person subject,  Person relativeTo,  Types type,  RelationshipPath path,  int generationGap,  List<Gender> genderPath,  List<RelationshipStep> stepPath,  bool isDirect,  bool isBloodRelation,  String detailedDescription,  Lineage lineage,  Map<String, dynamic> metadata,  String genealogyNotation,  int relationshipDegree)?  $default,) {final _that = this;
switch (_that) {
case _Relationship() when $default != null:
return $default(_that.subject,_that.relativeTo,_that.type,_that.path,_that.generationGap,_that.genderPath,_that.stepPath,_that.isDirect,_that.isBloodRelation,_that.detailedDescription,_that.lineage,_that.metadata,_that.genealogyNotation,_that.relationshipDegree);case _:
  return null;

}
}

}

/// @nodoc


class _Relationship extends Relationship {
  const _Relationship({required this.subject, required this.relativeTo, required this.type, required this.path, required this.generationGap, required final  List<Gender> genderPath, required final  List<RelationshipStep> stepPath, required this.isDirect, required this.isBloodRelation, required this.detailedDescription, required this.lineage, required final  Map<String, dynamic> metadata, required this.genealogyNotation, required this.relationshipDegree}): _genderPath = genderPath,_stepPath = stepPath,_metadata = metadata,super._();
  

@override final  Person subject;
@override final  Person relativeTo;
@override final  Types type;
@override final  RelationshipPath path;
@override final  int generationGap;
// 0 for siblings/spouses, positive for descendants, negative for ancestors
 final  List<Gender> _genderPath;
// 0 for siblings/spouses, positive for descendants, negative for ancestors
@override List<Gender> get genderPath {
  if (_genderPath is EqualUnmodifiableListView) return _genderPath;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_genderPath);
}

// Gender of each person in the path
 final  List<RelationshipStep> _stepPath;
// Gender of each person in the path
@override List<RelationshipStep> get stepPath {
  if (_stepPath is EqualUnmodifiableListView) return _stepPath;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_stepPath);
}

// The relationship steps taken
@override final  bool isDirect;
// true for direct line (parent-child only)
@override final  bool isBloodRelation;
// false for spouses/in-laws/manumitter
@override final  String detailedDescription;
// e.g., "paternal grandfather (father's father)"
@override final  Lineage lineage;
// paternal, maternal, or mixed
 final  Map<String, dynamic> _metadata;
// paternal, maternal, or mixed
@override Map<String, dynamic> get metadata {
  if (_metadata is EqualUnmodifiableMapView) return _metadata;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_metadata);
}

// Additional context
@override final  String genealogyNotation;
// Standard notation like "FF" for father's father
@override final  int relationshipDegree;

/// Create a copy of Relationship
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RelationshipCopyWith<_Relationship> get copyWith => __$RelationshipCopyWithImpl<_Relationship>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Relationship&&(identical(other.subject, subject) || other.subject == subject)&&(identical(other.relativeTo, relativeTo) || other.relativeTo == relativeTo)&&(identical(other.type, type) || other.type == type)&&(identical(other.path, path) || other.path == path)&&(identical(other.generationGap, generationGap) || other.generationGap == generationGap)&&const DeepCollectionEquality().equals(other._genderPath, _genderPath)&&const DeepCollectionEquality().equals(other._stepPath, _stepPath)&&(identical(other.isDirect, isDirect) || other.isDirect == isDirect)&&(identical(other.isBloodRelation, isBloodRelation) || other.isBloodRelation == isBloodRelation)&&(identical(other.detailedDescription, detailedDescription) || other.detailedDescription == detailedDescription)&&(identical(other.lineage, lineage) || other.lineage == lineage)&&const DeepCollectionEquality().equals(other._metadata, _metadata)&&(identical(other.genealogyNotation, genealogyNotation) || other.genealogyNotation == genealogyNotation)&&(identical(other.relationshipDegree, relationshipDegree) || other.relationshipDegree == relationshipDegree));
}


@override
int get hashCode => Object.hash(runtimeType,subject,relativeTo,type,path,generationGap,const DeepCollectionEquality().hash(_genderPath),const DeepCollectionEquality().hash(_stepPath),isDirect,isBloodRelation,detailedDescription,lineage,const DeepCollectionEquality().hash(_metadata),genealogyNotation,relationshipDegree);



}

/// @nodoc
abstract mixin class _$RelationshipCopyWith<$Res> implements $RelationshipCopyWith<$Res> {
  factory _$RelationshipCopyWith(_Relationship value, $Res Function(_Relationship) _then) = __$RelationshipCopyWithImpl;
@override @useResult
$Res call({
 Person subject, Person relativeTo, Types type, RelationshipPath path, int generationGap, List<Gender> genderPath, List<RelationshipStep> stepPath, bool isDirect, bool isBloodRelation, String detailedDescription, Lineage lineage, Map<String, dynamic> metadata, String genealogyNotation, int relationshipDegree
});




}
/// @nodoc
class __$RelationshipCopyWithImpl<$Res>
    implements _$RelationshipCopyWith<$Res> {
  __$RelationshipCopyWithImpl(this._self, this._then);

  final _Relationship _self;
  final $Res Function(_Relationship) _then;

/// Create a copy of Relationship
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? subject = null,Object? relativeTo = null,Object? type = null,Object? path = null,Object? generationGap = null,Object? genderPath = null,Object? stepPath = null,Object? isDirect = null,Object? isBloodRelation = null,Object? detailedDescription = null,Object? lineage = null,Object? metadata = null,Object? genealogyNotation = null,Object? relationshipDegree = null,}) {
  return _then(_Relationship(
subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as Person,relativeTo: null == relativeTo ? _self.relativeTo : relativeTo // ignore: cast_nullable_to_non_nullable
as Person,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as Types,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as RelationshipPath,generationGap: null == generationGap ? _self.generationGap : generationGap // ignore: cast_nullable_to_non_nullable
as int,genderPath: null == genderPath ? _self._genderPath : genderPath // ignore: cast_nullable_to_non_nullable
as List<Gender>,stepPath: null == stepPath ? _self._stepPath : stepPath // ignore: cast_nullable_to_non_nullable
as List<RelationshipStep>,isDirect: null == isDirect ? _self.isDirect : isDirect // ignore: cast_nullable_to_non_nullable
as bool,isBloodRelation: null == isBloodRelation ? _self.isBloodRelation : isBloodRelation // ignore: cast_nullable_to_non_nullable
as bool,detailedDescription: null == detailedDescription ? _self.detailedDescription : detailedDescription // ignore: cast_nullable_to_non_nullable
as String,lineage: null == lineage ? _self.lineage : lineage // ignore: cast_nullable_to_non_nullable
as Lineage,metadata: null == metadata ? _self._metadata : metadata // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,genealogyNotation: null == genealogyNotation ? _self.genealogyNotation : genealogyNotation // ignore: cast_nullable_to_non_nullable
as String,relationshipDegree: null == relationshipDegree ? _self.relationshipDegree : relationshipDegree // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on

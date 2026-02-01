// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'archery_round.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ArcheryRound _$ArcheryRoundFromJson(Map<String, dynamic> json) {
  return _ArcheryRound.fromJson(json);
}

/// @nodoc
mixin _$ArcheryRound {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  int get distance => throw _privateConstructorUsedError; // e.g., 70, 50, 18
  @HiveField(2)
  String get distanceUnit => throw _privateConstructorUsedError; // 'm' or 'yd'
  @HiveField(3)
  String get targetType =>
      throw _privateConstructorUsedError; // 'wa10Ring122cm', etc.
  @HiveField(4)
  List<ShotPosition> get shots => throw _privateConstructorUsedError;
  @HiveField(5)
  int get arrowCount => throw _privateConstructorUsedError;
  @HiveField(6)
  int get totalScore => throw _privateConstructorUsedError;
  @HiveField(7)
  double? get averageScore => throw _privateConstructorUsedError;
  @HiveField(8)
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this ArcheryRound to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ArcheryRound
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ArcheryRoundCopyWith<ArcheryRound> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArcheryRoundCopyWith<$Res> {
  factory $ArcheryRoundCopyWith(
          ArcheryRound value, $Res Function(ArcheryRound) then) =
      _$ArcheryRoundCopyWithImpl<$Res, ArcheryRound>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) int distance,
      @HiveField(2) String distanceUnit,
      @HiveField(3) String targetType,
      @HiveField(4) List<ShotPosition> shots,
      @HiveField(5) int arrowCount,
      @HiveField(6) int totalScore,
      @HiveField(7) double? averageScore,
      @HiveField(8) DateTime createdAt});
}

/// @nodoc
class _$ArcheryRoundCopyWithImpl<$Res, $Val extends ArcheryRound>
    implements $ArcheryRoundCopyWith<$Res> {
  _$ArcheryRoundCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ArcheryRound
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? distance = null,
    Object? distanceUnit = null,
    Object? targetType = null,
    Object? shots = null,
    Object? arrowCount = null,
    Object? totalScore = null,
    Object? averageScore = freezed,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as int,
      distanceUnit: null == distanceUnit
          ? _value.distanceUnit
          : distanceUnit // ignore: cast_nullable_to_non_nullable
              as String,
      targetType: null == targetType
          ? _value.targetType
          : targetType // ignore: cast_nullable_to_non_nullable
              as String,
      shots: null == shots
          ? _value.shots
          : shots // ignore: cast_nullable_to_non_nullable
              as List<ShotPosition>,
      arrowCount: null == arrowCount
          ? _value.arrowCount
          : arrowCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalScore: null == totalScore
          ? _value.totalScore
          : totalScore // ignore: cast_nullable_to_non_nullable
              as int,
      averageScore: freezed == averageScore
          ? _value.averageScore
          : averageScore // ignore: cast_nullable_to_non_nullable
              as double?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ArcheryRoundImplCopyWith<$Res>
    implements $ArcheryRoundCopyWith<$Res> {
  factory _$$ArcheryRoundImplCopyWith(
          _$ArcheryRoundImpl value, $Res Function(_$ArcheryRoundImpl) then) =
      __$$ArcheryRoundImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) int distance,
      @HiveField(2) String distanceUnit,
      @HiveField(3) String targetType,
      @HiveField(4) List<ShotPosition> shots,
      @HiveField(5) int arrowCount,
      @HiveField(6) int totalScore,
      @HiveField(7) double? averageScore,
      @HiveField(8) DateTime createdAt});
}

/// @nodoc
class __$$ArcheryRoundImplCopyWithImpl<$Res>
    extends _$ArcheryRoundCopyWithImpl<$Res, _$ArcheryRoundImpl>
    implements _$$ArcheryRoundImplCopyWith<$Res> {
  __$$ArcheryRoundImplCopyWithImpl(
      _$ArcheryRoundImpl _value, $Res Function(_$ArcheryRoundImpl) _then)
      : super(_value, _then);

  /// Create a copy of ArcheryRound
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? distance = null,
    Object? distanceUnit = null,
    Object? targetType = null,
    Object? shots = null,
    Object? arrowCount = null,
    Object? totalScore = null,
    Object? averageScore = freezed,
    Object? createdAt = null,
  }) {
    return _then(_$ArcheryRoundImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as int,
      distanceUnit: null == distanceUnit
          ? _value.distanceUnit
          : distanceUnit // ignore: cast_nullable_to_non_nullable
              as String,
      targetType: null == targetType
          ? _value.targetType
          : targetType // ignore: cast_nullable_to_non_nullable
              as String,
      shots: null == shots
          ? _value._shots
          : shots // ignore: cast_nullable_to_non_nullable
              as List<ShotPosition>,
      arrowCount: null == arrowCount
          ? _value.arrowCount
          : arrowCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalScore: null == totalScore
          ? _value.totalScore
          : totalScore // ignore: cast_nullable_to_non_nullable
              as int,
      averageScore: freezed == averageScore
          ? _value.averageScore
          : averageScore // ignore: cast_nullable_to_non_nullable
              as double?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArcheryRoundImpl implements _ArcheryRound {
  const _$ArcheryRoundImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.distance,
      @HiveField(2) required this.distanceUnit,
      @HiveField(3) required this.targetType,
      @HiveField(4) final List<ShotPosition> shots = const [],
      @HiveField(5) required this.arrowCount,
      @HiveField(6) required this.totalScore,
      @HiveField(7) this.averageScore,
      @HiveField(8) required this.createdAt})
      : _shots = shots;

  factory _$ArcheryRoundImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArcheryRoundImplFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final int distance;
// e.g., 70, 50, 18
  @override
  @HiveField(2)
  final String distanceUnit;
// 'm' or 'yd'
  @override
  @HiveField(3)
  final String targetType;
// 'wa10Ring122cm', etc.
  final List<ShotPosition> _shots;
// 'wa10Ring122cm', etc.
  @override
  @JsonKey()
  @HiveField(4)
  List<ShotPosition> get shots {
    if (_shots is EqualUnmodifiableListView) return _shots;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shots);
  }

  @override
  @HiveField(5)
  final int arrowCount;
  @override
  @HiveField(6)
  final int totalScore;
  @override
  @HiveField(7)
  final double? averageScore;
  @override
  @HiveField(8)
  final DateTime createdAt;

  @override
  String toString() {
    return 'ArcheryRound(id: $id, distance: $distance, distanceUnit: $distanceUnit, targetType: $targetType, shots: $shots, arrowCount: $arrowCount, totalScore: $totalScore, averageScore: $averageScore, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArcheryRoundImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.distanceUnit, distanceUnit) ||
                other.distanceUnit == distanceUnit) &&
            (identical(other.targetType, targetType) ||
                other.targetType == targetType) &&
            const DeepCollectionEquality().equals(other._shots, _shots) &&
            (identical(other.arrowCount, arrowCount) ||
                other.arrowCount == arrowCount) &&
            (identical(other.totalScore, totalScore) ||
                other.totalScore == totalScore) &&
            (identical(other.averageScore, averageScore) ||
                other.averageScore == averageScore) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      distance,
      distanceUnit,
      targetType,
      const DeepCollectionEquality().hash(_shots),
      arrowCount,
      totalScore,
      averageScore,
      createdAt);

  /// Create a copy of ArcheryRound
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ArcheryRoundImplCopyWith<_$ArcheryRoundImpl> get copyWith =>
      __$$ArcheryRoundImplCopyWithImpl<_$ArcheryRoundImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArcheryRoundImplToJson(
      this,
    );
  }
}

abstract class _ArcheryRound implements ArcheryRound {
  const factory _ArcheryRound(
      {@HiveField(0) required final String id,
      @HiveField(1) required final int distance,
      @HiveField(2) required final String distanceUnit,
      @HiveField(3) required final String targetType,
      @HiveField(4) final List<ShotPosition> shots,
      @HiveField(5) required final int arrowCount,
      @HiveField(6) required final int totalScore,
      @HiveField(7) final double? averageScore,
      @HiveField(8) required final DateTime createdAt}) = _$ArcheryRoundImpl;

  factory _ArcheryRound.fromJson(Map<String, dynamic> json) =
      _$ArcheryRoundImpl.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  int get distance; // e.g., 70, 50, 18
  @override
  @HiveField(2)
  String get distanceUnit; // 'm' or 'yd'
  @override
  @HiveField(3)
  String get targetType; // 'wa10Ring122cm', etc.
  @override
  @HiveField(4)
  List<ShotPosition> get shots;
  @override
  @HiveField(5)
  int get arrowCount;
  @override
  @HiveField(6)
  int get totalScore;
  @override
  @HiveField(7)
  double? get averageScore;
  @override
  @HiveField(8)
  DateTime get createdAt;

  /// Create a copy of ArcheryRound
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ArcheryRoundImplCopyWith<_$ArcheryRoundImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

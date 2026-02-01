// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'archery_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ArcherySession _$ArcherySessionFromJson(Map<String, dynamic> json) {
  return _ArcherySession.fromJson(json);
}

/// @nodoc
mixin _$ArcherySession {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get ownerId =>
      throw _privateConstructorUsedError; // Owner ID (local or Firebase)
  @HiveField(2)
  DateTime get date => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get title =>
      throw _privateConstructorUsedError; // "Morning practice", etc.
  @HiveField(14)
  List<ArcheryRound> get rounds =>
      throw _privateConstructorUsedError; // NEW: Round-based structure
// DEPRECATED but keep for migration:
  @Deprecated('Use rounds instead')
  @HiveField(4)
  int? get arrowCount => throw _privateConstructorUsedError;
  @Deprecated('Use rounds instead')
  @HiveField(5)
  int? get totalScore => throw _privateConstructorUsedError;
  @Deprecated('Use rounds instead')
  @HiveField(6)
  double? get averageScore => throw _privateConstructorUsedError;
  @Deprecated('Use rounds instead')
  @HiveField(7)
  List<ShotPosition> get shots => throw _privateConstructorUsedError;
  @HiveField(8)
  String? get voiceNotePath =>
      throw _privateConstructorUsedError; // For Phase 3 (local file path)
  @HiveField(9)
  String? get voiceNoteUrl =>
      throw _privateConstructorUsedError; // For Phase 3 (cloud URL after sync)
  @HiveField(10)
  String? get transcription =>
      throw _privateConstructorUsedError; // For Phase 3
  @HiveField(11)
  bool get isSynced => throw _privateConstructorUsedError; // Synced to cloud?
  @HiveField(12)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @HiveField(13)
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this ArcherySession to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ArcherySession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ArcherySessionCopyWith<ArcherySession> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArcherySessionCopyWith<$Res> {
  factory $ArcherySessionCopyWith(
          ArcherySession value, $Res Function(ArcherySession) then) =
      _$ArcherySessionCopyWithImpl<$Res, ArcherySession>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String ownerId,
      @HiveField(2) DateTime date,
      @HiveField(3) String? title,
      @HiveField(14) List<ArcheryRound> rounds,
      @Deprecated('Use rounds instead') @HiveField(4) int? arrowCount,
      @Deprecated('Use rounds instead') @HiveField(5) int? totalScore,
      @Deprecated('Use rounds instead') @HiveField(6) double? averageScore,
      @Deprecated('Use rounds instead') @HiveField(7) List<ShotPosition> shots,
      @HiveField(8) String? voiceNotePath,
      @HiveField(9) String? voiceNoteUrl,
      @HiveField(10) String? transcription,
      @HiveField(11) bool isSynced,
      @HiveField(12) DateTime createdAt,
      @HiveField(13) DateTime updatedAt});
}

/// @nodoc
class _$ArcherySessionCopyWithImpl<$Res, $Val extends ArcherySession>
    implements $ArcherySessionCopyWith<$Res> {
  _$ArcherySessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ArcherySession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ownerId = null,
    Object? date = null,
    Object? title = freezed,
    Object? rounds = null,
    Object? arrowCount = freezed,
    Object? totalScore = freezed,
    Object? averageScore = freezed,
    Object? shots = null,
    Object? voiceNotePath = freezed,
    Object? voiceNoteUrl = freezed,
    Object? transcription = freezed,
    Object? isSynced = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      rounds: null == rounds
          ? _value.rounds
          : rounds // ignore: cast_nullable_to_non_nullable
              as List<ArcheryRound>,
      arrowCount: freezed == arrowCount
          ? _value.arrowCount
          : arrowCount // ignore: cast_nullable_to_non_nullable
              as int?,
      totalScore: freezed == totalScore
          ? _value.totalScore
          : totalScore // ignore: cast_nullable_to_non_nullable
              as int?,
      averageScore: freezed == averageScore
          ? _value.averageScore
          : averageScore // ignore: cast_nullable_to_non_nullable
              as double?,
      shots: null == shots
          ? _value.shots
          : shots // ignore: cast_nullable_to_non_nullable
              as List<ShotPosition>,
      voiceNotePath: freezed == voiceNotePath
          ? _value.voiceNotePath
          : voiceNotePath // ignore: cast_nullable_to_non_nullable
              as String?,
      voiceNoteUrl: freezed == voiceNoteUrl
          ? _value.voiceNoteUrl
          : voiceNoteUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      transcription: freezed == transcription
          ? _value.transcription
          : transcription // ignore: cast_nullable_to_non_nullable
              as String?,
      isSynced: null == isSynced
          ? _value.isSynced
          : isSynced // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ArcherySessionImplCopyWith<$Res>
    implements $ArcherySessionCopyWith<$Res> {
  factory _$$ArcherySessionImplCopyWith(_$ArcherySessionImpl value,
          $Res Function(_$ArcherySessionImpl) then) =
      __$$ArcherySessionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String ownerId,
      @HiveField(2) DateTime date,
      @HiveField(3) String? title,
      @HiveField(14) List<ArcheryRound> rounds,
      @Deprecated('Use rounds instead') @HiveField(4) int? arrowCount,
      @Deprecated('Use rounds instead') @HiveField(5) int? totalScore,
      @Deprecated('Use rounds instead') @HiveField(6) double? averageScore,
      @Deprecated('Use rounds instead') @HiveField(7) List<ShotPosition> shots,
      @HiveField(8) String? voiceNotePath,
      @HiveField(9) String? voiceNoteUrl,
      @HiveField(10) String? transcription,
      @HiveField(11) bool isSynced,
      @HiveField(12) DateTime createdAt,
      @HiveField(13) DateTime updatedAt});
}

/// @nodoc
class __$$ArcherySessionImplCopyWithImpl<$Res>
    extends _$ArcherySessionCopyWithImpl<$Res, _$ArcherySessionImpl>
    implements _$$ArcherySessionImplCopyWith<$Res> {
  __$$ArcherySessionImplCopyWithImpl(
      _$ArcherySessionImpl _value, $Res Function(_$ArcherySessionImpl) _then)
      : super(_value, _then);

  /// Create a copy of ArcherySession
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ownerId = null,
    Object? date = null,
    Object? title = freezed,
    Object? rounds = null,
    Object? arrowCount = freezed,
    Object? totalScore = freezed,
    Object? averageScore = freezed,
    Object? shots = null,
    Object? voiceNotePath = freezed,
    Object? voiceNoteUrl = freezed,
    Object? transcription = freezed,
    Object? isSynced = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$ArcherySessionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      rounds: null == rounds
          ? _value._rounds
          : rounds // ignore: cast_nullable_to_non_nullable
              as List<ArcheryRound>,
      arrowCount: freezed == arrowCount
          ? _value.arrowCount
          : arrowCount // ignore: cast_nullable_to_non_nullable
              as int?,
      totalScore: freezed == totalScore
          ? _value.totalScore
          : totalScore // ignore: cast_nullable_to_non_nullable
              as int?,
      averageScore: freezed == averageScore
          ? _value.averageScore
          : averageScore // ignore: cast_nullable_to_non_nullable
              as double?,
      shots: null == shots
          ? _value._shots
          : shots // ignore: cast_nullable_to_non_nullable
              as List<ShotPosition>,
      voiceNotePath: freezed == voiceNotePath
          ? _value.voiceNotePath
          : voiceNotePath // ignore: cast_nullable_to_non_nullable
              as String?,
      voiceNoteUrl: freezed == voiceNoteUrl
          ? _value.voiceNoteUrl
          : voiceNoteUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      transcription: freezed == transcription
          ? _value.transcription
          : transcription // ignore: cast_nullable_to_non_nullable
              as String?,
      isSynced: null == isSynced
          ? _value.isSynced
          : isSynced // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArcherySessionImpl implements _ArcherySession {
  const _$ArcherySessionImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.ownerId,
      @HiveField(2) required this.date,
      @HiveField(3) this.title,
      @HiveField(14) final List<ArcheryRound> rounds = const [],
      @Deprecated('Use rounds instead') @HiveField(4) this.arrowCount,
      @Deprecated('Use rounds instead') @HiveField(5) this.totalScore,
      @Deprecated('Use rounds instead') @HiveField(6) this.averageScore,
      @Deprecated('Use rounds instead')
      @HiveField(7)
      final List<ShotPosition> shots = const [],
      @HiveField(8) this.voiceNotePath,
      @HiveField(9) this.voiceNoteUrl,
      @HiveField(10) this.transcription,
      @HiveField(11) this.isSynced = false,
      @HiveField(12) required this.createdAt,
      @HiveField(13) required this.updatedAt})
      : _rounds = rounds,
        _shots = shots;

  factory _$ArcherySessionImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArcherySessionImplFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String ownerId;
// Owner ID (local or Firebase)
  @override
  @HiveField(2)
  final DateTime date;
  @override
  @HiveField(3)
  final String? title;
// "Morning practice", etc.
  final List<ArcheryRound> _rounds;
// "Morning practice", etc.
  @override
  @JsonKey()
  @HiveField(14)
  List<ArcheryRound> get rounds {
    if (_rounds is EqualUnmodifiableListView) return _rounds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rounds);
  }

// NEW: Round-based structure
// DEPRECATED but keep for migration:
  @override
  @Deprecated('Use rounds instead')
  @HiveField(4)
  final int? arrowCount;
  @override
  @Deprecated('Use rounds instead')
  @HiveField(5)
  final int? totalScore;
  @override
  @Deprecated('Use rounds instead')
  @HiveField(6)
  final double? averageScore;
  final List<ShotPosition> _shots;
  @override
  @JsonKey()
  @Deprecated('Use rounds instead')
  @HiveField(7)
  List<ShotPosition> get shots {
    if (_shots is EqualUnmodifiableListView) return _shots;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shots);
  }

  @override
  @HiveField(8)
  final String? voiceNotePath;
// For Phase 3 (local file path)
  @override
  @HiveField(9)
  final String? voiceNoteUrl;
// For Phase 3 (cloud URL after sync)
  @override
  @HiveField(10)
  final String? transcription;
// For Phase 3
  @override
  @JsonKey()
  @HiveField(11)
  final bool isSynced;
// Synced to cloud?
  @override
  @HiveField(12)
  final DateTime createdAt;
  @override
  @HiveField(13)
  final DateTime updatedAt;

  @override
  String toString() {
    return 'ArcherySession(id: $id, ownerId: $ownerId, date: $date, title: $title, rounds: $rounds, arrowCount: $arrowCount, totalScore: $totalScore, averageScore: $averageScore, shots: $shots, voiceNotePath: $voiceNotePath, voiceNoteUrl: $voiceNoteUrl, transcription: $transcription, isSynced: $isSynced, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArcherySessionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._rounds, _rounds) &&
            (identical(other.arrowCount, arrowCount) ||
                other.arrowCount == arrowCount) &&
            (identical(other.totalScore, totalScore) ||
                other.totalScore == totalScore) &&
            (identical(other.averageScore, averageScore) ||
                other.averageScore == averageScore) &&
            const DeepCollectionEquality().equals(other._shots, _shots) &&
            (identical(other.voiceNotePath, voiceNotePath) ||
                other.voiceNotePath == voiceNotePath) &&
            (identical(other.voiceNoteUrl, voiceNoteUrl) ||
                other.voiceNoteUrl == voiceNoteUrl) &&
            (identical(other.transcription, transcription) ||
                other.transcription == transcription) &&
            (identical(other.isSynced, isSynced) ||
                other.isSynced == isSynced) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      ownerId,
      date,
      title,
      const DeepCollectionEquality().hash(_rounds),
      arrowCount,
      totalScore,
      averageScore,
      const DeepCollectionEquality().hash(_shots),
      voiceNotePath,
      voiceNoteUrl,
      transcription,
      isSynced,
      createdAt,
      updatedAt);

  /// Create a copy of ArcherySession
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ArcherySessionImplCopyWith<_$ArcherySessionImpl> get copyWith =>
      __$$ArcherySessionImplCopyWithImpl<_$ArcherySessionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArcherySessionImplToJson(
      this,
    );
  }
}

abstract class _ArcherySession implements ArcherySession {
  const factory _ArcherySession(
      {@HiveField(0) required final String id,
      @HiveField(1) required final String ownerId,
      @HiveField(2) required final DateTime date,
      @HiveField(3) final String? title,
      @HiveField(14) final List<ArcheryRound> rounds,
      @Deprecated('Use rounds instead') @HiveField(4) final int? arrowCount,
      @Deprecated('Use rounds instead') @HiveField(5) final int? totalScore,
      @Deprecated('Use rounds instead')
      @HiveField(6)
      final double? averageScore,
      @Deprecated('Use rounds instead')
      @HiveField(7)
      final List<ShotPosition> shots,
      @HiveField(8) final String? voiceNotePath,
      @HiveField(9) final String? voiceNoteUrl,
      @HiveField(10) final String? transcription,
      @HiveField(11) final bool isSynced,
      @HiveField(12) required final DateTime createdAt,
      @HiveField(13) required final DateTime updatedAt}) = _$ArcherySessionImpl;

  factory _ArcherySession.fromJson(Map<String, dynamic> json) =
      _$ArcherySessionImpl.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get ownerId; // Owner ID (local or Firebase)
  @override
  @HiveField(2)
  DateTime get date;
  @override
  @HiveField(3)
  String? get title; // "Morning practice", etc.
  @override
  @HiveField(14)
  List<ArcheryRound> get rounds; // NEW: Round-based structure
// DEPRECATED but keep for migration:
  @override
  @Deprecated('Use rounds instead')
  @HiveField(4)
  int? get arrowCount;
  @override
  @Deprecated('Use rounds instead')
  @HiveField(5)
  int? get totalScore;
  @override
  @Deprecated('Use rounds instead')
  @HiveField(6)
  double? get averageScore;
  @override
  @Deprecated('Use rounds instead')
  @HiveField(7)
  List<ShotPosition> get shots;
  @override
  @HiveField(8)
  String? get voiceNotePath; // For Phase 3 (local file path)
  @override
  @HiveField(9)
  String? get voiceNoteUrl; // For Phase 3 (cloud URL after sync)
  @override
  @HiveField(10)
  String? get transcription; // For Phase 3
  @override
  @HiveField(11)
  bool get isSynced; // Synced to cloud?
  @override
  @HiveField(12)
  DateTime get createdAt;
  @override
  @HiveField(13)
  DateTime get updatedAt;

  /// Create a copy of ArcherySession
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ArcherySessionImplCopyWith<_$ArcherySessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

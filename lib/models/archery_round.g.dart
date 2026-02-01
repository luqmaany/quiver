// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'archery_round.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ArcheryRoundAdapter extends TypeAdapter<ArcheryRound> {
  @override
  final int typeId = 3;

  @override
  ArcheryRound read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ArcheryRound(
      id: fields[0] as String,
      distance: fields[1] as int,
      distanceUnit: fields[2] as String,
      targetType: fields[3] as String,
      shots: (fields[4] as List).cast<ShotPosition>(),
      arrowCount: fields[5] as int,
      totalScore: fields[6] as int,
      averageScore: fields[7] as double?,
      createdAt: fields[8] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, ArcheryRound obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.distance)
      ..writeByte(2)
      ..write(obj.distanceUnit)
      ..writeByte(3)
      ..write(obj.targetType)
      ..writeByte(4)
      ..write(obj.shots)
      ..writeByte(5)
      ..write(obj.arrowCount)
      ..writeByte(6)
      ..write(obj.totalScore)
      ..writeByte(7)
      ..write(obj.averageScore)
      ..writeByte(8)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ArcheryRoundAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArcheryRoundImpl _$$ArcheryRoundImplFromJson(Map<String, dynamic> json) =>
    _$ArcheryRoundImpl(
      id: json['id'] as String,
      distance: (json['distance'] as num).toInt(),
      distanceUnit: json['distanceUnit'] as String,
      targetType: json['targetType'] as String,
      shots: (json['shots'] as List<dynamic>?)
              ?.map((e) => ShotPosition.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      arrowCount: (json['arrowCount'] as num).toInt(),
      totalScore: (json['totalScore'] as num).toInt(),
      averageScore: (json['averageScore'] as num?)?.toDouble(),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$ArcheryRoundImplToJson(_$ArcheryRoundImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'distance': instance.distance,
      'distanceUnit': instance.distanceUnit,
      'targetType': instance.targetType,
      'shots': instance.shots,
      'arrowCount': instance.arrowCount,
      'totalScore': instance.totalScore,
      'averageScore': instance.averageScore,
      'createdAt': instance.createdAt.toIso8601String(),
    };

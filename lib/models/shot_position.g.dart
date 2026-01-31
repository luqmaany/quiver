// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shot_position.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ShotPositionAdapter extends TypeAdapter<ShotPosition> {
  @override
  final int typeId = 2;

  @override
  ShotPosition read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ShotPosition(
      x: fields[0] as double,
      y: fields[1] as double,
      score: fields[2] as int,
      timestamp: fields[3] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, ShotPosition obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.x)
      ..writeByte(1)
      ..write(obj.y)
      ..writeByte(2)
      ..write(obj.score)
      ..writeByte(3)
      ..write(obj.timestamp);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShotPositionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ShotPositionImpl _$$ShotPositionImplFromJson(Map<String, dynamic> json) =>
    _$ShotPositionImpl(
      x: (json['x'] as num).toDouble(),
      y: (json['y'] as num).toDouble(),
      score: (json['score'] as num).toInt(),
      timestamp: DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$$ShotPositionImplToJson(_$ShotPositionImpl instance) =>
    <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
      'score': instance.score,
      'timestamp': instance.timestamp.toIso8601String(),
    };

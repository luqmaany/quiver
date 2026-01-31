// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'archery_session.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ArcherySessionAdapter extends TypeAdapter<ArcherySession> {
  @override
  final int typeId = 1;

  @override
  ArcherySession read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ArcherySession(
      id: fields[0] as String,
      ownerId: fields[1] as String,
      date: fields[2] as DateTime,
      title: fields[3] as String?,
      arrowCount: fields[4] as int,
      totalScore: fields[5] as int,
      averageScore: fields[6] as double?,
      shots: (fields[7] as List).cast<ShotPosition>(),
      voiceNotePath: fields[8] as String?,
      voiceNoteUrl: fields[9] as String?,
      transcription: fields[10] as String?,
      isSynced: fields[11] as bool,
      createdAt: fields[12] as DateTime,
      updatedAt: fields[13] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, ArcherySession obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.ownerId)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.title)
      ..writeByte(4)
      ..write(obj.arrowCount)
      ..writeByte(5)
      ..write(obj.totalScore)
      ..writeByte(6)
      ..write(obj.averageScore)
      ..writeByte(7)
      ..write(obj.shots)
      ..writeByte(8)
      ..write(obj.voiceNotePath)
      ..writeByte(9)
      ..write(obj.voiceNoteUrl)
      ..writeByte(10)
      ..write(obj.transcription)
      ..writeByte(11)
      ..write(obj.isSynced)
      ..writeByte(12)
      ..write(obj.createdAt)
      ..writeByte(13)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ArcherySessionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArcherySessionImpl _$$ArcherySessionImplFromJson(Map<String, dynamic> json) =>
    _$ArcherySessionImpl(
      id: json['id'] as String,
      ownerId: json['ownerId'] as String,
      date: DateTime.parse(json['date'] as String),
      title: json['title'] as String?,
      arrowCount: (json['arrowCount'] as num).toInt(),
      totalScore: (json['totalScore'] as num).toInt(),
      averageScore: (json['averageScore'] as num?)?.toDouble(),
      shots: (json['shots'] as List<dynamic>?)
              ?.map((e) => ShotPosition.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      voiceNotePath: json['voiceNotePath'] as String?,
      voiceNoteUrl: json['voiceNoteUrl'] as String?,
      transcription: json['transcription'] as String?,
      isSynced: json['isSynced'] as bool? ?? false,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$ArcherySessionImplToJson(
        _$ArcherySessionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ownerId': instance.ownerId,
      'date': instance.date.toIso8601String(),
      'title': instance.title,
      'arrowCount': instance.arrowCount,
      'totalScore': instance.totalScore,
      'averageScore': instance.averageScore,
      'shots': instance.shots,
      'voiceNotePath': instance.voiceNotePath,
      'voiceNoteUrl': instance.voiceNoteUrl,
      'transcription': instance.transcription,
      'isSynced': instance.isSynced,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

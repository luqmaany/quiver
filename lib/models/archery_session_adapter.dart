import 'package:hive/hive.dart';
import 'archery_session.dart';
import 'archery_round.dart';
import 'shot_position.dart';

/// Custom Hive adapter for ArcherySession that handles migration from old format
class ArcherySessionAdapterMigration extends TypeAdapter<ArcherySession> {
  @override
  final int typeId = 1;

  @override
  ArcherySession read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    
    // Handle rounds field (new in round-based architecture)
    // If field 14 doesn't exist, default to empty list
    final rounds = fields[14] != null 
        ? (fields[14] as List).cast<ArcheryRound>()
        : <ArcheryRound>[];
    
    // Handle shots field (may be empty list in new data)
    final shots = fields[7] != null
        ? (fields[7] as List).cast<ShotPosition>()
        : <ShotPosition>[];
    
    return ArcherySession(
      id: fields[0] as String,
      ownerId: fields[1] as String,
      date: fields[2] as DateTime,
      title: fields[3] as String?,
      rounds: rounds,
      arrowCount: fields[4] as int?,
      totalScore: fields[5] as int?,
      averageScore: fields[6] as double?,
      shots: shots,
      voiceNotePath: fields[8] as String?,
      voiceNoteUrl: fields[9] as String?,
      transcription: fields[10] as String?,
      isSynced: fields[11] as bool? ?? false,
      createdAt: fields[12] as DateTime,
      updatedAt: fields[13] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, ArcherySession obj) {
    writer
      ..writeByte(15) // Number of fields
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.ownerId)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.title)
      ..writeByte(14)
      ..write(obj.rounds)
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
      other is ArcherySessionAdapterMigration &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

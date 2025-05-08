import 'package:hive/hive.dart';

part 'hive_service.g.dart';

@HiveType(typeId: 0)
class HiveService {
  Future<void> init() async {
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(DogNoteAdapter());
    }
    if (!Hive.isBoxOpen('dog_notes')) {
      await Hive.openBox<DogNote>('dog_notes');
    }
  }

  Box<DogNote> get notesBox => Hive.box<DogNote>('dog_notes');
  static final HiveService _instance = HiveService._internal();

  factory HiveService() => _instance;

  HiveService._internal();


}

@HiveType(typeId: 0)
class DogNote extends HiveObject {
  @HiveField(0)
  String id; // <- добавлено

  @HiveField(1)
  String title;

  @HiveField(2)
  String comment;

  @HiveField(3)
  String? imagePath;

  DogNote({
    required this.id,
    required this.title,
    required this.comment,
    this.imagePath,
  });
}

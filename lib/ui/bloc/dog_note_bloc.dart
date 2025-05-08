import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:dog_journal_app/services/hive_service.dart';

part 'dog_note_bloc.freezed.dart';

@freezed
class DogNoteEvent with _$DogNoteEvent {
  const factory DogNoteEvent.add(DogNote note) = AddNote;
  const factory DogNoteEvent.load() = LoadNotes;
  const factory DogNoteEvent.update(DogNote note) = UpdateNote;
  const factory DogNoteEvent.delete(DogNote note) = DeleteNote;

}

@freezed
class DogNoteState with _$DogNoteState {
  const factory DogNoteState.initial() = _Initial;
  const factory DogNoteState.loading() = _Loading;
  const factory DogNoteState.loaded({required List<DogNote> notes}) = _Loaded;
  const factory DogNoteState.error(String message) = _Error;
}

class DogNoteBloc extends Bloc<DogNoteEvent, DogNoteState> {
  final Box<DogNote> notesBox;

  DogNoteBloc(this.notesBox) : super(const DogNoteState.initial()) {
    on<AddNote>(_onAddNote);
    on<LoadNotes>(_onLoadNotes);
    on<UpdateNote>(_onUpdateNote);
    on<DeleteNote>(_onDeleteNote);

  }

  Future<void> _onAddNote(AddNote event, Emitter<DogNoteState> emit) async {
    try {
      await notesBox.add(event.note);
      add(const DogNoteEvent.load());
    } catch (e) {
      emit(DogNoteState.error(e.toString()));
    }
  }

  Future<void> _onLoadNotes(LoadNotes event, Emitter<DogNoteState> emit) async {
    try {
      emit(DogNoteState.loading());
      final notes = notesBox.values.toList();
      emit(DogNoteState.loaded(notes: notes));
    } catch (e) {
      emit(DogNoteState.error(e.toString()));
    }
  }
  Future<void> _onUpdateNote(UpdateNote event, Emitter<DogNoteState> emit) async {
    try {
      final index = notesBox.values.toList().indexWhere((n) => n.id == event.note.id);
      if (index != -1) {
        await notesBox.putAt(index, event.note);
        add(const DogNoteEvent.load());
      } else {
        emit(const DogNoteState.error('Note not found for update.'));
      }
    } catch (e) {
      emit(DogNoteState.error(e.toString()));
    }
  }
  Future<void>_onDeleteNote(DeleteNote event, Emitter<DogNoteState> emit) async {
  try {
  await event.note.delete();
  add(const DogNoteEvent.load());
  } catch (e) {
  emit(DogNoteState.error(e.toString()));
  }
  }
}

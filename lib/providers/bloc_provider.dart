
import 'package:dog_journal_app/ui/bloc/dog_note_bloc.dart';
import 'package:dog_journal_app/services/hive_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final blocProvider = [
  BlocProvider<DogNoteBloc>(
    create:
        (context) =>
        DogNoteBloc( context.read<HiveService>().notesBox)
      ..add( DogNoteEvent.load()),
  ),
];
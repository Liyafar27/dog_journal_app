import 'package:dog_journal_app/services/hive_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final repositoryProviders = [
  RepositoryProvider<HiveService>(create: (_) => HiveService()),
];

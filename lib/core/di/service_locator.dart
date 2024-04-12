import 'package:get_it/get_it.dart';
import 'package:interview_code/feature/meme_generator/data/repository/meme_repository_implementation.dart';
import 'package:interview_code/feature/meme_generator/domain/repository/meme_repository.dart';

final getIt = GetIt.instance;

void setupServices() {
  getIt.registerFactory<MemeRepository>(() => MemeRepositoryImp());

// Alternatively you could write it if you don't like global variables
}

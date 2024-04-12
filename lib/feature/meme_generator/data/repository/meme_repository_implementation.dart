import 'package:interview_code/feature/meme_generator/data/model/meme_model.dart';
import 'package:interview_code/feature/meme_generator/data/source/remote_source/remote_source.dart';

import '../../domain/repository/meme_repository.dart';

class MemeRepositoryImp extends MemeRepository {
  final RemoteSource _remoteSource;

  MemeRepositoryImp() : _remoteSource = RemoteSourceImplementation();

  @override
  Future<MemeModel> getAllMemeData() async {
    return await _remoteSource.getAllMeme();
  }

  @override
  Future<MemeModel> getSearchedMemeData(String serchQuery) async {
    return await _remoteSource.getSearchedMeme(serchQuery);
  }
}

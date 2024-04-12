import '../../data/model/meme_model.dart';

abstract class MemeRepository {
  Future<MemeModel> getAllMemeData();
  Future<MemeModel> getSearchedMemeData(String serchQuery);
}

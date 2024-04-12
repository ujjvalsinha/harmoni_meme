import 'package:dio/dio.dart';
import 'package:interview_code/core/constants/constants.dart';

import '../../model/meme_model.dart';

// Define Abstract class
abstract class RemoteSource {
  Future<MemeModel> getAllMeme();
  Future<MemeModel> getSearchedMeme(String searchQuery);
}

class RemoteSourceImplementation implements RemoteSource {
  final Dio dio = Dio();

  @override
  Future<MemeModel> getAllMeme() async {
    String url = Constants.trendingMemeUrl;
    try {
      final Response response = await dio.get(url);
      if (response.statusCode == 200) {
        MemeModel model = MemeModel.fromJson(response.data);
        return model;
      } else {
        throw Exception();
      }
    } catch (e) {
      // You can throw your custom Exception here
      throw Exception();
    }
  }

  @override
  Future<MemeModel> getSearchedMeme(String searchQuery) async {
    String url = "${Constants.memeSerchUrl}$searchQuery";
    try {
      final Response response = await dio.get(url);
      if (response.statusCode == 200) {
        MemeModel model = MemeModel.fromJson(response.data);
        return model;
      } else {
        throw Exception();
      }
    } catch (e) {
      // You can throw your custom Exception here
      throw Exception();
    }
  }
}

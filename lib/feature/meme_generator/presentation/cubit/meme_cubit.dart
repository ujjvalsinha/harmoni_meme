import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_code/feature/meme_generator/domain/repository/meme_repository.dart';
import 'package:interview_code/feature/meme_generator/presentation/cubit/meme_state.dart';

class MemeCubit extends Cubit<MemeState> {
  final MemeRepository repository;
  MemeCubit(this.repository) : super(MemeInitial()) {
    getAllGiphyData();
  }

  Future<void> getAllGiphyData() async {
    try {
      emit(MemeLoading());
      final model = await repository.getAllMemeData();
      emit(MemeLoaded(model: model));
    } catch (e) {
      emit(MemeError(message: "Something went wrong"));
    }
  }

  Future<void> getGiphyBySearch(String serchQuary) async {
    try {
      emit(MemeLoading());
      final model = await repository.getSearchedMemeData(serchQuary);
      emit(MemeLoaded(model: model));
    } catch (e) {
      emit(MemeError(message: "Something went wrong"));
    }
  }
}

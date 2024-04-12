import 'package:equatable/equatable.dart';

import '../../data/model/meme_model.dart';

abstract class MemeState extends Equatable {}

class MemeInitial extends MemeState {
  @override
  List<Object?> get props => [];
}

class MemeLoading extends MemeState {
  @override
  List<Object?> get props => [];
}

class MemeLoaded extends MemeState {
  final MemeModel model;

  MemeLoaded({required this.model});
  @override
  List<Object?> get props => [model];
}

class MemeError extends MemeState {
  final String message;

  MemeError({required this.message});

  @override
  List<Object?> get props => [message];
}

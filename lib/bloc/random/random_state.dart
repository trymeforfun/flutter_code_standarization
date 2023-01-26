part of 'random_bloc.dart';

@immutable
abstract class RandomState {}

class RandomInitial extends RandomState {}

class RandomSuccessState extends RandomState {
  RandomResponseEntity response;

  RandomSuccessState(this.response);

  List<Object> get props => [response];
}

class RandomLoadingState extends RandomState {
  List<Object> get props => [];
}

class RandomFailedState extends RandomState {}

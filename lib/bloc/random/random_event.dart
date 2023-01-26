part of 'random_bloc.dart';

@immutable
abstract class RandomEvent extends Equatable {}

class GetRandomDataEvent extends RandomEvent {
  @override
  List<Object> get props => [];
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_code_standardization/data/repository/random_repository.dart';
import 'package:flutter_code_standardization/model/response/random_response_entity.dart';
import 'package:meta/meta.dart';

part 'random_event.dart';
part 'random_state.dart';

class RandomBloc extends Bloc<RandomEvent, RandomState> {
  RandomBloc() : super(RandomInitial()) {
    var randomRepository = RandomRespository();
    // print(this.state);
    on<GetRandomDataEvent>((event, emit) async {
      emit(RandomLoadingState());

      var response = await randomRepository.getRandomImage();
      print(response);
      print("state disini $state");
      emit(RandomSuccessState(response!));
    });
  }
}

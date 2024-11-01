import 'package:bloc_annotations/bloc_annotations.dart';
import 'package:bloc/bloc.dart';
import 'package:example/core/error/failure.dart';
import 'package:example/trivia/domain/entities/trivia.dart';
import 'package:meta/meta.dart';

import '../../domain/use_cases/get_list_trivia.dart';
part 'get_trivia_bloc.g.dart';

@fastBloc
abstract class GetTrivia{
  //multi event in here
  late int GetTriviaDataEvent;
  /* can add more */
  //usecase have the same size with event
  late GetListTriviaUseCase getListTriviaUseCase;
  //stateparam
  late Failure errorState;
  late List<Trivia> successState;

}


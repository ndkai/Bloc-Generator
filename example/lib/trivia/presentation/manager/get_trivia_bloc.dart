import 'package:bloc/bloc.dart';
import 'package:example/core/error/failure.dart';
import 'package:example/trivia/domain/entities/trivia.dart';
import 'package:example/trivia/domain/use_cases/delete_trivia.dart';
import 'package:fast_bloc_annotations/bloc_annotations.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import '../../domain/use_cases/get_list_trivia.dart';
part 'get_trivia_bloc.g.dart';


@FastBloc(useInjectable: true)
abstract class GetTrivia{
  late Failure errorState;
  late List<Trivia> successState;

  GetListTriviaUseCase GetTriviaDataEvent(int value);
  DeleteTriviaUseCase DeleteTriviaDataEvent(int value);
}


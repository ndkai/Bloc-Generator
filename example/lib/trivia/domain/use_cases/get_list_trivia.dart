import 'package:either_dart/either.dart';
import 'package:example/trivia/data/repositories/trivia_repo_impl.dart';
import 'package:example/trivia/domain/entities/trivia.dart';
import 'package:injectable/injectable.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/usecase.dart';
import '../repositories/trivia_repo.dart';
@injectable
class GetListTriviaUseCase implements UseCase<List<Trivia>, int>{
  final TriviaRepo repo;

  GetListTriviaUseCase(this.repo);
  @factoryMethod
  @override
  Future<Either<Failure, List<Trivia>>> call(int params) {
    return repo.getListTrivia(params);
  }
}
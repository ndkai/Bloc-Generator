import 'package:either_dart/either.dart';
import 'package:example/trivia/data/repositories/trivia_repo_impl.dart';
import 'package:example/trivia/domain/entities/trivia.dart';
import 'package:injectable/injectable.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecases/usecase.dart';
import '../repositories/trivia_repo.dart';

@injectable
class DeleteTriviaUseCase implements UseCase<List<Trivia>, int>{
  final TriviaRepo repo;

  DeleteTriviaUseCase(this.repo);
  @factoryMethod
  @override
  Future<Either<Failure, List<Trivia>>> call(@factoryParam int params) {
    return repo.getListTrivia(params);
  }
}
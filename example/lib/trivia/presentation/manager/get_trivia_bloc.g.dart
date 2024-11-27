// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_trivia_bloc.dart';

// **************************************************************************
// BlocGenerator
// **************************************************************************

// Bloc generation
@injectable
class GetTriviaBloc extends Bloc<GetTriviaEvent, GetTriviaState> {
  final GetListTriviaUseCase getListTriviaUseCase;
  final DeleteTriviaUseCase deleteTriviaUseCase;
  GetTriviaBloc(
    this.getListTriviaUseCase,
    this.deleteTriviaUseCase,
  ) : super(GetTriviaInitial()) {
    on<GetTriviaDataEvent>(_doGetTriviaDataEvent);
    on<DeleteTriviaDataEvent>(_doDeleteTriviaDataEvent);
  }
  @factoryMethod
  void _doGetTriviaDataEvent(
      GetTriviaDataEvent event, Emitter<GetTriviaState> emit) async {
    emit(GetTriviaLoading());
    var result = await getListTriviaUseCase(event.param);
    return emit(
        result.fold((l) => GetTriviaError(l), (r) => GetTriviaSuccess(r)));
  }

  @factoryMethod
  void _doDeleteTriviaDataEvent(
      DeleteTriviaDataEvent event, Emitter<GetTriviaState> emit) async {
    emit(GetTriviaLoading());
    var result = await deleteTriviaUseCase(event.param);
    return emit(
        result.fold((l) => GetTriviaError(l), (r) => GetTriviaSuccess(r)));
  }
}

// Event generation
@immutable
sealed class GetTriviaEvent {}

class GetTriviaDataEvent extends GetTriviaEvent {
  final int param;
  GetTriviaDataEvent(this.param);
}

class DeleteTriviaDataEvent extends GetTriviaEvent {
  final int param;
  DeleteTriviaDataEvent(this.param);
}

// State generation
@immutable
sealed class GetTriviaState {}

final class GetTriviaInitial extends GetTriviaState {}

final class GetTriviaLoading extends GetTriviaState {}

final class GetTriviaError extends GetTriviaState {
  final Failure data;
  GetTriviaError(this.data);
}

final class GetTriviaSuccess extends GetTriviaState {
  final List<Trivia> data;
  GetTriviaSuccess(this.data);
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_trivia_bloc.dart';

// **************************************************************************
// BlocGenerator
// **************************************************************************

// Bloc generation
class GetTriviaBloc extends Bloc<GetTriviaEvent, GetTriviaState> {
  final GetListTriviaUseCase getListTriviaUseCase;
  GetTriviaBloc(
    this.getListTriviaUseCase,
  ) : super(GetTriviaInitial()) {
    on<GetTriviaDataEvent>(_doGetTriviaDataEvent);
  }
  void _doGetTriviaDataEvent(
      GetTriviaDataEvent event, Emitter<GetTriviaState> emit) async {
    emit(GetTriviaLoading());
    var result = await getListTriviaUseCase(event.param);
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

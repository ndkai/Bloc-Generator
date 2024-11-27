// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../trivia/data/data_sources/remote_trivia_datasource.dart' as _i443;
import '../../trivia/data/repositories/trivia_repo_impl.dart' as _i408;
import '../../trivia/domain/repositories/trivia_repo.dart' as _i350;
import '../../trivia/domain/use_cases/delete_trivia.dart' as _i946;
import '../../trivia/domain/use_cases/get_list_trivia.dart' as _i62;
import '../../trivia/presentation/manager/get_trivia_bloc.dart' as _i787;
import 'modules.dart' as _i738;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio);
    gh.factory<_i443.RemoteTriviaDatasource>(
        () => _i443.RemoteTriviaDatasourceImpl());
    gh.factory<_i350.TriviaRepo>(
        () => _i408.TriviaRepoImpl(gh<_i443.RemoteTriviaDatasource>()));
    gh.factory<_i946.DeleteTriviaUseCase>(
        () => _i946.DeleteTriviaUseCase(gh<_i350.TriviaRepo>()));
    gh.factory<_i62.GetListTriviaUseCase>(
        () => _i62.GetListTriviaUseCase(gh<_i350.TriviaRepo>()));
    gh.factory<_i787.GetTriviaBloc>(() => _i787.GetTriviaBloc(
          gh<_i62.GetListTriviaUseCase>(),
          gh<_i946.DeleteTriviaUseCase>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i738.RegisterModule {}

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_task/home/data/data_source/remote/items_remote_data_source.dart'
    as _i964;
import 'package:flutter_task/home/data/repositories/trip_repository_impl.dart'
    as _i675;
import 'package:flutter_task/home/domain/repositories/trip_repository.dart'
    as _i86;
import 'package:flutter_task/home/domain/use_cases/get_trips_use_case.dart'
    as _i650;
import 'package:flutter_task/home/presentation/cubits/get_trips_cubit.dart'
    as _i316;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

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
    gh.lazySingleton<_i964.ItemsRemoteDataSource>(
        () => _i964.ItemsRemoteDataSourceImpl());
    gh.lazySingleton<_i86.TripRepository>(() =>
        _i675.TripRepositoryImpl(remote: gh<_i964.ItemsRemoteDataSource>()));
    gh.lazySingleton<_i650.GetTripsUseCase>(
        () => _i650.GetTripsUseCase(repository: gh<_i86.TripRepository>()));
    gh.factory<_i316.GetTripsCubit>(
        () => _i316.GetTripsCubit(gh<_i650.GetTripsUseCase>()));
    return this;
  }
}

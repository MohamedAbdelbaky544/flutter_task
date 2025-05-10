import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/core/domain/use_case/use_case.dart';
import 'package:flutter_task/core/presentation/blocs/base_state.dart';
import 'package:flutter_task/home/domain/entities/trip.dart';
import 'package:flutter_task/home/domain/use_cases/get_trips_use_case.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetTripsCubit extends Cubit<BaseState<List<Trip>>> {
  final GetTripsUseCase useCase;
  GetTripsCubit(this.useCase) : super(const BaseState());

  void getTripsMethod() async {
    emit(state.setInProgressState());
    final result = await useCase.call(const NoParams());

    result.fold((failure) => emit(state.setFailureState(failure)),
        (trips) => emit(state.setSuccessState(trips)));
  }
}

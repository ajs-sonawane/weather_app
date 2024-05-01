import 'package:bloc/bloc.dart';
import 'package:weather_app/features/current_weather/data/repo/current_weather_repo.dart';
import 'package:weather_app/features/current_weather/presentation/bloc/cw_events.dart';
import 'package:weather_app/features/current_weather/presentation/bloc/cw_states.dart';

class CurrentWeatherBloc
    extends Bloc<CurrentWeatherEvent, CurrentWeatherState> {
  final CurrentWeatherRepository repository = CurrentWeatherRepository();

  CurrentWeatherBloc() : super(const CurrentWeatherState()) {
    on<FetchCurrentWeatherCondition>(_getWeatherConditionsOnPlace);
  }

  _getWeatherConditionsOnPlace(FetchCurrentWeatherCondition event,
      Emitter<CurrentWeatherState> emit) async {
    emit(state.copyWith(status: CurrentWeatherStatus.loading));

    await repository.currentWeatherRepo(event.location).then((value) {
      emit(state.copyWith(status: CurrentWeatherStatus.success, resp: value));
    }).onError((error, stackTrace) {
      emit(state.copyWith(
          status: CurrentWeatherStatus.failure, message: error.toString()));
    });
  }
}

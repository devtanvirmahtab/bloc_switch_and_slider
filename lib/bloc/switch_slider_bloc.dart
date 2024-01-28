import 'package:bloc_switch_and_slider/bloc/switch_slider_event.dart';
import 'package:bloc_switch_and_slider/bloc/switch_slider_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchSliderBloc extends Bloc<SwitchSliderEvent, SwitchSliderState> {
  SwitchSliderBloc() : super(SwitchSliderState()) {
    on<EnableDisableSwitch>(_enableSwitch);
    on<SliderEvents>(_sliderBloc);
  }

  void _enableSwitch(SwitchSliderEvent event, Emitter<SwitchSliderState> emit) {
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }

  void _sliderBloc(SliderEvents events, Emitter<SwitchSliderState> emit) {
    emit(state.copyWith(slider: events.slider));
  }
}

import 'package:equatable/equatable.dart';

abstract class SwitchSliderEvent extends Equatable {
  const SwitchSliderEvent();

  @override
  List<Object> get props => [];
}

class EnableDisableSwitch extends SwitchSliderEvent {}

class SliderEvents extends SwitchSliderEvent {
  double slider;
  SliderEvents({required this.slider});

  @override
  List<Object> get props => [slider];
}

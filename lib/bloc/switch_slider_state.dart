import 'package:equatable/equatable.dart';

class SwitchSliderState extends  Equatable{
  bool isSwitch;
  SwitchSliderState({this.isSwitch =  false});

  SwitchSliderState copyWith({bool? isSwitch}){
    return SwitchSliderState(
      isSwitch: isSwitch ?? this.isSwitch,
    );
}

  @override
  List<Object?> get props => [isSwitch];
}
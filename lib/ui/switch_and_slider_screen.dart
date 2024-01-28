import 'package:bloc_switch_and_slider/bloc/switch_slider_bloc.dart';
import 'package:bloc_switch_and_slider/bloc/switch_slider_event.dart';
import 'package:bloc_switch_and_slider/bloc/switch_slider_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchAndSliderScreen extends StatelessWidget {
  const SwitchAndSliderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Switch And Slider"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<SwitchSliderBloc, SwitchSliderState>(
              buildWhen: (previous,current) => previous.isSwitch != current.isSwitch,
              builder: (BuildContext context, state) {
                print("switch");
                return Switch(
                  value: state.isSwitch,
                  onChanged: (value) {
                    context.read<SwitchSliderBloc>().add(EnableDisableSwitch());
                  },
                );
              },
            ),
            const SizedBox(
              height: 30,
            ),
            BlocBuilder<SwitchSliderBloc, SwitchSliderState>(
              buildWhen: (previous,current) => previous.slider != current.slider,
              builder: (context, state) {
                print("slider");
                return Container(
                  width: double.infinity,
                  height: 200,
                  color: Colors.green.withOpacity(state.slider),
                );
              },
            ),
            Container(
              width: double.infinity,
              height: 200,
              color: Colors.green.withOpacity(0.5),
            ),
            const SizedBox(
              height: 30,
            ),
            BlocBuilder<SwitchSliderBloc, SwitchSliderState>(
              builder: (context, state) {
                return Slider(
                  value: state.slider,
                  onChanged: (value) {
                    context.read<SwitchSliderBloc>().add(SliderEvents(slider: value));
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

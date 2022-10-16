import 'package:flutter/material.dart';

import 'package:mega_store/shared/hex_colors.dart';
import 'package:mega_store/shared/responsive.dart';

class MyStepper extends StatefulWidget {
  const MyStepper({super.key});

  @override
  State<MyStepper> createState() => _MyStepperState();
}

int current = 0;

class _MyStepperState extends State<MyStepper> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: rheight(context) / 7,
      child: Theme(
        data: ThemeData(
            colorScheme: ColorScheme.light(primary: HexColor('#087DA9'))),
        child: Stepper(
          elevation: 0,
          physics: BouncingScrollPhysics(),
          controlsBuilder: (context, details) {
            return Container();
          },
          type: StepperType.horizontal,
          currentStep: current,
          steps: [
            Step(
              label: Text('Packing'),
              title: Text(''),
              content: SizedBox(),
              state: StepState.complete,
              isActive: current >= 0 ? true : false,
            ),
            Step(
              title: Text(''),
              content: SizedBox(),
              label: Text('Shipping'),
              state: StepState.complete,
              isActive: current >= 1 ? true : false,
            ),
            Step(
              title: Text(''),
              content: SizedBox(),
              label: Text('Arriving'),
              state: StepState.complete,
              isActive: current >= 2 ? true : false,
            ),
            Step(
              title: Text(''),
              content: SizedBox(),
              label: Text('Success'),
              state: StepState.complete,
              isActive: current >= 3 ? true : false,
            ),
          ],
          onStepTapped: (value) {
            setState(() {
              current = value;
              print(current);
            });
          },
        ),
      ),
    );
  }
}

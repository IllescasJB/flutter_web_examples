import 'package:bases_flutter_web/ui/share/custom_app_menu.dart';
import 'package:bases_flutter_web/ui/share/custom_flat_button.dart';
import 'package:flutter/material.dart';

class CounterView extends StatefulWidget {
  @override
  _CounterViewState createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(),
        Text(
          'Stateful Counter',
          style: TextStyle(fontSize: 20),
        ),
        FittedBox(
          fit: BoxFit.contain,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              'Counter: $counter',
              style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomFlatButton(
              text: 'Increment',
              onPressed: () => setState(() => counter++),
            ),
            CustomFlatButton(
              text: 'Decrement',
              onPressed: () => setState(() => counter--),
            ),
          ],
        ),
        Spacer(),
      ],
    );
  }
}

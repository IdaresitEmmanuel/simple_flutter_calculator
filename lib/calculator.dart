import 'package:flutter/material.dart';
import 'package:simple_calculator/widgets/keypad.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final subTextController = TextEditingController();
  final mainTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF800000).withOpacity(.1),
        body: SafeArea(
            child: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              Flexible(
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 30.0),
                  constraints: const BoxConstraints(maxWidth: 350),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Text("26666*19=",
                          style: TextStyle(fontSize: 20.0, color: Colors.grey)),
                      Text(
                        "506, 654",
                        style: TextStyle(fontSize: 60.0),
                      )
                    ],
                  ),
                ),
              ),
              const KeyPad()
            ],
          ),
        )),
      ),
    );
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';
import 'package:simple_calculator/widgets/keypad.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final ValueNotifier<String> textNotifier = ValueNotifier<String>("");
  bool shouldEquate = false;
  String calculate(String input, bool showError) {
    if (input.isEmpty) return "";
    String expression = input;
    if (input.substring(input.length - 1) == "+" ||
        input.substring(input.length - 1) == "-") {
      expression += "0";
    } else if (input.substring(input.length - 1) == "/" ||
        input.substring(input.length - 1) == "*" ||
        input.substring(input.length - 1) == "^") {
      expression += "1";
      // this is to avoid having /0 which is infinity instead /1 which is the same thing
    }
    try {
      return expression.interpret().toString();
    } catch (e) {
      log("bad expression", error: e);
      return showError ? "Bad Expression" : "";
    }
  }

  equate(bool shouldEquate) {
    this.shouldEquate = shouldEquate;
    if (shouldEquate) {
      textNotifier.value = calculate(textNotifier.value, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFDACDCD),
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
                  child: ValueListenableBuilder(
                      valueListenable: textNotifier,
                      builder: (context, String text, Widget? child) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              text.isNotEmpty ? text : "0",
                              style: const TextStyle(fontSize: 60.0),
                            ),
                            Text(shouldEquate ? "" : calculate(text, false),
                                style: const TextStyle(
                                    fontSize: 20.0, color: Colors.grey)),
                          ],
                        );
                      }),
                ),
              ),
              KeyPad(textNotifier: textNotifier, equate: equate)
            ],
          ),
        )),
      ),
    );
  }
}

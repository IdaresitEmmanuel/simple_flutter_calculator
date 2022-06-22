import 'package:flutter/material.dart';
import 'package:simple_calculator/constants/enums.dart';
import 'package:simple_calculator/widgets/button.dart';
// import 'package:function_tree/function_tree.dart';

class KeyPad extends StatefulWidget {
  const KeyPad({Key? key, required this.textNotifier, required this.equate})
      : super(key: key);
  final ValueNotifier<String> textNotifier;
  final Function(bool shouldEquate) equate;
  @override
  State<KeyPad> createState() => _KeyPadState();
}

class _KeyPadState extends State<KeyPad> {
  var lightRed = const Color(0xFFC69F9F);
  var deepRed = const Color(0xFFA85B5B);
  addNumberToExpression(String input) {
    widget.textNotifier.value += input;
    widget.equate(false);
  }

  addSymbolsToExpression(String input) {
    widget.equate(false);
    var expression = widget.textNotifier.value;
    switch (input) {
      case ".":
        {
          List<String> list = expression.split(RegExp(r'[0-9]'));
          String newExpression = "";
          for (var i = 0; i < list.length; i++) {
            newExpression += list[i];
          }
          if (expression.isEmpty || newExpression.isEmpty) {
            widget.textNotifier.value += input;
            break;
          } else if (newExpression.substring(newExpression.length - 1) != ".") {
            widget.textNotifier.value += input;
          }
        }
        break;
      case "+":
        {
          if (expression.isEmpty) break;
          if (RegExp(r'[0-9]')
              .hasMatch(expression.substring(expression.length - 1))) {
            widget.textNotifier.value += input;
          } else {
            replaceLastExpressionChar(input);
          }
        }
        break;
      case "-":
        {
          if (expression.isEmpty) {
            widget.textNotifier.value += input;
            break;
          }
          if (expression.substring(expression.length - 1) == "+") {
            replaceLastExpressionChar(input);
            break;
          }
          if (expression.substring(expression.length - 1) != "-") {
            widget.textNotifier.value += input;
          }
        }
        break;
      case "*":
        {
          if (expression.isEmpty) break;
          if (expression == "-") {
            widget.textNotifier.value = "";
            break;
          }
          if (expression.length >= 2) {
            if (expression.substring(expression.length - 2) == "*-" ||
                expression.substring(expression.length - 2) == "/-") {
              replaceLastTwoChar(input);
              break;
            }
          }
          if (RegExp(r'[0-9]')
              .hasMatch(expression.substring(expression.length - 1))) {
            widget.textNotifier.value += input;
            break;
          } else if (expression.substring(expression.length - 0) != "*") {
            replaceLastExpressionChar(input);
          }
        }
        break;
      case "/":
        {
          if (expression.isEmpty) break;
          if (expression == "-") {
            widget.textNotifier.value = "";
            break;
          }
          if (expression.length >= 2) {
            if (expression.substring(expression.length - 2) == "*-" ||
                expression.substring(expression.length - 2) == "/-") {
              replaceLastTwoChar(input);
              break;
            }
          }
          if (RegExp(r'[0-9]')
              .hasMatch(expression.substring(expression.length - 1))) {
            widget.textNotifier.value += input;
            break;
          } else if (expression.substring(expression.length - 1) != "/") {
            replaceLastExpressionChar(input);
          }
        }
        break;
      case "^":
        {
          if (expression.isEmpty) break;
          if (expression == "-") {
            widget.textNotifier.value = "";
            break;
          }
          if (expression.length >= 2) {
            if (expression.substring(expression.length - 2) == "*-" ||
                expression.substring(expression.length - 2) == "/-" ||
                expression.substring(expression.length - 2) == "^-") {
              replaceLastTwoChar(input);
              break;
            }
          }
          if (RegExp(r'[0-9]')
              .hasMatch(expression.substring(expression.length - 1))) {
            widget.textNotifier.value += input;
            break;
          } else if (expression.substring(expression.length - 1) != "^") {
            replaceLastExpressionChar(input);
          }
        }
        break;
    }
  }

  replaceLastExpressionChar(String input) {
    var expression = widget.textNotifier.value;
    if (expression.isNotEmpty) {
      widget.textNotifier.value =
          expression.substring(0, expression.length - 1);
      widget.textNotifier.value += input;
    }
  }

  replaceLastTwoChar(String input) {
    var expression = widget.textNotifier.value;
    if (expression.isNotEmpty) {
      widget.textNotifier.value =
          expression.substring(0, expression.length - 2);
      widget.textNotifier.value += input;
    }
  }

  clearExpression() {
    widget.equate(false);
    widget.textNotifier.value = "";
  }

  backSpace() {
    var expression = widget.textNotifier.value;
    if (expression.isNotEmpty) {
      widget.textNotifier.value =
          expression.substring(0, expression.length - 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    double spacing = 6;
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(horizontal: 30.0),
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        children: [
          Container(
            constraints: const BoxConstraints(maxWidth: 350),
            child: LayoutBuilder(builder: (context, constraints) {
              double size = (constraints.maxWidth / 4) - spacing;
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  KeyButtons(
                    height: size,
                    width: size,
                    symbol: "C",
                    actionType: ActionType.operator,
                    onTap: () => clearExpression(),
                  ),
                  KeyButtons(
                    height: size,
                    width: size,
                    symbol: "<--",
                    actionType: ActionType.operator,
                    onTap: () => backSpace(),
                    onLongPress: () => clearExpression(),
                  ),
                  KeyButtons(
                    height: size,
                    width: size,
                    symbol: "^",
                    actionType: ActionType.operator,
                    onTap: () => addSymbolsToExpression("^"),
                  ),
                  KeyButtons(
                    height: size,
                    width: size,
                    symbol: "/",
                    actionType: ActionType.operator,
                    onTap: () => addSymbolsToExpression("/"),
                  ),
                ],
              );
            }),
          ),
          const SizedBox(height: 10.0),
          Container(
            constraints: const BoxConstraints(maxWidth: 350.0),
            child: LayoutBuilder(builder: (context, constraints) {
              double size = (constraints.maxWidth / 4) - spacing;
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  KeyButtons(
                    height: size,
                    width: size,
                    symbol: "7",
                    onTap: () => addNumberToExpression("7"),
                  ),
                  KeyButtons(
                    height: size,
                    width: size,
                    symbol: "8",
                    onTap: () => addNumberToExpression("8"),
                  ),
                  KeyButtons(
                    height: size,
                    width: size,
                    symbol: "9",
                    onTap: () => addNumberToExpression("9"),
                  ),
                  KeyButtons(
                    height: size,
                    width: size,
                    symbol: "*",
                    actionType: ActionType.operator,
                    onTap: () => addSymbolsToExpression("*"),
                  ),
                ],
              );
            }),
          ),
          const SizedBox(height: 10.0),
          Container(
            constraints: const BoxConstraints(maxWidth: 350.0),
            child: LayoutBuilder(builder: (context, constraints) {
              double size = (constraints.maxWidth / 4) - spacing;
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  KeyButtons(
                    height: size,
                    width: size,
                    symbol: "4",
                    onTap: () => addNumberToExpression("4"),
                  ),
                  KeyButtons(
                    height: size,
                    width: size,
                    symbol: "5",
                    onTap: () => addNumberToExpression("5"),
                  ),
                  KeyButtons(
                    height: size,
                    width: size,
                    symbol: "6",
                    onTap: () => addNumberToExpression("6"),
                  ),
                  KeyButtons(
                    height: size,
                    width: size,
                    symbol: "-",
                    actionType: ActionType.operator,
                    onTap: () => addSymbolsToExpression("-"),
                  ),
                ],
              );
            }),
          ),
          const SizedBox(height: 10.0),
          Container(
            constraints: const BoxConstraints(maxWidth: 350.0),
            child: LayoutBuilder(builder: (context, constraints) {
              double size = (constraints.maxWidth / 4) - spacing;
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  KeyButtons(
                    height: size,
                    width: size,
                    symbol: "1",
                    onTap: () => addNumberToExpression("1"),
                  ),
                  KeyButtons(
                    height: size,
                    width: size,
                    symbol: "2",
                    onTap: () => addNumberToExpression("2"),
                  ),
                  KeyButtons(
                    height: size,
                    width: size,
                    symbol: "3",
                    onTap: () => addNumberToExpression("3"),
                  ),
                  KeyButtons(
                    height: size,
                    width: size,
                    symbol: "+",
                    actionType: ActionType.operator,
                    onTap: () => addSymbolsToExpression("+"),
                  ),
                ],
              );
            }),
          ),
          const SizedBox(height: 10.0),
          Container(
            constraints: const BoxConstraints(maxWidth: 350.0),
            child: LayoutBuilder(builder: (context, constraints) {
              double size = (constraints.maxWidth / 4) - spacing;
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  KeyButtons(
                    height: size,
                    width: (size * 2) + 12,
                    symbol: "0",
                    onTap: () => addNumberToExpression("0"),
                  ),
                  KeyButtons(
                    height: size,
                    width: size,
                    symbol: ".",
                    onTap: () => addSymbolsToExpression("."),
                  ),
                  KeyButtons(
                    height: size,
                    width: size,
                    symbol: "=",
                    actionType: ActionType.operator,
                    onTap: () => widget.equate(true),
                  ),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}

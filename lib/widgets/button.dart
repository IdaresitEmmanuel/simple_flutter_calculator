import 'package:simple_calculator/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:simple_calculator/theme/colors.dart';

class KeyButtons extends StatefulWidget {
  const KeyButtons(
      {Key? key,
      required this.height,
      required this.width,
      required this.symbol,
      this.actionType = ActionType.figure,
      this.onTap,
      this.onLongPress})
      : super(key: key);
  final double height;
  final double width;
  final String symbol;
  final ActionType actionType;
  final Function()? onTap;
  final Function()? onLongPress;
  @override
  State<KeyButtons> createState() => _KeyButtonsState();
}

class _KeyButtonsState extends State<KeyButtons> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _sizeAnimation;

  @override
  void initState() {
    _controller = AnimationController(
        duration: const Duration(milliseconds: 50), vsync: this);

    _sizeAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(tween: Tween(begin: .94, end: 1), weight: 50),
    ]).animate(_controller);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          return GestureDetector(
            onTapDown: (TapDownDetails tapDownDetails) {
              _controller.forward();
            },
            onTapUp: (TapUpDetails tapUpDetails) {
              _controller.reverse();
            },
            onTapCancel: () => _controller.reverse(),
            onTap: widget.onTap,
            onLongPress: widget.onLongPress,
            child: Container(
              constraints: BoxConstraints(
                  maxWidth: widget.width, maxHeight: widget.height),
              child: Transform.scale(
                scale: _sizeAnimation.value,
                child: Container(
                  constraints: BoxConstraints(
                      maxWidth: widget.width, maxHeight: widget.height),
                  decoration: BoxDecoration(
                      color: widget.actionType == ActionType.figure
                          ? AppColors.lightRed
                          : AppColors.deepRed,
                      borderRadius: BorderRadius.circular(widget.height / 5)),
                  child: Center(
                    child: Text(
                      widget.symbol,
                      style: TextStyle(
                          color: widget.actionType == ActionType.figure
                              ? Colors.black
                              : Colors.white,
                          fontSize: 20.0),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}

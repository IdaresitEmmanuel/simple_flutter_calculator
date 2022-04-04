import 'package:flutter/material.dart';
// import 'package:function_tree/function_tree.dart';

class KeyPad extends StatefulWidget {
  const KeyPad({Key? key}) : super(key: key);

  @override
  State<KeyPad> createState() => _KeyPadState();
}

class _KeyPadState extends State<KeyPad> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30.0),
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        children: [
          Container(
            constraints: const BoxConstraints(maxWidth: 350),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                GestureDetector(
                  onTap: () {
                    // var expression = "4 + 5";
                    // print(expression.interpret());
                  },
                  child: Container(
                    constraints:
                        const BoxConstraints(maxWidth: 80, maxHeight: 80),
                    decoration: BoxDecoration(
                        color: const Color(0xFF800000).withOpacity(.6),
                        borderRadius: BorderRadius.circular(20.0)),
                    child: const Center(
                      child: Text(
                        "CE",
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                      ),
                    ),
                  ),
                ),
                Container(
                  constraints:
                      const BoxConstraints(maxWidth: 80, maxHeight: 80),
                  decoration: BoxDecoration(
                      color: const Color(0xFF800000).withOpacity(.6),
                      borderRadius: BorderRadius.circular(20.0)),
                  child: const Center(
                    child: Text(
                      "C",
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                  ),
                ),
                Container(
                  // height: 80,
                  // width: 80,
                  constraints:
                      const BoxConstraints(maxWidth: 80, maxHeight: 80),
                  decoration: BoxDecoration(
                      color: const Color(0xFF800000).withOpacity(.6),
                      borderRadius: BorderRadius.circular(20.0)),
                  child: const Center(
                    child: Text(
                      "<--",
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                  ),
                ),
                Container(
                  // height: 80,
                  // width: 80,
                  constraints:
                      const BoxConstraints(maxWidth: 80, maxHeight: 80),
                  decoration: BoxDecoration(
                      color: const Color(0xFF800000).withOpacity(.6),
                      borderRadius: BorderRadius.circular(20.0)),
                  child: const Center(
                    child: Text(
                      "/",
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10.0),
          Container(
            constraints: const BoxConstraints(maxWidth: 350.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  // height: 80,
                  // width: 80,
                  constraints:
                      const BoxConstraints(maxWidth: 80, maxHeight: 80),
                  decoration: BoxDecoration(
                      color: const Color(0xFF800000).withOpacity(.3),
                      borderRadius: BorderRadius.circular(20.0)),
                  child: const Center(
                    child: Text(
                      "7",
                      style: TextStyle(color: Colors.black, fontSize: 20.0),
                    ),
                  ),
                ),
                Container(
                  // height: 80,
                  // width: 80,
                  constraints:
                      const BoxConstraints(maxWidth: 80, maxHeight: 80),
                  decoration: BoxDecoration(
                      color: const Color(0xFF800000).withOpacity(.3),
                      borderRadius: BorderRadius.circular(20.0)),
                  child: const Center(
                    child: Text(
                      "8",
                      style: TextStyle(color: Colors.black, fontSize: 20.0),
                    ),
                  ),
                ),
                Container(
                  // height: 80,
                  // width: 80,
                  constraints:
                      const BoxConstraints(maxWidth: 80, maxHeight: 80),
                  decoration: BoxDecoration(
                      color: const Color(0xFF800000).withOpacity(.3),
                      borderRadius: BorderRadius.circular(20.0)),
                  child: const Center(
                    child: Text(
                      "9",
                      style: TextStyle(color: Colors.black, fontSize: 20.0),
                    ),
                  ),
                ),
                Container(
                  // height: 80,
                  // width: 80,
                  constraints:
                      const BoxConstraints(maxWidth: 80, maxHeight: 80),
                  decoration: BoxDecoration(
                      color: const Color(0xFF800000).withOpacity(.6),
                      borderRadius: BorderRadius.circular(20.0)),
                  child: const Center(
                    child: Text(
                      "*",
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10.0),
          Container(
            constraints: const BoxConstraints(maxWidth: 350.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  // height: 80,
                  // width: 80,
                  constraints:
                      const BoxConstraints(maxWidth: 80, maxHeight: 80),
                  decoration: BoxDecoration(
                      color: const Color(0xFF800000).withOpacity(.3),
                      borderRadius: BorderRadius.circular(20.0)),
                  child: const Center(
                    child: Text(
                      "4",
                      style: TextStyle(color: Colors.black, fontSize: 20.0),
                    ),
                  ),
                ),
                Container(
                  // height: 80,
                  // width: 80,
                  constraints:
                      const BoxConstraints(maxWidth: 80, maxHeight: 80),
                  decoration: BoxDecoration(
                      color: const Color(0xFF800000).withOpacity(.3),
                      borderRadius: BorderRadius.circular(20.0)),
                  child: const Center(
                    child: Text(
                      "5",
                      style: TextStyle(color: Colors.black, fontSize: 20.0),
                    ),
                  ),
                ),
                Container(
                  // height: 80,
                  // width: 80,
                  constraints:
                      const BoxConstraints(maxWidth: 80, maxHeight: 80),
                  decoration: BoxDecoration(
                      color: const Color(0xFF800000).withOpacity(.3),
                      borderRadius: BorderRadius.circular(20.0)),
                  child: const Center(
                    child: Text(
                      "6",
                      style: TextStyle(color: Colors.black, fontSize: 20.0),
                    ),
                  ),
                ),
                Container(
                  // height: 80,
                  // width: 80,
                  constraints:
                      const BoxConstraints(maxWidth: 80, maxHeight: 80),
                  decoration: BoxDecoration(
                      color: const Color(0xFF800000).withOpacity(.6),
                      borderRadius: BorderRadius.circular(20.0)),
                  child: const Center(
                    child: Text(
                      "-",
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10.0),
          Container(
            constraints: const BoxConstraints(maxWidth: 350.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  // height: 80,
                  // width: 80,
                  constraints:
                      const BoxConstraints(maxWidth: 80, maxHeight: 80),
                  decoration: BoxDecoration(
                      color: const Color(0xFF800000).withOpacity(.3),
                      borderRadius: BorderRadius.circular(20.0)),
                  child: const Center(
                    child: Text(
                      "1",
                      style: TextStyle(color: Colors.black, fontSize: 20.0),
                    ),
                  ),
                ),
                Container(
                  // height: 80,
                  // width: 80,
                  constraints:
                      const BoxConstraints(maxWidth: 80, maxHeight: 80),
                  decoration: BoxDecoration(
                      color: const Color(0xFF800000).withOpacity(.3),
                      borderRadius: BorderRadius.circular(20.0)),
                  child: const Center(
                    child: Text(
                      "2",
                      style: TextStyle(color: Colors.black, fontSize: 20.0),
                    ),
                  ),
                ),
                Container(
                  // height: 80,
                  // width: 80,
                  constraints:
                      const BoxConstraints(maxWidth: 80, maxHeight: 80),
                  decoration: BoxDecoration(
                      color: const Color(0xFF800000).withOpacity(.3),
                      borderRadius: BorderRadius.circular(20.0)),
                  child: const Center(
                    child: Text(
                      "3",
                      style: TextStyle(color: Colors.black, fontSize: 20.0),
                    ),
                  ),
                ),
                Container(
                  // height: 80,
                  // width: 80,
                  constraints:
                      const BoxConstraints(maxWidth: 80, maxHeight: 80),
                  decoration: BoxDecoration(
                      color: const Color(0xFF800000).withOpacity(.6),
                      borderRadius: BorderRadius.circular(20.0)),
                  child: const Center(
                    child: Text(
                      "+",
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10.0),
          Container(
            constraints: const BoxConstraints(maxWidth: 350.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  // height: 80,
                  // width: 80,
                  constraints:
                      const BoxConstraints(maxWidth: 170, maxHeight: 80),
                  decoration: BoxDecoration(
                      color: const Color(0xFF800000).withOpacity(.3),
                      borderRadius: BorderRadius.circular(20.0)),
                  child: const Center(
                    child: Text(
                      "0",
                      style: TextStyle(color: Colors.black, fontSize: 20.0),
                    ),
                  ),
                ),
                Container(
                  // height: 80,
                  // width: 80,
                  constraints:
                      const BoxConstraints(maxWidth: 80, maxHeight: 80),
                  decoration: BoxDecoration(
                      color: const Color(0xFF800000).withOpacity(.3),
                      borderRadius: BorderRadius.circular(20.0)),
                  child: const Center(
                    child: Text(
                      ".",
                      style: TextStyle(color: Colors.black, fontSize: 20.0),
                    ),
                  ),
                ),
                Container(
                  // height: 80,
                  // width: 80,
                  constraints:
                      const BoxConstraints(maxWidth: 80, maxHeight: 80),
                  decoration: BoxDecoration(
                      color: const Color(0xFF800000).withOpacity(.6),
                      borderRadius: BorderRadius.circular(20.0)),
                  child: const Center(
                    child: Text(
                      "=",
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

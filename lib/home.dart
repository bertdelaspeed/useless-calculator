import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String calcText = '', dob = '';
  int count = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff222520),
        body: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          SizedBox(
            height: size.height / 15,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    calcText,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 20),
                ],
              ),
            ),
          ),
          Container(
            height: size.height / 1.7,
            decoration: const BoxDecoration(
              color: Color(0xff2a2d36),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(50),
              ),
            ),
            child: Column(children: [
              Row(children: [
                blocks('AC', Colors.green),
                blocks('CC', Colors.green),
                blocks('%', Colors.green),
                blocks('/', Colors.red),
              ]),
              Row(children: [
                blocks('1'),
                blocks('2'),
                blocks('3'),
                blocks('x', Colors.red)
              ]),
              Row(children: [
                blocks('4'),
                blocks('5'),
                blocks('6'),
                blocks('-', Colors.red)
              ]),
              Row(children: [
                blocks('7'),
                blocks('8'),
                blocks('9'),
                blocks('+', Colors.red)
              ]),
              Row(children: [
                blocks(':'),
                blocks('0'),
                blocks('.'),
                blocks('=', count == 0 ? Colors.red : Colors.blue),
              ]),
            ]),
          ),
        ]),
      ),
    );
  }

  Widget blocks(String value, [Color? color]) {
    return GestureDetector(
      onTap: () {
        if (value == 'AC') {
          setState(() {
            calcText = '';
          });
        } else if (value == '=') {
          if (count == 0) {
            setState(() {
              dob = calcText;
              count += 1;
              calcText = '';
            });
          } else {
            setState(() {
              calcText = dob;
              count = 0;
            });
          }
        } else {
          setState(() {
            calcText += value;
          });
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 10, left: 8, right: 8),
        child: Container(
          height: 70,
          width: 70,
          decoration: const BoxDecoration(
            color: Color(0xff222520),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: Center(
            child: Text(
              value,
              style: TextStyle(
                  color: color ?? Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}

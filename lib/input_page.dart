import 'dart:math';
import 'package:flutter/material.dart';

var random = Random();

class InputPage extends StatefulWidget {
  const InputPage({Key? key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int? userinput;
  int score = 0;
  int n1 = random.nextInt(10);
  int n2 = random.nextInt(10);
  final TextEditingController _controller = TextEditingController();
  String? errorText;

  void comparing() {
    if (n1 * n2 == userinput) {
      setState(() {
        score++;
        errorText = null;
      });
    } else {
      setState(() {
        score--;
        errorText = "Incorrect answer";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 250),
            color: Color(0xffDEB887),
            height: 250.0,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Text(
                    "Score: $score",
                    textAlign: TextAlign.start,
                  ),
                ),
                Center(
                  child: Text(
                    "What is $n1 multiplied $n2",
                    style:
                        TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    controller: _controller,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      setState(() {
                        errorText = null;
                      });
                    },
                    decoration: InputDecoration(
                      errorText: errorText,
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  width: double.infinity,
                  child: MaterialButton(
                    onPressed: () {
                      setState(() {
                        userinput = int.tryParse(_controller.text);
                        if (userinput != null) {
                          comparing();
                          n2 = random.nextInt(10);
                          n1 = random.nextInt(10);
                          _controller.clear();
                        } else {
                          errorText = "Please enter a valid number";
                        }
                      });
                    },
                    color: Colors.green,
                    child: Text("Submit"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

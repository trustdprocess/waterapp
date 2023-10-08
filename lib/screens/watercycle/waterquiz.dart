import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:waterapp/homepage/homepage.dart';
import 'package:waterapp/screens/freshwater/freshwater.dart';

class watercyclequiz extends StatefulWidget {
  const watercyclequiz({Key? key});

  @override
  State<watercyclequiz> createState() => _watercyclequizState();
}

class _watercyclequizState extends State<watercyclequiz> {
  List<String> answers = [
    "Condensation",
    "Transpiration",
    "Vapourization/Evaporation",
    "Photosynthesis"
  ];

  bool _isCorrect = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Water Cycle Quiz"),
        elevation: 0,
      ),
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "The Process Of Conversion From Water To Vapor Is Called?",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: answers.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () async {
                      if (answers[index] == answers[2]) {
                        setState(() {
                          _isCorrect = true;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Correct Answer!"),
                          duration: Duration(seconds: 1),
                        ));

                        await Future.delayed(
                            Duration(seconds: 5)); // Wait for 5 seconds

                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => freshwater()));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Incorrect Answer!"),duration: Duration(seconds: 1),));
                      }
                    },
                    child: Container(
                      height: size.height * 0.05,
                      width: size.width * 0.3,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(16)),
                      child: Center(
                        child: Text(
                          answers[index],
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          if (_isCorrect)
            Align(
              alignment: Alignment.center,
              child: Lottie.asset(
                "assets/celebration.json",
                height: 300, // Adjust the height as needed
                width: 500, // Adjust the width as needed
              ),
            ),
        ],
      ),
    );
  }
}

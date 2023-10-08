import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:waterapp/homepage/homepage.dart';
import 'package:waterapp/screens/freshwater/freshwater.dart';
import 'package:waterapp/screens/globalwarming/warmingquiz.dart';

class solutionquiz extends StatefulWidget {
  const solutionquiz({Key? key});

  @override
  State<solutionquiz> createState() => _solutionquizState();
}

class _solutionquizState extends State<solutionquiz> {
  List<String> answers = [
    "Decreased sea levels",
    "Increased biodiversity",
    "Coral bleaching in oceans",
    "Longer and colder winters"
  ];

  bool _isCorrect = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Imapct Of Global Warming Quiz"),
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
              "Which of the following is an impact of global warming on ecosystems?",
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
                            MaterialPageRoute(builder: (_) => globalwarming()));
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

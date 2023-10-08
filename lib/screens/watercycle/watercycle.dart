import 'package:flutter/material.dart';
import 'package:waterapp/screens/watercycle/waterquiz.dart';
import 'package:video_player/video_player.dart';

class watercycle extends StatefulWidget {
  const watercycle({Key? key});

  @override
  State<watercycle> createState() => _watercycleState();
}

class _watercycleState extends State<watercycle> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset("assets/watersystem.mp4")
      ..initialize().then((_) {
        setState(() {
          _controller.setLooping(true);
        });
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  Widget body() {
    if (_controller.value.isInitialized) {
      return Column(
        children: [
          AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          ),
          IconButton(
            icon: Icon(
              _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
            ),
            onPressed: () {
              setState(() {
                if (_controller.value.isPlaying) {
                  _controller.pause();
                } else {
                  _controller.play();
                }
              });
            },
          ),
        ],
      );
    } else {
      return Center(child: CircularProgressIndicator());
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Water Cycle"),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: size.height * 0.35,
                width: size.width * 1,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: body(),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Key Points",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.fiber_manual_record,
                color: Colors.black,
              ),
              title: Text(
                "The water cycle shows the continuous movement of water within the Earth and atmosphere.",
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            ListTile(
              leading: Icon(
                Icons.fiber_manual_record,
                color: Colors.black,
              ),
              title: Text(
                "It is a complex system that includes many different processes as  evaporation, transpiration, etc.",
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            ListTile(
              leading: Icon(
                Icons.fiber_manual_record,
                color: Colors.black,
              ),
              title: Text(
                "Evaporation: Evaporation  is the transfer of water from the surface of the Earth to the atmosphere.",
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            ListTile(
              leading: Icon(
                Icons.fiber_manual_record,
                color: Colors.black,
              ),
              title: Text(
                "Transpiration: Transpiration is the evaporation of water through minute pores, or stomata, in the leaves of plants.",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => watercyclequiz()),
                    );
                  },
                  child: Text("Next >"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:waterapp/screens/Impact/Impactquiz.dart';
import 'package:waterapp/screens/globalwarming/warming.dart';

class solution extends StatefulWidget {
  const solution({super.key});

  @override
  State<solution> createState() => _solutionState();
}

class _solutionState extends State<solution> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset("assets/Impact.mp4")
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
        title: Text("Impact Of Global Warming"),
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
                "Rising Temperatures: Global warming leads to an increase in average global temperatures. ",
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
                "Sea Level Rise: As global temperatures rise, glaciers and ice sheets melt, and seawater expands due to thermal expansion.",
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
                "Extreme Weather Events: Global warming is linked to an increase in the frequency and severity of extreme weather events, such as hurricanes, droughts, floods, and wildfires. ",
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
                "cosystem Disruption: Many plant and animal species are struggling to adapt to rapidly changing conditions.",
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
                      MaterialPageRoute(builder: (_) =>solutionquiz()),
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

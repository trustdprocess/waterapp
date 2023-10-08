import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:waterapp/screens/globalwarming/warming.dart';

class globalwarming extends StatefulWidget {
  const globalwarming({super.key});

  @override
  State<globalwarming> createState() => _globalwarmingState();
}

class _globalwarmingState extends State<globalwarming> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset("assets/globalwarming.mp4")
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
        title: Text("Global Warming"),
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
                "Global warming is the long-term heating of Earth's surface observed since the pre-industrial period (between 1850 and 1900) due to human activities",
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
                "The increase in global temperatures is primarily attributed to the buildup of greenhouse gases in the atmosphere, such as carbon dioxide (CO2), methane (CH4), and nitrous oxide (N2O). These gases trap heat from the sun, leading to the greenhouse effect.",
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
                "The Earth's average temperature has risen by about 1.2 degrees Celsius (2.2 degrees Fahrenheit) since the late 19th century.",
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
                "NASA's satellite observations have shown that the Arctic sea ice is shrinking, and glaciers are retreating in various regions. As these ice sheets melt, they contribute to rising sea levels.",
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
                      MaterialPageRoute(builder: (_) =>globalwarmingquiz()),
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

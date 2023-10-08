import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:waterapp/screens/freshwater/freshquiz.dart';
import 'package:waterapp/screens/globalwarming/warming.dart';

class freshwater extends StatefulWidget {
  const freshwater({super.key});

  @override
  State<freshwater> createState() => _freshwaterState();
}

class _freshwaterState extends State<freshwater> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset("assets/freshwater.mp4")
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
        title: Text("Fresh Water"),
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
                "Fresh water or freshwater is any naturally occurring liquid or frozen water containing low concentrations of dissolved salts and other total dissolved solids.",
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
                "Fresh water is not always potable water, that is, water safe to drink by humans. Much of the earth's fresh water (on the surface and groundwater) is to a substantial degree unsuitable for human consumption without some treatment. ",
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
                "Fresh water is a renewable and variable, but finite natural resource. ",
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
                "Fresh water is replenished through the process of the natural water cycle, in which water from seas, lakes, forests, land, rivers and reservoirs evaporates, forms clouds, and returns inland as precipitation.",
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
                      MaterialPageRoute(builder: (_) =>freshwaterquiz ()),
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

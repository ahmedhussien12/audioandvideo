import 'package:audioandvideo/core/designs/app_images.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class PlayMusicView extends StatefulWidget {
  const PlayMusicView({super.key});

  @override
  State<PlayMusicView> createState() => _PlayMusicViewState();
}

class _PlayMusicViewState extends State<PlayMusicView> {
  final player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  Future<void> initPlayer() async {
    await player.setUrl(
        "https://server7.mp3quran.net/basit/Almusshaf-Al-Mojawwad/001.mp3");
    print("*" * 50);
    print(player.duration?.inSeconds);
    player.positionStream.listen((event) {
      setState(() {});
    });
    player.playerStateStream.listen((event)async {
      if(event.processingState==ProcessingState.completed){
        await player.stop();
        await player.seek(Duration.zero);
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          AppImages(
            "https://i1.sndcdn.com/artworks-ZrSEx5xjX05iNmcq-5eGMEQ-t500x500.jpg",
            height: 492,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          SizedBox(height: 24),
          Text(
            "All of the light",
            style: TextStyle(fontSize: 36, color: Colors.white),
          ),
          Text(
            "Kanye West",
            style: TextStyle(
              fontSize: 20,
              color: Color(0xff868686),
            ),
          ),
          player.duration == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Slider(
                  activeColor: Colors.red,
                  inactiveColor: Color(0xff868686),
                  value: player.position.inSeconds.toDouble(),
                  min: 0,
                  max: player.duration!.inSeconds.toDouble(),
                  onChanged: (value) async{
                    await player.seek(Duration(seconds: value.truncate()));
                  }),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "00:${player.position.inSeconds.toString().padLeft(2, "0")}",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xff868686),
                  ),
                ),
                Spacer(),
                Text(
                  "00:${player.duration?.inSeconds ?? "00"}",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xff868686),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AppImages("previous.svg"),
              GestureDetector(
                onTap: () async {
                  if (player.playing) {
                    await player.pause();
                  } else {
                    await player.play();
                  }
                  setState(() {});
                },
                child: player.playing
                    ? AppImages("pause.svg")
                    : AppImages("play.svg"),
              ),
              AppImages("next.svg"),
            ],
          )
        ],
      ),
    );
  }
}

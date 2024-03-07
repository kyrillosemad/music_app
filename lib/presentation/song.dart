import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/data/konsta.dart';
import 'package:sizer/sizer.dart';

class SONG extends StatefulWidget {
  const SONG({super.key});

  @override
  State<SONG> createState() => _SONGState();
}

class _SONGState extends State<SONG> {
  int index = Get.arguments["index"];
  AudioPlayer player = AudioPlayer();
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  bool playing = true;
  bool favorite = false;
  bool repeat = false;
  @override
  void initState() {
    super.initState();
    player.play(AssetSource(musics[index].path));

    player.onDurationChanged.listen((dur) {
      setState(() {
        duration = dur;
      });
    });
    player.onPositionChanged.listen((pos) {
      setState(() {
        position = pos;
      });
    });
    player.onPlayerComplete.listen((event) {
      setState(() {
        if (repeat == true) {
          player.seek(Duration.zero);
          player.play(AssetSource(musics[index].path));
        } else {
          if (index < musics.length - 1) {
            index++;
            player.pause();
            player.seek(Duration.zero);
            player.play(AssetSource(musics[index].path));
            playing = true;
          } else {
            playing = false;
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 100.w,
        height: 100.h,
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 0, 76, 138),
          Color.fromARGB(255, 154, 146, 241)
        ])),
        child: Column(children: [
          Container(
            padding: EdgeInsets.only(top: 25.sp, left: 15.sp),
            width: 100.w,
            height: 10.h,
            child: Row(children: [
              IconButton(
                onPressed: () {
                  player.pause();
                  Get.back();
                },
                icon: Icon(
                  Icons.arrow_downward,
                  size: 20.sp,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 14.w,
              ),
              Text(
                'Now Playing',
                style: TextStyle(fontSize: 15.sp, color: Colors.white),
              ),
            ]),
          ),
          Hero(
            tag: '$index',
            child: Container(
              margin: EdgeInsets.only(top: 3.h),
              width: 95.w,
              height: 50.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      musics[index].cover,
                    ),
                    fit: BoxFit.fill),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.w),
                    bottomRight: Radius.circular(40.w)),
              ),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          SizedBox(
            width: 100.w,
            height: 35.h,
            child: Column(children: [
              Text(
                musics[index].musicName,
                style: TextStyle(fontSize: 25.sp, color: Colors.white),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                musics[index].author,
                style: TextStyle(fontSize: 15.sp, color: Colors.white),
              ),
              SizedBox(
                height: 2.5.h,
              ),
              SizedBox(
                width: 100.w,
                height: 5.h,
                child: Row(children: [
                  SizedBox(
                    width: 5.w,
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          favorite = !favorite;
                        });
                      },
                      icon: Icon(
                        Icons.favorite,
                        size: 25.sp,
                        color: favorite == true ? Colors.red : Colors.white,
                      )),
                  SizedBox(
                    width: 64.w,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        repeat = !repeat;
                      });
                    },
                    child: repeat == true
                        ? Icon(
                            Icons.repeat,
                            size: 25.sp,
                            color: Colors.white,
                          )
                        : Icon(
                            Icons.next_plan_outlined,
                            size: 25.sp,
                            color: Colors.white,
                          ),
                  )
                ]),
              ),
              SizedBox(
                width: 100.w,
                height: 3.h,
                child: Slider(
                  thumbColor: Colors.indigoAccent,
                  activeColor: Colors.white,
                  min: 0,
                  value: position.inSeconds.toDouble(),
                  max: duration.inSeconds.toDouble(),
                  onChanged: (value) {
                    setState(() {
                      player.seek(Duration(seconds: value.toInt()));
                    });
                  },
                ),
              ),
              Container(
                width: 100.w,
                padding: EdgeInsets.only(left: 1.h, right: 1.h),
                height: 3.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${position.inMinutes.toString().padLeft(2, '0')}:${(position.inSeconds % 60).toString().padLeft(2, '0')}",
                      style: TextStyle(fontSize: 15.sp, color: Colors.white),
                    ),
                    Text(
                        "${duration.inMinutes.toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}",
                        style: TextStyle(fontSize: 15.sp, color: Colors.white))
                  ],
                ),
              ),
              Container(
                width: 100.w,
                height: 12.h,
                padding: EdgeInsets.only(left: 3.h, right: 3.h),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 10.w,
                        child: InkWell(
                            onDoubleTap: () {
                              player.seek(
                                  Duration(seconds: position.inSeconds - 10));
                            },
                            onTap: () {
                              setState(() {
                                if (index > 0) {
                                  index--;
                                  player.pause();
                                  player.seek(Duration.zero);
                                  player.play(AssetSource(musics[index].path));
                                  playing = true;
                                }
                              });
                            },
                            child: Icon(
                              Icons.skip_previous,
                              size: 30.sp,
                              color: Colors.white,
                            )),
                      ),
                      Container(
                        width: 20.w,
                        height: 7.h,
                        decoration: BoxDecoration(
                            color: Colors.indigoAccent,
                            borderRadius: BorderRadius.circular(20.sp)),
                        child: IconButton(
                            onPressed: () {
                              setState(() {
                                playing = !playing;
                              });
                              playing == true
                                  ? player.play(AssetSource(musics[index].path))
                                  : player.pause();
                            },
                            icon: playing == true
                                ? Icon(
                                    Icons.pause,
                                    size: 30.sp,
                                    color: Colors.white,
                                  )
                                : Icon(
                                    Icons.play_arrow,
                                    size: 30.sp,
                                    color: Colors.white,
                                  )),
                      ),
                      InkWell(
                          onDoubleTap: () {
                            player.seek(
                                Duration(seconds: position.inSeconds + 10));
                          },
                          onTap: () {
                            setState(() {
                              if (index < musics.length - 1) {
                                index++;
                                player.pause();
                                player.seek(Duration.zero);
                                player.play(AssetSource(musics[index].path));
                                playing = true;
                              }
                            });
                          },
                          child: Icon(
                            Icons.skip_next,
                            size: 30.sp,
                            color: Colors.white,
                          )),
                    ]),
              ),
            ]),
          )
        ]),
      ),
    );
  }
}

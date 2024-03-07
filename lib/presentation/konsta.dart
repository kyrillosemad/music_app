import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/data/konsta.dart';
import 'package:music_app/presentation/song.dart';
import 'package:sizer/sizer.dart';

class KONSTA extends StatefulWidget {
  const KONSTA({super.key});

  @override
  State<KONSTA> createState() => _KONSTAState();
}

class _KONSTAState extends State<KONSTA> {
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
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.transparent,
              expandedHeight: 36.h,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  padding: EdgeInsets.only(top: 15.sp),
                  alignment: Alignment.topCenter,
                  width: 100.w,
                  height: 35.5.h,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      image: const DecorationImage(
                          image: AssetImage("assets/images/album1.png"),
                          fit: BoxFit.fill),
                      borderRadius: BorderRadius.circular(10.sp)),
                  child: Container(
                    padding: EdgeInsets.all(15.sp),
                    width: 100.w,
                    height: 10.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.queue_music_rounded,
                          size: 40.sp,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            /////////////////////////////////////////////////////////////
            ////////////////////////////////////////////////////////////
            /////////////////////////////////////////////////////////////
            ////////////////////////////////////////////////////////////
            ////////////////////////////////////////////////////////////
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.only(left: 15.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      "Your music",
                      style: TextStyle(fontSize: 17.sp, color: Colors.white),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                  ],
                ),
              ),
            ),
            /////////////////////////////////////////////////////////////
            ////////////////////////////////////////////////////////////
            /////////////////////////////////////////////////////////////
            ////////////////////////////////////////////////////////////
            ////////////////////////////////////////////////////////////
            SliverAnimatedList(
              initialItemCount: musics.length,
              itemBuilder: (context, index, animation) {
                return Container(
                  padding: EdgeInsets.all(10.sp),
                  margin: EdgeInsets.all(8.sp),
                  width: 85.w,
                  height: 12.h,
                  decoration: BoxDecoration(
                      color: Colors.transparent.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(20.sp)),
                  child: Row(children: [
                    Hero(
                      tag: "$index",
                      child: Container(
                        width: 25.w,
                        height: 9.h,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.sp),
                            image: DecorationImage(
                                image: AssetImage(musics[index].cover),
                                fit: BoxFit.fill)),
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: 40.w,
                            height: 4.h,
                            child: Text(
                              musics[index].musicName,
                              style: TextStyle(
                                  fontSize: 18.sp, color: Colors.white),
                            )),
                        SizedBox(
                          height: 1.h,
                        ),
                        SizedBox(
                          width: 40.w,
                          height: 3.h,
                          child: Text(
                            musics[index].author,
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 12.sp,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    SizedBox(
                      width: 15.w,
                      height: 10.h,
                      child: Center(
                        child: IconButton(
                          icon: Icon(
                            Icons.play_arrow,
                            size: 40.sp,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Get.to(const SONG(), arguments: {
                              "index": index,
                            });
                          },
                        ),
                      ),
                    )
                  ]),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

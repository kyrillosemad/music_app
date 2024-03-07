import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/data/albums.dart';
import 'package:music_app/data/playlists.dart';
import 'package:music_app/presentation/konsta.dart';
import 'package:music_app/presentation/slider_item.dart';
import 'package:sizer/sizer.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Container(
          width: 100.w,
          height: 100.h,
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 0, 76, 138),
            Color.fromARGB(255, 154, 146, 241)
          ])),
          padding: EdgeInsets.only(top: 10.sp),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.list_sharp,
                    size: 30.sp,
                    color: Colors.white,
                  ),
                  Text(
                    "Music Player",
                    style: TextStyle(fontSize: 17.sp, color: Colors.white),
                  ),
                  Icon(
                    Icons.search,
                    size: 30.sp,
                    color: Colors.white,
                  )
                ],
              ),
              SizedBox(
                height: 1.h,
              ),
              ////////////////////////////////////////////////////////////
              /////////////////////////////////////////////////////////////
              /////////////////////////////////////////////////////////////
              //////////////////////////////////////////////////////////
              /////////////////////////////////////////////////////////////
              SizedBox(
                width: 100.w,
                height: 30.h,
                child: CarouselSlider(
                    items: const [
                      SliderItem(0),
                      SliderItem(1),
                      SliderItem(2),
                      SliderItem(3),
                    ],
                    options: CarouselOptions(
                        autoPlay: true, height: 28.h, enlargeCenterPage: true)),
              ),

              SizedBox(
                height: 5.h,
              ),
              ////////////////////////////////////////////////////////////
              /////////////////////////////////////////////////////////////
              /////////////////////////////////////////////////////////////
              //////////////////////////////////////////////////////////
              /////////////////////////////////////////////////////////////
              SizedBox(
                width: 100.w,
                height: 26.h,
                child: Column(children: [
                  Container(
                    padding: EdgeInsets.only(right: 20.sp, left: 20.sp),
                    width: 100.w,
                    height: 4.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Albums",
                          style:
                              TextStyle(fontSize: 20.sp, color: Colors.white),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 20.sp,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 100.w,
                    height: 22.h,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: albums.length,
                      itemBuilder: (BuildContext context, int index) {
                        return SizedBox(
                            width: 40.w,
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    if (index == 0) {
                                      Get.to(const KONSTA());
                                    }
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.sp),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "${albums[index]['image']}"),
                                            fit: BoxFit.fill)),
                                    width: 40.w,
                                    height: 14.h,
                                    margin: EdgeInsets.all(10.sp),
                                  ),
                                ),
                                Text(
                                  "${albums[index]['name']}",
                                  style: TextStyle(
                                      fontSize: 13.sp, color: Colors.white),
                                )
                              ],
                            ));
                      },
                    ),
                  ),
                ]),
              ),

              SizedBox(
                height: 2.h,
              ),
              ////////////////////////////////////////////////////////////
              /////////////////////////////////////////////////////////////
              /////////////////////////////////////////////////////////////
              //////////////////////////////////////////////////////////
              /////////////////////////////////////////////////////////////
              SizedBox(
                width: 100.w,
                height: 27.h,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(right: 20.sp, left: 20.sp),
                        width: 100.w,
                        height: 4.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "playlists",
                              style: TextStyle(
                                  fontSize: 20.sp, color: Colors.white),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 20.sp,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 100.w,
                        height: 20.h,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: playlists.length,
                          itemBuilder: (BuildContext context, int index) {
                            return SizedBox(
                                width: 40.w,
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.sp),
                                            gradient:
                                                const LinearGradient(colors: [
                                              Color.fromARGB(255, 3, 36, 63),
                                              Color.fromARGB(255, 6, 199, 189)
                                            ])),
                                        height: 14.h,
                                        margin: EdgeInsets.all(10.sp),
                                        child: Center(
                                            child: Text(
                                          "${playlists[index]['name']}",
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              color: Colors.white),
                                        )),
                                      ),
                                    ),
                                  ],
                                ));
                          },
                        ),
                      ),
                    ]),
              )

              ////////////////////////////////////////////////////////////
              /////////////////////////////////////////////////////////////
              /////////////////////////////////////////////////////////////
              //////////////////////////////////////////////////////////
              /////////////////////////////////////////////////////////////
            ],
          ),
        ),
      ),
    );
  }
}

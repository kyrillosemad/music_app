import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/presentation/home_page.dart';
import 'package:sizer/sizer.dart';
import 'package:lottie/lottie.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 100.w,
        height: 100.h,
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage(""), fit: BoxFit.fill),
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 0, 76, 138),
              Color.fromARGB(255, 154, 146, 241)
            ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 100.w,
              height: 40.h,
              child:
                  Lottie.asset("assets/images/Animation - 1709329673133.json"),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.sp),
              width: 100.w,
              height: 32.h,
              padding: EdgeInsets.all(10.sp),
              child: Text(
                "Listen To Amazing Music Around The World",
                style: TextStyle(fontSize: 35.sp, color: Colors.white),
              ),
            ),
            SizedBox(
              width: 100.w,
              height: 15.h,
              child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                SizedBox(
                  width: 15.sp,
                ),
                Text(
                  "Get Started",
                  style: TextStyle(fontSize: 20.sp, color: Colors.white),
                ),
                SizedBox(
                  width: 90.sp,
                ),
                MaterialButton(
                  onPressed: () {
                    Get.offAll(const HomePage());
                  },
                  child: const CircleAvatar(
                    radius: 25,
                    child: Icon(Icons.arrow_forward),
                  ),
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}

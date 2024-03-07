import 'package:flutter/material.dart';
import 'package:music_app/data/konsta.dart';
import 'package:sizer/sizer.dart';

class SliderItem extends StatelessWidget {
  const SliderItem(
    this.index, {
    super.key,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 85.w,
      height: 30.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.sp),
          image: DecorationImage(
              image: AssetImage(musics[index].cover), fit: BoxFit.fill)),
    );
  }
}

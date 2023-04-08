import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sprint/res/colors.dart';
import 'package:sprint/widgets/app_base_page.dart';
import 'package:sprint/widgets/app_header.dart';

import 'item_thong_bao.dart';

class ThongBao extends StatefulWidget {
  const ThongBao({Key? key}) : super(key: key);

  @override
  State<ThongBao> createState() => _ThongBaoState();
}

class _ThongBaoState extends State<ThongBao> {
  @override
  Widget build(BuildContext context) {
    return AppBasePage(
      backgroundColor: AppColors.colorBg,
      child: Column(
        children: [
          AppHeader(title: 'Thông báo'),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 15.sp,left: 16.sp,right: 16.sp),
              itemBuilder: (context, index) {
                return ItemThongBao();
              },
            ),
          )
        ],
      ),
    );
  }
}

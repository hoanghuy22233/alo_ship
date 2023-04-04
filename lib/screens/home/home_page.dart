import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sprint/res/colors.dart';
import 'package:sprint/screens/home/header_home.dart';
import 'package:sprint/screens/home/item_list_home.dart';
import 'package:sprint/widgets/app_base_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return AppBasePage(
      backgroundColor: AppColors.colorBg,
      child: Column(
        children: [
          HeaderHome(),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              padding: EdgeInsets.only(top: 15.sp,left: 20.sp,right: 20.sp),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ItemListHome();
              },
            ),
          )
        ],
      ),
    );
  }
}

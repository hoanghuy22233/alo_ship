import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../res/app_styles.dart';
import '../../res/app_values.dart';
import '../../res/colors.dart';
import '../../widgets/app_base_page.dart';
import '../../widgets/app_text.dart';
import '../../widgets/my_app_bar.dart';
import '../../widgets/widget_handle.dart';
import 'screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{
  TabController? _tabController;
  int page=2;


  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this, initialIndex: 2);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 2,
      length: 5,
      child: AppBasePage(
          appBarBottom: MyAppBar.bottomEmpty(
            backgroundColor: AppColors.BLACK,
          ),
          child: DoubleBackToCloseApp(
            snackBar: SnackBar(
              content: AppText('tap_to_close'.tr,
                  style: AppStyle.DEFAULT_14.copyWith(color: Colors.white)),
            ),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                         Screen(stt: 1),
                         Screen(stt: 2),
                         Screen(stt: 3),
                         Screen(stt: 4),
                         Screen(stt: 5),
                        ],
                      )),
                  //Divider(thickness: 1,),

                  _buildMenu()
                ],
              ),
            ),
          )),
    );
  }
  _buildMenu() {
    return Container(
        height: 70,
        width: Get.width,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Row(children: [
          itemMenu(
              image: 'assets/icons/home.png',
              index: 0,
              title: 'Screen 1'),
          itemMenu(
              image: 'assets/icons/home.png',
              index: 1,
              title: 'Screen 2'),
          itemMenu(
              image: 'assets/icons/home.png',
              index: 2,
              title: 'Screen 3'),
          itemMenu(
              image: 'assets/icons/home.png',
              index: 3,
              title: 'Screen 4'),
          itemMenu(
              image: 'assets/icons/home.png',
              index: 4,
              title: 'Screen 5'),
        ]));
  }

  itemMenu(
      {required String image,
        required int index,
        required String title,
        String? avatar}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _tabController?.index = index;
          page = index;
        });
      },
      child: Container(
        decoration: BoxDecoration(),
        width: Get.width / 5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            WidgetContainerImage(
              image: image,
              colorImage: page == index
                  ? page == 2
                  ? null
                  : AppColors.primary
                  : AppColors.gray,
              height: 25,
              width: index == 2 ? 35 : 25,
            ),
            AppValue.vSpaceTiny,
            AppText(
              title,
              style: AppStyle.DEFAULT_12
                  .copyWith(color: page == index ? AppColors.primary : null),
              maxLines: 1,
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';

import '../res/app_styles.dart';
import '../widgets/app_base_page.dart';

class AppNoInternetPage extends StatelessWidget {
  const AppNoInternetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBasePage(
      // onWillPop: () async => false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FractionallySizedBox(
            widthFactor: 0.6,
            child: Container(
              // color: Colors.red,
              child: Lottie.asset(
                'assets/lotties/no_internet.json',
                package: 'lhbase_v1',
              ),
            ),
          ),
          Container(
            width: double.infinity,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    'connectivity.oops'.tr,
                    style: AppStyle.DEFAULT_24_BOLD,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    'connectivity.no_internet'.tr,
                    style: AppStyle.DEFAULT_16
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    'connectivity.check'.tr,
                    style: AppStyle.DEFAULT_16
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          width: 1.0,
                          color: Colors.grey,
                          style: BorderStyle.solid,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(500.0),
                        )),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        'connectivity.try_again'.tr,
                        style: AppStyle.DEFAULT_18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
          // Load a Lottie file from a remote url
        ],
      ),
    );
  }
}

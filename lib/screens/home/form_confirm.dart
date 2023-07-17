import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../res/app_styles.dart';
import '../../res/colors.dart';
import '../../widgets/DButton.dart';
import '../../widgets/DInput.dart';
import '../../widgets/app_text.dart';

class FormConfirm extends StatefulWidget {
  FormConfirm({Key? key,required this.onHoanThanh}) : super(key: key);
  Function onHoanThanh;

  @override
  State<FormConfirm> createState() => _FormConfirmState();
}

class _FormConfirmState extends State<FormConfirm> {
  TextEditingController _soTienController=TextEditingController();
  bool check=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Spacer(),
          Container(
            decoration: BoxDecoration(
                color: AppColors.WHITE,
                borderRadius: BorderRadius.circular(5.sp)
            ),
            margin: EdgeInsets.symmetric(horizontal: 15.sp),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: Get.width,
                  padding: EdgeInsets.symmetric(vertical: 17.sp,horizontal: 20.sp),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                            width: 1,color: AppColors.colorBorder,
                          )
                      )
                  ),
                  child: AppText(
                    'Xác nhận đơn hàng',
                    textAlign: TextAlign.center,
                    style: AppStyle.DEFAULT_16.copyWith(fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(height: 14.sp,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        'Vui lòng nhập số tiền vận chuyển đơn hàng',
                        style: AppStyle.DEFAULT_16,
                      ),
                      SizedBox(height: 20.sp,),
                      DInput(hintText: 'Nhập số tiền', controller: _soTienController,keyboardType: TextInputType.number,),
                      SizedBox(height: 15.sp,),
                      check? AppText(
                        'Bạn chưa nhập số tiền',
                        style: AppStyle.DEFAULT_14.copyWith(color: AppColors.red1),
                      ):SizedBox(),
                      check?SizedBox(height: 15.sp,):SizedBox(),
                      Row(
                        children: [
                          Expanded(child: DButton(
                              text: 'Hủy bỏ',
                              textColor: AppColors.BLACK,
                              bgColor: AppColors.WHITE,
                              onClick: (){
                                Get.back();
                              }
                          )),
                          SizedBox(width: 15.sp,),
                          Expanded(child: DButton(text: 'Hoàn thành', onClick: this.onClickHoanThanh)),
                        ],
                      ),
                      SizedBox(height: 20.sp,)
                    ],
                  ),
                ),

              ],
            ),

          ),
          Spacer()
        ],
      ),
    );
  }

  onClickHoanThanh() {
    if(_soTienController.text!=""){
      setState(() {
        check=false;
      });
      widget.onHoanThanh(_soTienController.text);

    }else{
      setState(() {
        check=true;
      });
    }
  }
}

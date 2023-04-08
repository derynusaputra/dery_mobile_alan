import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant.dart';

Future<void> ShowAlertDialog(BuildContext context) async {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          elevation: 5,

          shadowColor: Color(0xffFDE4E4),
          shape: RoundedRectangleBorder(
              side: BorderSide(width: 1.5, color: Color(0xffFDE4E4)),
              borderRadius: BorderRadius.circular(5.r)), //this right here
          child: Container(
            // height: 200,
            // height: double.negativeInfinity,

            padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
            width: 532.w,
            // decoration:
            //     BoxDecoration(borderRadius: BorderRadius.circular(15)),
            child: ListView(
              shrinkWrap: true,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.restaurant_menu_sharp,
                      color: purpleColor,
                    ),
                    Text(
                      '  Detail Pesanan',
                      style: t16w600.copyWith(color: purpleColor),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 40.h,
                          width: 40.w,
                          margin: EdgeInsets.only(right: 5.w),
                          decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(5.r),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    'https://www.indomie.com/uploads/product/indomie-mi-goreng-special_detail_094906814.png',
                                  ))),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Yogurt',
                              style: t12w600,
                              overflow: TextOverflow.clip,
                              maxLines: 1,
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Rp.25.000',
                                  style: t10w500.copyWith(color: purpleColor),
                                  overflow: TextOverflow.clip,
                                  maxLines: 1,
                                ),
                                Text(
                                  ' / porsi',
                                  style: t10w500.copyWith(color: greyColor),
                                  overflow: TextOverflow.clip,
                                  maxLines: 1,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      '1x',
                      style: t12w500,
                      overflow: TextOverflow.clip,
                      maxLines: 1,
                    ),
                  ],
                ),
                // detail makanan
                SizedBox(
                  height: 20.h,
                ),
                detail(whiteColor, title: 'Total', price: '25.000'),
                SizedBox(
                  height: 5.h,
                ),
                detail(lightBGColor, title: 'Uang Dibayar', price: '25.000'),
                SizedBox(
                  height: 5.h,
                ),
                detail(Color(0xffDEEBE1), title: 'Kembalian', price: '25.000'),

                SizedBox(
                  height: 20.h,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Cetak Struk'),
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(420.w, 33.h),
                        primary: purpleColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.r))),
                  ),
                )
              ],
            ),
          ),
        );
      });
}

Widget detail(
  Color color, {
  required String title,
  required String price,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: t14w500,
      ),
      Row(
        children: [
          Text(
            ': ',
            style: t16w600,
          ),
          Container(
            height: 30.h,
            width: 140.w,
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(3.r)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Rp. ${price}  ',
                  style: t14w500,
                ),
              ],
            ),
          ),
        ],
      ),
    ],
  );
}

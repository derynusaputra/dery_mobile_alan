import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant.dart';

class CardWidget extends ConsumerWidget {
  final String image;
  final String title;
  final String price;
  final VoidCallback pilihian;

  final VoidCallback ontap;

  const CardWidget({
    required this.ontap,
    required this.pilihian,
    required this.image,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: pilihian,
      child: Container(
        width: 163.w,
        // height: 176.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r), color: whiteColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r)),
              child: Image.network(
                image,
                width: double.infinity,
                height: 160.h,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: t12w600.copyWith(color: purpleColor),
                          overflow: TextOverflow.clip,
                          maxLines: 2,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          children: [
                            Text(
                              'Rp.${price}',
                              style: t14w500,
                              overflow: TextOverflow.clip,
                              maxLines: 1,
                            ),
                            Text(
                              ' / porsi',
                              style: t12w500.copyWith(color: greyColor),
                              overflow: TextOverflow.clip,
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: ontap,
                        child: Text('Order'),
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(140.w, 33.h),
                            primary: purpleColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.r))),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

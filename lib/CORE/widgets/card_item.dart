import 'package:dery_mobileapps/model/card_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant.dart';

class CardItem extends ConsumerWidget {
  final CardModel cardModel;
  const CardItem(this.cardModel, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      // height: 65.h,
      width: double.infinity,
      color: Colors.white,
      margin: EdgeInsets.only(
        bottom: 10.h,
      ),
      padding: EdgeInsets.only(top: 7.h, bottom: 7.h, left: 15.w, right: 15.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                height: 65.h,
                width: 65.w,
                margin: EdgeInsets.only(right: 15.w),
                decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(5.r),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          cardModel.picture,
                        ))),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cardModel.name,
                    style: t15w500,
                    overflow: TextOverflow.clip,
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    children: [
                      Text(
                        'Rp.${cardModel.price}}',
                        style: t12w500.copyWith(color: purpleColor),
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
            ],
          ),
          Row(
            children: [
              Container(
                height: 31.h,
                width: 43.w,
                decoration: BoxDecoration(
                    // color: whiteColor,
                    border: Border.all(color: purpleColor, width: 1.w),
                    borderRadius: BorderRadius.circular(5.r)),
                child: Center(
                  child: Text(
                    '-',
                    style: t20w600.copyWith(color: purpleColor),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Text(
                  '1',
                  style: t14w500,
                  overflow: TextOverflow.clip,
                  maxLines: 1,
                ),
              ),
              Container(
                height: 31.h,
                width: 43.w,
                decoration: BoxDecoration(
                    color: purpleColor,
                    border: Border.all(color: purpleColor, width: 1.w),
                    borderRadius: BorderRadius.circular(5.r)),
                child: Center(
                  child: Text(
                    '+',
                    style: t20w600.copyWith(color: whiteColor),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

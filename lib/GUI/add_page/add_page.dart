import 'dart:math';

import 'package:dery_mobileapps/services/state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../CORE/constant.dart';
import '../../CORE/data_dummy/list_image_dummy.dart';
import '../../CORE/widgets/custom_button.dart';
import '../../CORE/widgets/custom_form.dart';

class AddPage extends ConsumerWidget {
  AddPage({super.key});
  final _formKey = GlobalKey<FormState>();
  final nameCon = TextEditingController();
  final nameHarga = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: purpleColor,
      ),
      body: ListView(
        padding: EdgeInsets.all(24.r),
        children: [
          SizedBox(
            height: 10.h,
          ),
          Text(
            'Add Makanan',
            style: t20w600,
          ),
          SizedBox(
            height: 23.h,
          ),
          formProfile(),
          SizedBox(
            height: 24.h,
          ),
          CustomFieldButton(
            title: "Add",
            height: 50.h,
            onPress: () {
              if (_formKey.currentState!.validate()) {
                var time = DateTime.now().toIso8601String();
                var rnd = Random();
                var id = Random().nextInt(1000);

                var r = 0 + rnd.nextInt(3 - 0);
                var list = listImage[r];
                print(nameCon.text +
                    "  " +
                    time +
                    "  " +
                    id.toString() +
                    "  " +
                    list);

                ref.read(apiServices.notifier).addApi(
                      nameCon.text,
                      nameHarga.text,
                    );
                // _signIN(context, emailCon, passwordC);
              }
            },
          ),
        ],
      ),
    );
  }

  Widget formProfile() {
    return Container(
      // margin: EdgeInsets.symmetric(vertical: 30.h),
      padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 22.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r), color: whiteColor),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            CustomForm(
              title: 'Nama Food',
              formCon: nameCon,
              backColor: lightBGColor,
              validator: (value) {
                // RegExp regex = RegExp(r"\s+");
                if (value!.isEmpty || value == "") {
                  return "Name harus di isi";
                }
              },
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomForm(
              title: 'Harga',
              formCon: nameHarga,
              backColor: lightBGColor,
              validator: (value) {
                RegExp regex = RegExp(r"\s+");
                if (value!.isEmpty || value == "") {
                  return "Harga harus di isi";
                } else {
                  if (regex.hasMatch(value)) {
                    return 'Harus pakai angka';
                  }
                }
              },
            ),
            SizedBox(
              height: 16.h,
            ),
          ],
        ),
      ),
    );
  }
}

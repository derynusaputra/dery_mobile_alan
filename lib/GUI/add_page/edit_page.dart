import 'dart:math';

import 'package:dery_mobileapps/model/card_model.dart';
import 'package:dery_mobileapps/services/state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../CORE/constant.dart';
import '../../CORE/data_dummy/list_image_dummy.dart';
import '../../CORE/widgets/custom_button.dart';
import '../../CORE/widgets/custom_form.dart';

class EditPage extends ConsumerWidget {
  final CardModel cardModel;
  EditPage(this.cardModel);

  final _formKey = GlobalKey<FormState>();
  final nameCon = TextEditingController();
  final nameHarga = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    nameCon.text = cardModel.name;
    nameHarga.text = cardModel.price;

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
            'Edit/Delet Makanan',
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
            title: "Tambah",
            height: 50.h,
            onPress: () {
              if (_formKey.currentState!.validate()) {
                ref.read(apiServices.notifier).updateApi(
                    id: cardModel.id.toString(),
                    harga: nameHarga.text,
                    name: nameCon.text);
              }
            },
          ),
          SizedBox(
            height: 23.h,
          ),
          CustomFieldButton(
            title: "Delete",
            height: 50.h,
            onPress: () {
              _showAlertDialog(context, () {
                ref.read(apiServices.notifier).deleteApi(
                      cardModel.id.toString(),
                    );
              });
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
              inputFormatters: [
                FilteringTextInputFormatter.allow('.', replacementString: ''),
                FilteringTextInputFormatter.allow(RegExp(r'(^\d*\.?\d{0,2})')),
              ],
              formCon: nameHarga,
              backColor: lightBGColor,
              inputType: TextInputType.number,
              validator: (value) {
                // final separator = numberFormatSymbols[locale]?.DECIMAL_SEP ?? '.';
                RegExp regex = RegExp(r'(^\d*\.?\d{0,2}\d{0.2})', dotAll: true);
                if (value!.isEmpty || value == "") {
                  return "Harga harus di isi";
                } else {
                  final n = num.tryParse(value);

                  if (n == null && regex.hasMatch(value)) {
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

Future<void> _showAlertDialog(BuildContext context, VoidCallback ontap) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        // <-- SEE HERE
        title: const Text('Delete Makanan'),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text('Anda yakin akan hapus makanan ini?'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('No'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(child: const Text('Yes'), onPressed: ontap),
        ],
      );
    },
  );
}

import 'package:dery_mobileapps/CORE/widgets/card_widget.dart';
import 'package:dery_mobileapps/model/card_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../CORE/data_dummy/list_image_dummy.dart';
import '../../CORE/routes/routes.dart';
import '../../services/api_services.dart';
import '../../services/state_provider.dart';
import '../../services/state_riverpood.dart';
import '../add_page/add_page.dart';
import '../add_page/edit_page.dart';

class HomeContent extends ConsumerStatefulWidget {
  const HomeContent({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeContentState();
}

class _HomeContentState extends ConsumerState<HomeContent> {
  var service = ApiServices();
  List<CardModel> listData = [];

  void getData() async {
    var data = await service.getApi();
    setState(() {
      listData = data;
    });
    // print('data: ${listData.length}');
  }

  @override
  void initState() {
    getData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var listIndex = ;
    var todos = ref.watch(apiServices).listItem;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 15.w,
        vertical: 14.h,
      ),
      child: listData.length == 0
          ? Center(child: CircularProgressIndicator())
          : Container(
              child: GridView.builder(
                  padding: EdgeInsets.only(top: 0, bottom: 70.h),
                  // controller: controller,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200.w,
                      childAspectRatio: 0.6.r,
                      crossAxisSpacing: 20.w,
                      mainAxisSpacing: 20.h),
                  itemCount: listData.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return CardWidget(
                      pilihian: () {
                        // Get.to(EditPage());
                        getToRoute(
                          context,
                          widget: EditPage(listData[index]),
                        );
                        // _showAlertDialog(context);
                      },
                      ontap: () {
                        ref
                            .read(apiServices.notifier)
                            .addListData({index: listData[index]});
                        ref
                            .read(apiServices.notifier)
                            .addListCart(listData[index]);
                      },
                      image: listData[index].picture,
                      price: listData[index].price,
                      title: listData[index].name,
                    );
                  }),
            ),
    );
  }
}

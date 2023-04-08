import 'package:dery_mobileapps/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../CORE/constant.dart';
import '../../CORE/data_dummy/list_image_dummy.dart';
import '../../CORE/dialog/custom_dialog.dart';
import '../../CORE/routes/routes.dart';
import '../../CORE/widgets/card_item.dart';
import '../../CORE/widgets/custom_form.dart';
import '../../services/state_provider.dart';
import '../../services/state_riverpood.dart';
import '../add_page/add_page.dart';
import 'home_content.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  static const List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
  ];
// 16

  FocusNode focusNode = FocusNode();
  var offSearch = false;

  List<Widget> listItems = [
    // CardItem(),
    // CardItem(),
    // CardItem(),
    // CardItem(),
    // CardItem(),
  ];
  ApiServices apiService = ApiServices();
  @override
  Widget build(BuildContext context) {
    // var shop = ref.watch(listDatas);

    DraggableScrollableController controllers = DraggableScrollableController();
    print("${ref.watch(focus)} naonnya iey");
    return GestureDetector(
      onTap: focusKeyboard,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: whiteColor,
            centerTitle: false,
            titleSpacing: 0,
            title: Padding(
              padding: EdgeInsets.only(left: 15.w, right: 10.w),
              child: SizedBox(
                  height: 34.h,
                  child: CustomForms(
                    // focus: focusNode,
                    disable: offSearch,
                    textinputaction: TextInputAction.search,
                    prefixIcon: GestureDetector(
                        onTap: () {}, child: Icon(Icons.search)),
                    radius: 5.r,
                    borderColor: purpleColor,
                  )),
            ),
            actions: [
              GestureDetector(
                onTap: () {
                  getToRoute(
                    context,
                    widget: AddPage(),
                  );
                  // apiService.getApi();
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.add_circle_outline,
                      size: 25.h,
                      color: purpleColor,
                    ),
                    Text(
                      ' Add',
                      style: t12w600.copyWith(color: purpleColor),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 15.w,
              )
            ],
          ),
          body: Stack(
            children: [
              HomeContent(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  constraints: BoxConstraints(
                    // minHeight: 0.16.sh,
                    maxHeight: 0.6.sh,
                  ),
                  color: lightBGColor,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: onOf,
                        child: Container(
                            height: 72.h,
                            // margin: EdgeInsets.only(bottom: 20.h),
                            width: double.infinity,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Container(
                                    height: 65.h,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      border: Border(
                                          top: BorderSide(
                                              color: purpleColor,
                                              width: 2.5.w)),
                                      color: whiteColor,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        left: 15.w,
                                        right: 15.w,
                                        bottom: 4.h,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Badge(
                                                label: Text(
                                                  ref
                                                      .watch(apiServices)
                                                      .listItem
                                                      .length
                                                      .toString(),
                                                  style: t8w500.copyWith(
                                                      color: whiteColor),
                                                ),
                                                child: Icon(
                                                  Icons.shopping_bag_outlined,
                                                  size: 25.h,
                                                  color: purpleColor,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10.w,
                                              ),
                                              Text(
                                                'Rp. 140000',
                                                style: t15w500.copyWith(
                                                    color: blackColor),
                                              ),
                                            ],
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              focusKeyboard();
                                              ref
                                                  .read(showMenus.notifier)
                                                  .update((state) => 0);
                                              ShowAlertDialog(context);
                                            },
                                            child: Text('Charge'),
                                            style: ElevatedButton.styleFrom(
                                                minimumSize: Size(120.w, 35.h),
                                                primary: purpleColor,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.r))),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                  child: Center(
                                    child: GestureDetector(
                                      onTap: onOf,
                                      child: CircleAvatar(
                                        radius: 30.r,
                                        backgroundColor: purpleColor,
                                        child: Center(
                                          child: Icon(
                                            ref.watch(showMenus) == 0
                                                ? Icons.arrow_drop_up
                                                : Icons.arrow_drop_down,
                                            size: 20.h,
                                            color: whiteColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ),
                      ref.watch(showMenus) == 1
                          ? ref.watch(apiServices).listWidget.length <= 4
                              ? Column(
                                  children: [
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Column(
                                        children:
                                            ref.watch(apiServices).listWidget),
                                  ],
                                )
                              : Expanded(
                                  child: ListView.builder(
                                  itemCount:
                                      ref.watch(apiServices).listWidget.length,
                                  itemBuilder: (context, i) {
                                    return ref.watch(apiServices).listWidget[i];
                                  },
                                ))
                          : SizedBox()
                    ],
                  ),
                ),
              ),
              // _buildMenu(),
            ],
          )),
    );
  }

  void onOf() {
    if (ref.watch(showMenus) == 0) {
      ref.read(showMenus.notifier).update((state) => 1);
      setState(() {
        offSearch = true;
      });
    } else {
      ref.read(showMenus.notifier).update((state) => 0);
      setState(() {
        offSearch = false;
      });
    }

    focusKeyboard();
  }

  void focusKeyboard() {
    FocusScope.of(context).unfocus();
  }
}

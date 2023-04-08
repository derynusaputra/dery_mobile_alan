import 'package:dery_mobileapps/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nameData = Provider(
  (ref) => "nama",
);

final showMenus = StateProvider((ref) => 0);
final focus = StateProvider((ref) => FocusNode());

final listData = StateProvider((ref) {
  var service = ApiServices();
  var list = service.getApi();
  return FocusNode();
});

// final listDatas = StateNotifierProvider((ref) => {});
final listNilai = StateProvider((ref) => 0);

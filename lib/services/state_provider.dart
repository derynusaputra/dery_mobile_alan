import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'api_services.dart';

final apiServices = ChangeNotifierProvider<ApiServices>((ref) {
  return ApiServices();
});

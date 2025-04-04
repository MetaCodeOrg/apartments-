import 'package:flutter_app/features/user/controller/user_controller.dart';
import 'package:flutter_app/services/api/api_services.dart';
import 'package:flutter_app/services/api/post_get_page.dart';
import 'package:mc_utils/mc_utils.dart';

class DataApi {
  PostGetPage apiReq;
  DataApi(this.apiReq);

  Map<String, String>? _headerWithToken() {
    if (Get.isRegistered<UserController>()) {
      var token = Get.find<UserController>().userModel?.token;
      return {"Authorization": "Bearer $token"};
    }
    return null;
  }

  getApartments() async {
    var res = await apiReq.dynamicData(
        url: ApiServices.apartments,
        header: _headerWithToken() ?? {},
        methode: "GET");
    return res.fold((l) => l, (r) => r);
  }

  getApartmentItem(int id) async {
    var res = await apiReq.dynamicData(
        header: _headerWithToken() ?? {},
        url: "${ApiServices.apartments}/$id",
        methode: "GET");
    return res.fold((l) => l, (r) => r);
  }

  makeOrder(int aparmentId, String message) async {
    var res = await apiReq.dynamicData(
      header: _headerWithToken() ?? {},
      data: {
        "apartment_id": aparmentId.toString(),
        "message": message,
      },
      url: ApiServices.request,
    );
    return res.fold((l) => l, (r) => r);
  }

  // searchApartments() async {
  //   var res =
  //       await apiReq.dynamicData(url: ApiServices.newProducts, methode: "GET");
  //   return res.fold((l) => l, (r) => r);
  // }
}

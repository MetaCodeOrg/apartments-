import 'package:flutter_app/core/class/statusrequest.dart';
import 'package:flutter_app/models/apartment_model.dart';
import 'package:flutter_app/services/data/data_api.dart';
import 'package:flutter_app/services/helper_function.dart';
import 'package:mc_utils/mc_utils.dart';

class ApartmentController extends GetxController {
  Rx<StatusRequest> statusRequest = StatusRequest.none.obs;
  final DataApi authApi = DataApi(Get.find());
  final _apartmentsRent = <ApartmentModel>[].obs;
  final _apartmentsFurnished = <ApartmentModel>[].obs;
  var _apartmentsRentSearch = <ApartmentModel>[].obs;
  var _apartmentsFurnishedSearch = <ApartmentModel>[].obs;

  List<ApartmentModel> get apartmentsRent => _apartmentsRent;
  List<ApartmentModel> get apartmentsFurnished => _apartmentsFurnished;
  final _searchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchApartments();
  }

  Future<void> fetchApartments() async {
    await handleRequestfunc(
        statusRequest: statusRequest.value,
        hideLoading: true,
        status: (p0) {
          statusRequest.value = p0;
          // update();
        },
        apiCall: () async => await authApi.getApartments(),
        onSuccess: (res) {
          if (res['data'] != null) {
            var data = res['data'] as List;
            var _apartmentsList =
                data.map((e) => ApartmentModel.fromJson(e)).toList();
            _apartmentsFurnished.value = _apartmentsList
                .where(
                  (element) => element.apartmentType == "Furnished",
                )
                .toList();
            _apartmentsRent.value = _apartmentsList
                .where(
                  (element) => element.apartmentType == "rent",
                )
                .toList();
            _apartmentsFurnishedSearch = _apartmentsFurnished;
            _apartmentsRentSearch = _apartmentsRent;
          }
        },
        onError: showError);
  }

  void sortApartments(SortOption sortOption, bool isRentList) {
    if (isRentList) {
      switch (sortOption) {
        case SortOption.priceAsc:
          _apartmentsRent.sort((a, b) => a.price.compareTo(b.price));
        case SortOption.priceDesc:
          _apartmentsRent.sort((a, b) => b.price.compareTo(a.price));
        case SortOption.ratingAsc:
          _apartmentsRent.sort((a, b) => a.rating.compareTo(b.rating));
        case SortOption.ratingDesc:
          _apartmentsRent.sort((a, b) => b.rating.compareTo(a.rating));
      }
    } else {
      switch (sortOption) {
        case SortOption.priceAsc:
          _apartmentsFurnished.sort((a, b) => a.price.compareTo(b.price));
        case SortOption.priceDesc:
          _apartmentsFurnished.sort((a, b) => b.price.compareTo(a.price));
        case SortOption.ratingAsc:
          _apartmentsFurnished.sort((a, b) => a.rating.compareTo(b.rating));
        case SortOption.ratingDesc:
          _apartmentsFurnished.sort((a, b) => b.rating.compareTo(a.rating));
      }
    }
  }

  void searchApartments(String query, bool isRentList) {
    _searchQuery.value = query.toLowerCase();

    if (query.isEmpty) {
      _apartmentsFurnished.value = _apartmentsFurnishedSearch;
      _apartmentsRent.value = _apartmentsRentSearch;
      // fetchApartments();
      return;
    }
    if (!isRentList) {
      _apartmentsFurnished.value = _apartmentsFurnished.where((apartment) {
        return apartment.title.toLowerCase().contains(_searchQuery.value) ||
            apartment.governorate.toLowerCase().contains(_searchQuery.value) ||
            (apartment.city?.toLowerCase().contains(_searchQuery.value) ??
                false);
      }).toList();
    } else {
      _apartmentsRent.value = _apartmentsRent.where((apartment) {
        return apartment.title.toLowerCase().contains(_searchQuery.value) ||
            apartment.governorate.toLowerCase().contains(_searchQuery.value) ||
            (apartment.city?.toLowerCase().contains(_searchQuery.value) ??
                false);
      }).toList();
    }
  }
}

enum SortOption { priceAsc, priceDesc, ratingAsc, ratingDesc }

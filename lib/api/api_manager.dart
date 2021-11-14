import 'package:dio/dio.dart';
import 'package:vr_ui/models/vr_product_feature.dart';
import 'package:vr_ui/models/vr_product_model.dart';

class ApiClient {
  final Dio _dio = Dio();

  getVrProducts() async {
    String _baseUrl =
        "https://59b8726e92ccc3eb44b0c193eeef96f6.m.pipedream.net/products";

    Response response = await _dio.post(_baseUrl);

    if (response.statusCode == 200) {
      var fetchData = response.data;

      List<VRProduct> vrProductList =
          fetchData.map<VRProduct>((i) => VRProduct.fromJson(i)).toList();

      return vrProductList;
    }
  }

  getVrProductItem() async {
    
    String _baseUrlTwo =
        "https://59b8726e92ccc3eb44b0c193eeef96f6.m.pipedream.net/featured";

    Response response = await _dio.post(_baseUrlTwo);

    if (response.statusCode == 200) {
      var fetchProductData = response.data;

      List<ProductFeature> vrProductItem = fetchProductData
          .map<ProductFeature>((x) => ProductFeature.fromJson(x))
          .toList();

      return vrProductItem;
    }
  }
}

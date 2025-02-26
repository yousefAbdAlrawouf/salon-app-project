import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:salon_app/core/network/api_urls.dart';
import 'package:salon_app/features/products_and_services/models/createNewProductParams.dart';
import 'package:salon_app/features/products_and_services/models/product_model.dart';
import 'package:http/http.dart' as http;
import 'package:salon_app/features/products_and_services/models/service_model.dart';

class ProudctsServicesDataSource {
  Future<Either<String, List<ProductModel>>> getProducts() async {
    try {
      var headers = {
        'Authorization':
            '1134|zvVGmP4bmC1zB4FSoPMrW1j3xv7uRaSaK9Q7GMVdb8c00b37',
        "Accept": "application/json",
      }; // need to be changed

      var request = http.Request('GET', Uri.parse(ApiUrls.products));

      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      final responseBody = await response.stream.bytesToString();

      final decodedData = jsonDecode(responseBody);

      if (response.statusCode == 200) {
        List<ProductModel> products = [];

        if (decodedData != null) {
          for (Map item in decodedData['data']) {
            products
                .add(ProductModel.fromJson(Map<String, dynamic>.from(item)));
          }
        }

        return Right(products);
      } else {
        return Left(decodedData['message'] ?? "Unknown error");
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, List<ServiceModel>>> getServices() async {
    try {
      var headers = {
        'Authorization':
            '1134|zvVGmP4bmC1zB4FSoPMrW1j3xv7uRaSaK9Q7GMVdb8c00b37',
        "Accept": "application/json",
      }; // need to be changed

      var request = http.Request('GET', Uri.parse(ApiUrls.services));

      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      final responseBody = await response.stream.bytesToString();

      final decodedData = jsonDecode(responseBody);

      if (response.statusCode == 200) {
        List<ServiceModel> services = [];

        if (decodedData != null) {
          for (Map item in decodedData['data']) {
            services
                .add(ServiceModel.fromJson(Map<String, dynamic>.from(item)));
          }
        }

        return Right(services);
      } else {
        return Left(decodedData['message'] ?? "Unknown error");
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, List<ServiceModel>>> Addproduct(
      AddNewProductparams params) async {
    try {
      var headers = {
        'Authorization': '764|hjxseRdz2KvHXF2WwzLRMsi8jfOL9DdkvlVXKhOV33a81f27'
      };
      var request = http.MultipartRequest('POST', Uri.parse(ApiUrls.products));
      request.fields.addAll(params.toJson());

      request.files.add(
        http.MultipartFile.fromBytes(
          'image',
          [0xFF, 0xD8, 0xFF, 0xE0], // Example binary data (JPEG header bytes)
          filename: 'dummy.jpg',
        ),
      );

      request.headers.addAll({
        "Accept": "application/json",
      });

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
        return right([]);
      } else {
        print(response.reasonPhrase);
        return left(response.reasonPhrase.toString());
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}

import 'dart:convert';

import 'package:bundtask/data/dummyData.dart';
import 'package:bundtask/data/models/CompanyModels.dart';
import 'package:dio/dio.dart';

class CompanyService {
  static Future<List<Company>> fetchCompanies() async {
    Dio dio = Dio();
    String apiUrl = 'https://httpbin.org/anything';

    try {
      // Convert the list of Company objects to a list of JSON maps
      List<Map<String, dynamic>> companyJsonList =
      DummyData.dummyCompanies.map((company) => company.toJson()).toList();

      // Make the HTTP POST request
      Response response = await dio.post(apiUrl, data: {'data': companyJsonList});

      // Parse the response and convert it back to a list of Company objects
      Map<String, dynamic> responseData = response.data;
      if (responseData.containsKey('data')) {
        dynamic data = responseData['data'];
        if (data is String) {
          // Parse the data string
          List<dynamic> parsedData = jsonDecode(data)['data'];
          List<Company> companies = parsedData
              .map((json) => Company.fromJson(json as Map<String, dynamic>))
              .toList();
          return companies;
        } else {
          // Handle the case where the 'data' field is not a string
          print("Error: 'data' field is not a string");
          return [];
        }
      } else {
        // Handle the case where the 'data' field is missing
        print("Error: 'data' field is missing");
        return [];
      }
    } catch (error) {
      // Throw the error to be caught by the FutureBuilder
      print("Error: $error");
      throw error;
    }
  }
}

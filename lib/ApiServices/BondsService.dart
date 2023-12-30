import 'dart:convert';

import 'package:bundtask/data/dummyData.dart';
import 'package:dio/dio.dart';

import '../data/models/BondsModel.dart';

class BondService{

  static Future<List<Bond>> fetchBonds() async {
    Dio dio = Dio();
    String apiUrl = 'https://httpbin.org/anything';

    try {
      // Convert the list of Bond objects to a list of JSON maps
      List<Map<String, dynamic>> bondJsonList =
      DummyData.dummyBonds.map((bond) => bond.toJson()).toList();

      // Make the HTTP POST request
      Response response = await dio.post(apiUrl, data: {'data': bondJsonList});

      // Parse the response and convert it back to a list of Bond objects
      Map<String, dynamic> responseData = response.data;
      if (responseData.containsKey('data')) {
        dynamic data = responseData['data'];
        if (data is String) {
          // Parse the data string
          List<dynamic> parsedData = jsonDecode(data)['data'];
          List<Bond> bonds = parsedData
              .map((json) => Bond.fromJson(json as Map<String, dynamic>))
              .toList();
          return bonds;
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

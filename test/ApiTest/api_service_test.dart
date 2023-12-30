import 'package:bundtask/ApiServices/CompaniesService.dart';
import 'package:bundtask/data/models/CompanyModels.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('API Service Tests', () {
    test('Fetch Data Test', () async {
      final List<Company> data = await CompanyService.fetchCompanies();
      expect(data, isNotNull);
    });
  });
}

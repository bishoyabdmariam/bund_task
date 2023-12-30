import 'package:bundtask/ApiServices/BondsService.dart';
import 'package:bundtask/data/models/BondsModel.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('API Service Tests', () {
    test('Fetch Data Test', () async {
      final List<Bond> data = await BondService.fetchBonds();
      expect(data, isNotNull);
    });
  });
}

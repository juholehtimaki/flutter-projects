import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart'; // For formatting and date manipulation
import 'package:porssisahko/models/hourly_price_entry.dart';

final priceProvider = FutureProvider<List<HourlyPriceEntry>>((ref) async {
  final response = await http
      .get(Uri.parse('https://api.porssisahko.net/v1/latest-prices.json'));

  if (response.statusCode == 200) {
    final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    final List<dynamic> pricesList = jsonResponse['prices'];

    DateTime nowGmtPlus2 = DateTime.now().toUtc().add(const Duration(hours: 2));
    String todayGmtPlus2 = DateFormat('yyyy-MM-dd').format(nowGmtPlus2);

    final List<HourlyPriceEntry> prices = pricesList
        .map((item) => HourlyPriceEntry.fromJson(item))
        .where((entry) {
          // Format the startDate of each entry as yyyy-MM-dd to check if it's "today" in GMT+2
          String entryDateGmtPlus2 =
              DateFormat('yyyy-MM-dd').format(entry.startDate);
          return entryDateGmtPlus2 == todayGmtPlus2;
        })
        .toList()
        .reversed
        .toList();

    // Log the filtered data for debugging
    for (var entry in prices) {
      print(
          'Price: ${entry.price}, Start Date (GMT+2): ${entry.formattedStartDate().toString()}, End Date (GMT+2): ${entry.formattedEndDate()}');
    }

    return prices;
  } else {
    print(
        'Failed to load data: ${response.statusCode}'); // Log the error status
    throw Exception('Failed to load data');
  }
});

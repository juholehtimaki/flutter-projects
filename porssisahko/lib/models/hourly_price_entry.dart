import 'package:intl/intl.dart';

class HourlyPriceEntry {
  final double price;
  final DateTime startDate;
  final DateTime endDate;

  HourlyPriceEntry(
      {required this.price, required this.startDate, required this.endDate});

  factory HourlyPriceEntry.fromJson(Map<String, dynamic> json) {
    DateTime parsedStartDate = DateTime.parse(json['startDate']).toLocal();
    DateTime parsedEndDate = DateTime.parse(json['endDate']).toLocal();
    double doublePrice;
    if (json['price'] is double) {
      doublePrice = json['price'];
    } else {
      doublePrice = double.tryParse(json['price'].toString()) ?? 0.0;
    }

    return HourlyPriceEntry(
      price: doublePrice,
      startDate: parsedStartDate,
      endDate: parsedEndDate,
    );
  }

  String formattedStartDate() {
    return DateFormat('yyyy-dd-MM HH:mm').format(startDate);
  }

  String formattedEndDate() {
    return DateFormat('yyyy-dd-MM HH:mm').format(endDate);
  }
}

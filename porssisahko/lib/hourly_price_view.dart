import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:porssisahko/price_provider.dart';

class HourlyPriceview extends ConsumerWidget {
  const HourlyPriceview({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hourlyPriceData = ref.watch(priceProvider);

    return hourlyPriceData.when(
        data: (data) {
          // Display the fetched data in a ListView
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(data[index].startDate.toString()),
              );
            },
          );
        },
        error: (err, stack) => Center(child: Text('Error: $err')),
        loading: () => const Center(child: CircularProgressIndicator()));
  }
}

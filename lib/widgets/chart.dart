import 'package:expensesapp/widgets/chart_bar.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;
  const Chart(this.recentTransactions, {Key? key}) : super(key: key);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0.0;

      for (int i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }

      return {
        "day": DateFormat.E().format(weekDay).substring(0, 1),
        "amount": totalSum,
      };
    }).reversed.toList();
  }

  double get totalspending {
    return groupedTransactionValues.fold(
      0.0,
      (sum, item) => sum + (item['amount'] as double),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: groupedTransactionValues
              .map(
                (tx) => Flexible(
                  fit: FlexFit
                      .tight, //FlexFit.tight is same as using Expanded as a Widget for taking the maximum space
                  child: ChartBar(
                    label: tx['day'].toString(),
                    spendingAmount: (tx['amount'] as double),
                    spendingPercentOfTotal: totalspending == 0.0
                        ? 0.0
                        : (tx['amount'] as double) / totalspending,
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

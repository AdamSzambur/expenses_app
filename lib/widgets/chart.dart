import 'package:flutter/material.dart';
import 'chart_bar.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> transactionList;

  Chart(this.transactionList);

  List<Map<String, Object>> get grupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      double totalSum = 0.0;

      for (var i = 0; i < transactionList.length; i++) {
        if (transactionList[i].date.day == weekDay.day &&
            transactionList[i].date.month == weekDay.month &&
            transactionList[i].date.year == weekDay.year) {
          totalSum += transactionList[i].amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 2),
        'amount': totalSum,
      };
    });
  }

  double get totalAmountPerDay {
    return grupedTransactionValues.fold(0.0, (sum, element) {
      return sum + element['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: grupedTransactionValues.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                data['day'],
                data['amount'],
                totalAmountPerDay == 0.00
                    ? 0.00
                    : ((data['amount'] as double) / totalAmountPerDay),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

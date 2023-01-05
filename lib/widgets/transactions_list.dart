import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';
import 'dart:io';

class TransactionsList extends StatelessWidget {
  final List<Transaction> userTransactions;

  TransactionsList({@required this.userTransactions});

  String getCurrency() {
    var format = NumberFormat.simpleCurrency(locale: Platform.localeName);
    return format.currencySymbol;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemCount: userTransactions.length,
        itemBuilder: (ctx, index) {
          return Card(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                      width: 2,
                    ),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    '${userTransactions[index].amount.toStringAsFixed(2)} ${getCurrency()}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userTransactions[index].title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      DateFormat.yMMMd().format(userTransactions[index].date),
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

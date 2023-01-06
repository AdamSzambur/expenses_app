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
    return Flexible(
      fit: FlexFit.tight,
      child: Container(
        child: userTransactions.isEmpty
            ? Column(
                children: [
                  Text(
                    'No transactions added yet !!!',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 200,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              )
            : ListView.builder(
                itemCount: userTransactions.length,
                itemBuilder: (ctx, index) {
                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 15,
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: EdgeInsets.all(6),
                          child: FittedBox(
                            child: Text(
                                '${userTransactions[index].amount.toStringAsFixed(2)} ${getCurrency()}'),
                          ),
                        ),
                      ),
                      title: Text(
                        userTransactions[index].title,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      subtitle: Text(
                        DateFormat.yMMMd().format(userTransactions[index].date),
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  );

                  // wczesniej przygotowana lista
                  // Card(
                  //   child: Row(
                  //     children: [
                  //       Container(
                  //         margin: EdgeInsets.symmetric(
                  //             vertical: 10, horizontal: 15),
                  //         decoration: BoxDecoration(
                  //           border: Border.all(
                  //             color: Theme.of(context).primaryColor,
                  //             width: 2,
                  //           ),
                  //         ),
                  //         padding: EdgeInsets.all(10),
                  //         child: Text(
                  //           '${userTransactions[index].amount.toStringAsFixed(2)} ${getCurrency()}',
                  //           style: TextStyle(
                  //             fontWeight: FontWeight.bold,
                  //             fontSize: 15,
                  //             color: Theme.of(context).primaryColor,
                  //           ),
                  //         ),
                  //       ),
                  //       Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(
                  //             userTransactions[index].title,
                  //             style: Theme.of(context).textTheme.headline6,
                  //           ),
                  //           Text(
                  //             DateFormat.yMMMd()
                  //                 .format(userTransactions[index].date),
                  //             style: TextStyle(
                  //               color: Colors.grey,
                  //             ),
                  //           ),
                  //         ],
                  //       )
                  //     ],
                  //   ),
                  // );
                },
              ),
      ),
    );
  }
}

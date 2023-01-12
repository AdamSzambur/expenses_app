import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './transaction_item.dart';

class TransactionsList extends StatelessWidget {
  final List<Transaction> userTransactions;
  final Function deleteTransaction;

  TransactionsList(this.userTransactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return userTransactions.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraints) {
              return Column(
                children: [
                  Text(
                    'No transactions added yet !!!',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: constraints.maxHeight * 0.7,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              );
            },
          )
        : ListView.builder(
            itemCount: userTransactions.length,
            itemBuilder: (ctx, index) {
              return TransactionItem(
                  userTransaction: userTransactions[index],
                  deleteTransaction: deleteTransaction);
            },
          );
  }
}

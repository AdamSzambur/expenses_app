import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required this.userTransaction,
    @required this.deleteTransaction,
  }) : super(key: key);

  final Transaction userTransaction;
  final Function deleteTransaction;

  get getCurrency {
    return NumberFormat.simpleCurrency(locale: Platform.localeName)
        .currencySymbol;
  }

  @override
  Widget build(BuildContext context) {
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
              child: Text(userTransaction.amount.toStringAsFixed(2) +
                  ' ' +
                  getCurrency),
            ),
          ),
        ),
        title: Text(
          userTransaction.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(userTransaction.date),
          style: TextStyle(color: Colors.grey),
        ),
        trailing: MediaQuery.of(context).size.width > 400
            ? TextButton.icon(
                onPressed: () => deleteTransaction(userTransaction.id),
                icon: Icon(
                  Icons.delete,
                  color: Theme.of(context).errorColor,
                ),
                label: Text(
                  'Delete',
                  style: TextStyle(color: Theme.of(context).errorColor),
                ))
            : IconButton(
                icon: Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => deleteTransaction(userTransaction.id),
              ),
      ),
    );
  }
}

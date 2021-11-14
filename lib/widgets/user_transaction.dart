import 'package:expensesapp/widgets/new_transaction.dart';
import 'package:expensesapp/widgets/transaction_list.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';

class UserTransaction extends StatefulWidget {
  const UserTransaction({Key? key}) : super(key: key);

  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _transactions = [
    Transaction(
      id: 't1',
      title: 'New shoes',
      amount: 50.25,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Weekly Groceries',
      amount: 12.29,
      date: DateTime.now(),
    ),
  ];

  void _addTransaction(String title, double amount) {
    final Transaction newTx = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addTransaction),
        TransactionList(_transactions),
      ],
    );
  }
}

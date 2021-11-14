import 'package:expensesapp/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  const TransactionList(this.transactions, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 385,
      child: ListView.builder(
        itemBuilder: (context, index) {
          final tx = transactions[index];
          return Card(
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 15,
                  ),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.deepPurple,
                      width: 2,
                    ),
                  ),
                  child: Text(
                    "\$${tx.amount}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.deepPurple,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tx.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      DateFormat("dd-MM-yyyy").format(tx.date),
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}

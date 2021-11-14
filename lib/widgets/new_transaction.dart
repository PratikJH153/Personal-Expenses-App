import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  NewTransaction(this.addTx, {Key? key}) : super(key: key);

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: "Title",
              ),
            ),
            TextField(
              controller: _amountController,
              decoration: const InputDecoration(
                labelText: "Amount",
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                primary: Colors.deepPurple,
              ),
              onPressed: () => addTx(
                _titleController.text,
                double.parse(_amountController.text),
              ),
              child: const Text("Add Transaction"),
            ),
          ],
        ),
      ),
    );
  }
}

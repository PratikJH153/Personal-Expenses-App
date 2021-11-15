import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;
  const NewTransaction(this.addTx, {Key? key}) : super(key: key);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final TextEditingController _titleController = TextEditingController();

  final TextEditingController _amountController = TextEditingController();

  void submitData() {
    final String _enteredTitle = _titleController.text;
    final double _enteredAmount = double.parse(_amountController.text);

    if (_enteredTitle.isEmpty || _enteredAmount <= 0) {
      return;
    }

    widget.addTx(
      _titleController.text,
      double.parse(_amountController.text),
    );

    Navigator.of(context).pop();
  }

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
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              controller: _amountController,
              decoration: const InputDecoration(
                labelText: "Amount",
              ),
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
            ),
            TextButton(
              style: TextButton.styleFrom(
                primary: Colors.deepPurple,
              ),
              onPressed: submitData,
              child: const Text("Add Transaction"),
            ),
          ],
        ),
      ),
    );
  }
}

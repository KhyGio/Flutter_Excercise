import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../models/expense.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key});

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  void onCheckPressed() {
    String title = _titleController.text;
    double amount = double.parse(_amountController.text);

    Expense newExpense = Expense(
      amount: amount,
      title: title,
      category: Category.food,
      date: DateTime.now(),
    );

    Navigator.pop<Expense>(context, newExpense);
  }

  void onCancelPressed() {
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(label: Text('Title')),
          ),

          SizedBox(height: 20),
          TextField(
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
            ],
            controller: _amountController,
            maxLength: 50,
            decoration: InputDecoration(
              prefix: Text("\$"),
              label: const Text('Amount'),
            ),
          ),

          Spacer(),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: onCancelPressed, child: Text("Cancel")),
              ElevatedButton(onPressed: onCheckPressed, child: Text("Save")),
            ],
          ),
        ],
      ),
    );
  }
}

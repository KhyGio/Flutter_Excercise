https://github.com/KhyGio/Flutter_Excercise.gitimport 'package:flutter/material.dart';

import '../../data/expenses_data.dart';
import '../../models/expense.dart';

class ExpenseCard extends StatelessWidget {
  const ExpenseCard({super.key, required this.expense});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          title: Text(expense.title),
          subtitle: Text(expense.amount.toString()),
          leading: Icon(expense.category.icon),
        ),
      ),
    );
  }
}

class ExpenseForm extends StatefulWidget {
  final Function(Expense) onSubmit;

  const ExpenseForm({super.key, required this.onSubmit});

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  TextEditingController titleController = TextEditingController();
  TextEditingController amountContorller = TextEditingController();
  String enteredTitle = "";
  String enteredAmount = "";
  Category enteredCategory = Category.food;

  @override
  void dispose() {
    titleController.dispose();
    amountContorller.dispose();
    super.dispose();
  }

  void onClose() {
    Navigator.pop(context);
  }

  void onSubmit() {
    Expense expense = Expense(
      title: titleController.text,
      amount: double.parse(amountContorller.text),
      date: DateTime.now(),
      category: enteredCategory,
    );

    widget.onSubmit(expense);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            const Text("Expense Form"),
            TextField(
              onChanged: (value) {
                setState(() {
                  enteredTitle = titleController.text;
                });
              },
              controller: titleController,
              decoration: InputDecoration(label: Text("Input Title")),
            ),
            TextField(
              controller: amountContorller,
              decoration: InputDecoration(label: Text("Input Amount")),
            ),
            Text(enteredTitle),
            ElevatedButton(
              onPressed: () => onClose(),
              child: const Text("Close"),
            ),
            ElevatedButton(
              onPressed: () => onSubmit(),
              child: const Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({super.key});

  @override
  State<ExpensesScreen> createState() {
    return _ExpensesScreenState();
  }
}

class _ExpensesScreenState extends State<ExpensesScreen> {
  void onAddPressed() {
    showModalBottomSheet(
      context: context,
      builder: (context) => ExpenseForm(onSubmit: addExpense),
    );
  }

  void addExpense(Expense expense) {
    allExpenses.add(expense);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () => onAddPressed(), icon: Icon(Icons.add)),
        ],
        backgroundColor: Colors.blue[700],
        title: const Text('Ronan-The-Best Expenses App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: allExpenses.length,
          itemBuilder: (context, i) => Dismissible(
            key: ObjectKey(allExpenses[i]),
            background: Container(
              color: Colors.red,
            ),
            direction: DismissDirection.startToEnd,
            onDismissed: (direction) {
              setState(() {
                allExpenses.removeAt(i);
              });
            },
            child: ExpenseCard(expense: allExpenses[i]),
          ),
        ),
      ),
    );
  }
}

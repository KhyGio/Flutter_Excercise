import 'package:flutter/material.dart';

class GroceryForm extends StatefulWidget {
  const GroceryForm({super.key});
  @override
  State<GroceryForm> createState() => _GroceryFormState();
}

class _GroceryFormState extends State<GroceryForm> {
  TextEditingController titleController = TextEditingController();
  TextEditingController amountContorller = TextEditingController();
  void onClose() {
    Navigator.pop(context);
  }

  void onSubmit() {
    Navigator.pop(context);
  }



  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            AppBar(title: const Text("ADD FOOD")),
            TextField(
              controller: titleController,
              decoration: InputDecoration(label: Text("Title Input")),
            ),
            TextField(
              controller: amountContorller,
              decoration: InputDecoration(label: Text("Amount Input")),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(onPressed: onClose, child: const Text("Close")),
                ElevatedButton(
                  onPressed: onSubmit,
                  child: const Text("Add Item"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

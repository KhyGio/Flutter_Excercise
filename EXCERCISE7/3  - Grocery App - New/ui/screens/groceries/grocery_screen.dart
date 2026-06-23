import 'package:flutter/material.dart';
import 'package:project_mobile/3%20%20-%20Grocery%20App%20-%20New/ui/screens/groceries/grocery_form.dart';
import '../../../data/mock_grocery_data.dart';
import 'grocery_tile.dart';

class GroceryScreen extends StatefulWidget {
  const GroceryScreen({super.key});

  @override
  State<GroceryScreen> createState() => GroceryScreenState();
}

class GroceryScreenState extends State<GroceryScreen> {
  void onAddpress() {
    showModalBottomSheet(
      context: context,
      builder: (context) => GroceryForm(),
    );
  }
  

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child: Text('No items added yet.'));

    if (allGroceryItems.isNotEmpty) {
      content = ListView.builder(
        itemCount: allGroceryItems.length,
        itemBuilder: (ctx, index) {
          return GroceryTile(item: allGroceryItems[index]);
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [IconButton(onPressed: () => onAddpress(), icon: const Icon(Icons.add))],
      ),
      body: content,
    );
  }
}

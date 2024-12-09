import 'package:flutter/material.dart';
import '../models/menu_item.dart';
import '../services/api_service.dart';

class MenuScreen extends StatelessWidget {
  final String restaurantId;

  // Ensure the constructor has a named key parameter and is const
  const MenuScreen({Key? key, required this.restaurantId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ApiService apiService = ApiService();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Items'),
      ),
      body: FutureBuilder<List<MenuItem>>(
        future: apiService.fetchMenuItems(restaurantId), // Ensure the method exists
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('An error occurred'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final menuItem = snapshot.data![index];
                return ListTile(
                  title: Text(menuItem.name),
                  subtitle: Text('Price: \$${menuItem.price.toStringAsFixed(2)}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}

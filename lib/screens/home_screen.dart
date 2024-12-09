import 'package:flutter/material.dart';
import 'restaurant_list_screen.dart';
import 'add_restaurant_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food App Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RestaurantListScreen()),
              ),
              child: Text('View Restaurants'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddRestaurantScreen()),
              ),
              child: Text('Add Restaurant'),
            ),
          ],
        ),
      ),
    );
  }
}

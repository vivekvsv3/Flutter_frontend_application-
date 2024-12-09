import 'package:flutter/material.dart';
import '../models/restaurant.dart';
import '../services/api_service.dart';

class RestaurantListScreen extends StatefulWidget {
  // Add a named key parameter and declare the constructor as const
  const RestaurantListScreen({Key? key}) : super(key: key);

  @override
  State<RestaurantListScreen> createState() => _RestaurantListScreenState();
}

class _RestaurantListScreenState extends State<RestaurantListScreen> {
  final ApiService apiService = ApiService();
  List<Restaurant> _restaurants = [];

  @override
  void initState() {
    super.initState();
    _fetchRestaurants();
  }

  Future<void> _fetchRestaurants() async {
    try {
      _restaurants = await apiService.fetchRestaurants();
      setState(() {});
    } catch (e) {
      // Show an error dialog if fetching restaurants fails
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: const Text('Failed to load restaurants. Please try again.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurants'),
      ),
      body: _restaurants.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: _restaurants.length,
        itemBuilder: (context, index) {
          final restaurant = _restaurants[index];
          return ListTile(
            title: Text(restaurant.name),
            subtitle: Text(restaurant.locationID), // Corrected field
            onTap: () {
              // Navigate to a new screen with restaurant details
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      RestaurantDetailScreen(restaurant: restaurant),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// Example RestaurantDetailScreen (optional)
class RestaurantDetailScreen extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantDetailScreen({Key? key, required this.restaurant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Location ID: ${restaurant.locationID}'),
            Text('Contact ID: ${restaurant.contactID}'),
            Text('Menu ID: ${restaurant.menuID}'),
            Text('Description: ${restaurant.restaurantDescription}'),
          ],
        ),
      ),
    );
  }
}

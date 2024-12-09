import 'package:flutter/material.dart';
import '../services/api_service.dart';

class AddRestaurantScreen extends StatelessWidget {
  final ApiService apiService = ApiService();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();

  // Constructor to include the named key parameter
  AddRestaurantScreen({Key? key}) : super(key: key);

  void _addRestaurant(BuildContext context) async {
    // Save reference to Navigator to avoid using BuildContext after async
    final navigator = Navigator.of(context);

    try {
      // Ensure correct API parameter type
      Map<String, dynamic> restaurantData = {
        "name": nameController.text,
        "location": locationController.text,
      };
      await apiService.addRestaurant(restaurantData);

      // Safely navigate back after async operation
      navigator.pop(); // Return to the previous screen after submission
    } catch (e) {
      // Show error dialog if the API call fails
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Failed to add restaurant. Please try again.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('OK'),
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
        title: Text('Add Restaurant'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Restaurant Name'),
            ),
            TextField(
              controller: locationController,
              decoration: InputDecoration(labelText: 'Location'),
            ),
            SizedBox(height: 16.0), // Add spacing between fields and button
            ElevatedButton(
              onPressed: () => _addRestaurant(context),
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}

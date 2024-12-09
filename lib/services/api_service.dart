import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/menu_item.dart';
import '../models/restaurant.dart';

class ApiService {
  final String baseUrl = 'http://localhost:5000/api';

  Future<List<Restaurant>> fetchRestaurants() async {
    var response = await http.get(Uri.parse('$baseUrl/vendors/recommend'));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((dynamic item) => Restaurant.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load restaurants');
    }
  }

  Future<void> addRestaurant(Map<String, dynamic> restaurantData) async {
    var response = await http.post(
      Uri.parse('$baseUrl/vendors/add'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(restaurantData),
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to add restaurant');
    }
  }

  Future<List<MenuItem>> fetchMenuItems(String restaurantId) async {
    final response = await http.get(Uri.parse('$baseUrl/menu/$restaurantId'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((dynamic item) => MenuItem.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load menu items');
    }
  }
}
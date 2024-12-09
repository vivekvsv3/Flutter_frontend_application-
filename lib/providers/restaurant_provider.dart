import 'package:flutter/foundation.dart';
import '../models/restaurant.dart';
import '../services/api_service.dart';

class RestaurantProvider with ChangeNotifier {
  List<Restaurant> _restaurants = [];
  final ApiService _apiService = ApiService();

  List<Restaurant> get restaurants => _restaurants;

  fetchRestaurants() async {
    _restaurants = await _apiService.fetchRestaurants();
    notifyListeners();
  }
}

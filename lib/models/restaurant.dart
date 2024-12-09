class Restaurant {
  final String id;
  final String name;
  final String restaurantDescription;
  final String locationID;
  final String contactID;
  final String menuID;
  final String branchType;
  final int capacity;
  final bool customerWifi;
  final bool parking;
  final String restaurantOwner;
  final String restaurantLogoUrl;
  final Map<String, String> restaurantSocialMediaLinks;
  final String restaurantLicenseNumber;
  final String specialAttractions;

  Restaurant({
    required this.id,
    required this.name,
    required this.restaurantDescription,
    required this.locationID,
    required this.contactID,
    required this.menuID,
    required this.branchType,
    required this.capacity,
    required this.customerWifi,
    required this.parking,
    required this.restaurantOwner,
    required this.restaurantLogoUrl,
    required this.restaurantSocialMediaLinks,
    required this.restaurantLicenseNumber,
    required this.specialAttractions,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id: json['_id'],
      name: json['restaurantName'],
      restaurantDescription: json['restaurantDescription'],
      locationID: json['locationID'],
      contactID: json['contactID'],
      menuID: json['menuID'],
      branchType: json['branchType'],
      capacity: json['capacity'],
      customerWifi: json['customerWifi'],
      parking: json['parking'],
      restaurantOwner: json['restaurantOwner'],
      restaurantLogoUrl: json['restaurantLogoUrl'],
      restaurantSocialMediaLinks: Map<String, String>.from(json['restaurantSocialMediaLinks']),
      restaurantLicenseNumber: json['restaurantLicenseNumber'],
      specialAttractions: json['specialAttractions'],
    );
  }
}

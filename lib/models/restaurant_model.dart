
class Restaurant {
  final String? name;
  final String? cuisine;
  final String? price;
  final double? rating;
  final Location? location;
  final Hours? hours;
  final String? website;
  final String? phoneNumber;

  Restaurant({
     this.name,
     this.cuisine,
    this.price,
    this.rating,
     this.location,
     this.hours,
     this.website,
    this.phoneNumber,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      name: json['name'],
      cuisine: json['cuisine'],
      price: json['price'],
      rating: json['rating'].toDouble(),
      location: Location.fromJson(json['location']),
      hours: Hours.fromJson(json['hours']),
      website: json['website'],
      phoneNumber: json['phone number'],
    );
  }
}

class Location {
  final String address;
  final String city;
  final String state;
  final String zipCode;

  Location({
    required this.address,
    required this.city,
    required this.state,
    required this.zipCode,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      address: json['address'],
      city: json['city'],
      state: json['state'],
      zipCode: json['zip code'],
    );
  }
}

class Hours {
  final String open;
  final String close;

  Hours({required this.open, required this.close});

  factory Hours.fromJson(Map<String, dynamic> json) {
    return Hours(
      open: json['open'],
      close: json['close'],
    );
  }
}

class Dish {
  final String name;
  final String cuisine;
  final String price;
  final String description;

  Dish({
    required this.name,
    required this.cuisine,
    required this.price,
    required this.description,
  });

  factory Dish.fromJson(Map<String, dynamic> json) {
    return Dish(
      name: json['name'],
      cuisine: json['cuisine'],
      price: json['price'],
      description: json['description'],
    );
  }
}
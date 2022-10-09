
class Offices {
  late final List<Office> list;

  Offices();
}

class Office {
  final String id;
  final String name;
  final String image;
  final String phone;
  final String region;
  final String address;
  final int? lat;
  final int? lng;


  Office({
    required this.id,
    required this.name,
    required this.image,
    this.phone = '',
    this.region = '',
    this.address = '',
    this.lat,
    this.lng,
  });

  factory Office.fromJson(Map<String, dynamic> jsonMap) {
    return Office(
      id: jsonMap["id"] as String, 
      name: jsonMap["name"] as String, 
      image: jsonMap["image"] as String,
      phone: jsonMap["phone"] as String,
      region: jsonMap["region"] as String,
      address: jsonMap["address"] as String,
      lat: jsonMap["lat"] as int,
      lng: jsonMap["lng"] as int
    );
  }
}


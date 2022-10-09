

class Offices {
  final List<Office> list;

  Offices({required officesList}) : list = officesList;

  factory Offices.fromJson(List jsonMap) {
    List<Office> officesList = jsonMap.map((office) => Office.fromJson(office)).toList();

    return Offices(officesList: officesList);
  }
}

class Office {
  final String id;
  final String name;
  final String image;
  final String phone;
  final String region;
  final String address;
  final double? lat;
  final double? lng;


  Office({
    required this.id,
    required this.name,
    this.image   = '',
    this.phone   = '',
    this.region  = '',
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
      lat: jsonMap["lat"] as double,
      lng: jsonMap["lng"] as double
    );
  }
}


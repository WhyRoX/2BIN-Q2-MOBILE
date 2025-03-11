class Property {
  bool isSelling;
  bool isFlat;
  int sqMeters;
  int nbRooms;
  int price;

  Property({
    required this.isSelling,
    required this.isFlat,
    required this.sqMeters,
    required this.nbRooms,
    required this.price,
  });
}

List<Property> _createProperties() {
  final propertiesSell = [
    for (var i = 0; i < 2; i++)
      Property(
        isSelling: true,
        isFlat: true,
        sqMeters: 100,
        nbRooms: i + 1,
        price: 100000,
      ),
  ];

  final propertiesRent = [
    for (var i = 0; i < 2; i++)
      Property(
        isSelling: false,
        isFlat: false,
        sqMeters: 100,
        nbRooms: i + 1,
        price: 1000,
      ),
  ];

  return [...propertiesSell, ...propertiesRent];
}

final defaultProperties = _createProperties();

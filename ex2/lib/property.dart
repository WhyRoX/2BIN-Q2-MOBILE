class Property {
  bool isSelling;
  bool isFlat;
  double sqMeters;
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

final propertiesSell = [
  for (var i = 1; i <= 2; i++)
    Property(
      isSelling: true,
      isFlat: true,
      sqMeters: 100*i*2.34,
      nbRooms: i * 5,
      price: 100000*i,
    ),
];

final propertiesRent = [
  for (var i = 1; i <= 2; i++)
    Property(
      isSelling: false,
      isFlat: false,
      sqMeters: 100*i*1.53,
      nbRooms: i + 1,
      price: 1000*i,
    ),
];

import 'package:flutter/material.dart';

import 'property.dart';

class PropertyWidget extends StatelessWidget {
  final Property property;

  const PropertyWidget({
    super.key,
    required this.property,
  });

  @override
  Widget build(BuildContext context) {

    final String toSell = property.isSelling ? "For sale" : "For rent";
    final String type = property.isFlat ? "flat" : "house";

    return ListTile(
      title: Text("$toSell: $type of ${property.sqMeters} m2"),
      subtitle: Text("${property.nbRooms} bedrooms - ${property.price} €"),
    );
  }
}
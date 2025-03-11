import 'package:ex2/property.dart';
import 'package:ex2/property_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool sales = true;

  @override
  Widget build(BuildContext context) {
    final properties = sales ? propertiesSell : propertiesRent;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Properties"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  "Rentals",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 8),
                Switch(
                  value: sales,
                  onChanged: (value) => setState(() => sales = !sales),
                ),
                const SizedBox(width: 8),
                const Text("Sales", style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            Expanded(
              child: ListView.separated(
                itemCount: properties.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder:
                    (context, index) =>
                        PropertyWidget(property: properties[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

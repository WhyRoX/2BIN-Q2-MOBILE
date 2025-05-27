// ce fichier pourra contenir vos méthodes permettant de sauvegarder et récupérer l’état du panier.
// affiche la liste des plats différents présents dans le panier de l’utilisateur.
import 'package:shared_preferences/shared_preferences.dart';

import '../models/cart_item.dart';
import '../models/dish.dart';

Future<void> save(List<CartItem> cart) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.clear();

  for (var item in cart) {
    await prefs.setInt(item.dish.name, item.count);
  }
}

Future<List<CartItem>> load(List<Dish> dishes) async {
  final prefs = await SharedPreferences.getInstance();
  List<CartItem> cart = [];

  for (var dish in dishes) {
    int count = prefs.getInt(dish.name) ?? 0;
    if (count > 0) {
      cart.add(CartItem(dish: dish, count: count));
    }
  }

  return cart;
}

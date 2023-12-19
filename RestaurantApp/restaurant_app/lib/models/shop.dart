import 'package:flutter/material.dart';
import 'package:restaurant_app/services/food_service.dart';

class Shop extends ChangeNotifier {
  final List<Food> _foodMenu = [
    Food(
        name: 'Ekmek Arası Kebap',
        price: '90',
        imagePath: 'lib/images/doner-kebab.png',
        rating: '4',
        describe:
            "Kıtır ekmeğin arasında özenle hazırlanmış döner eti, taze sebzeler ve lezzetli soslarla buluşuyor. Bu eşsiz ekmek arası kebap, doyurucu ve lezzetli bir öğün vaat ediyor. Bir ısırıkta Türk mutfağının eşsiz lezzetini keşfedin!"),
    Food(
        name: 'Şiş Kebap',
        price: '120',
        imagePath: 'lib/images/sis-kebab.png',
        rating: '4',
        describe:
            "Izgara şişlerde kızartılmış etin muhteşem lezzeti, yanında taze sebzeler ve özel baharatlarla buluşuyor. Geleneksel Türk şiş kebap, sizi bir Anadolu lezzet yolculuğuna çıkaracak. Her bir ısırık, lezzetin doruklarına çıkmanızı sağlayacak."),
    Food(
        name: 'Dürüm Kebap',
        price: '90',
        imagePath: 'lib/images/kebab.png',
        rating: '4',
        describe:
            "Taze pişirilmiş lavaşın içine sarmış olduğumuz nefis döner eti, taze sebzeler ve özel soslarla buluşuyor. Pratik ve doyurucu bir lezzet olan dürüm kebap, her anınıza lezzet katmak için ideal bir tercih."),
    Food(
        name: 'Servis Kebap',
        price: '140',
        imagePath: 'lib/images/kebap.png',
        rating: '4',
        describe:
            "Özel tabakta sunulan nefis kebap, etin özenle pişirilmiş halini ve yanında geleneksel garnitürleriyle birlikte sunuyor. Servis kebap, lezzetin şıklıkla buluştuğu bir deneyim sunuyor."),
    Food(
        name: 'Menü Kebap',
        price: '160',
        imagePath: 'lib/images/logo.png',
        rating: '4',
        describe:
            "Çeşitli kebap lezzetlerini bir araya getiren bu özel menü, damak zevkinizi keşfetmeniz için ideal bir seçenek. Şiş kebaptan ekmek arası kebaba, her biri özenle seçilmiş bu menü, doyurucu bir kebap keyfi sunuyor."),
  ];

  //customer cart
  List<Food> _cart = [];
  // getter medhods
  List<Food> get cart => _cart;
  List<Food> get foodMenu => _foodMenu;

  // add to cart
  void addToCart(Food foodItem, int quantity) {
    for (int i = 1; i < quantity; i++) {
      _cart.add(foodItem);
      notifyListeners();
    }
  }

  // remove from cart
  void removeToCart(Food foodItem) {
    _cart.remove(foodItem);
    notifyListeners();
  }
}

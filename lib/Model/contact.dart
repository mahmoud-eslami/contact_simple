import 'package:flutter/material.dart';

class Item {
  final String name, phone;
  bool isFav;

  Item({@required this.name, @required this.phone, @required this.isFav});

  Item.fromDb(Map<String, dynamic> map)
      : name = map['name'],
        phone = map['phone'],
        isFav = map['is_fav'] == 0;

  Map<String, dynamic> toMapForDb() {
    var map = Map<String , dynamic>();
    map['name'] = name;
    map['phone'] = phone;
    map['is_fav'] = isFav ? 1 : 0 ;
    return map;
  }
}

class Contacts extends ChangeNotifier {
  List<Item> itemList = new List();

//  List<Item> favList = new List();

  void addContact(Item item) {
    itemList.add(item);
    notifyListeners();
  }

  void changeFavState(int index) {
    itemList[index].isFav = !(itemList[index].isFav);
    notifyListeners();
  }

  void removeFav(int index) {
    favorites()[index].isFav = false;
    notifyListeners();
  }

//  void addFavorite() {
//    for (int i = 0; i < itemList.length; i++) {
//      if (itemList[i].isFav == true) {
//        favList.add(itemList[i]);
//      }
//    }
//    notifyListeners();
//  }

  List<Item> favorites() {
    return itemList.where(
          (item) {
        return item.isFav;
      },
    ).toList();
  }
}

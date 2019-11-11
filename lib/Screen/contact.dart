import 'package:contact_simple/Model/contact.dart';
import 'package:contact_simple/Screen/add.dart';
import 'package:contact_simple/Screen/favorite.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var item_provider = Provider.of<Contacts>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.teal,
        title: Text(
          'Contacts',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.favorite,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Favorite()));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow,
        hoverColor: Colors.black,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Add()));
        },
        tooltip: 'Add Contact',
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => ListTile(
          title: Text(item_provider.itemList[index].name),
          subtitle: Text(item_provider.itemList[index].phone),
          leading: CircleAvatar(
            backgroundColor: Colors.primaries[index],
          ),
          trailing: IconButton(
              icon: item_provider.itemList[index].isFav
                  ? Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )
                  : Icon(Icons.favorite_border, color: Colors.black),
              onPressed: () {
                  item_provider.changeFavState(index);
              }),
        ),
        itemCount: item_provider.itemList.length,
      ),
    );
  }
}


/**
 *
 *
 *
 * use custom widget
 *
 */

//class _MyitemList extends StatelessWidget {
//  var index;
//
//  _MyitemList(this.index);
//
//  @override
//  Widget build(BuildContext context) {
//    var item = Provider.of<Item>(context);
//    return Padding(
//      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//      child: Row(
//        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//        children: <Widget>[
//          Container(
//            width: 50.0,
//            height: 50.0,
//            decoration: BoxDecoration(
//                shape: BoxShape.circle, color: Colors.primaries[index]),
//          ),
//          Column(
//            children: <Widget>[
//              Text(item.itemList[index].name),
//              Text(item.itemList[index].phone),
//            ],
//          ),
//          IconButton(
//            icon: item.iconFav(item.itemList[index].favorite),
//            onPressed: () {
//            },
//          ),
//        ],
//      ),
//    );
//  }
//}

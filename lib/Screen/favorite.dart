import 'package:contact_simple/Model/contact.dart';
import 'package:contact_simple/Screen/contact.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Favorite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    var item_provider = Provider.of<Contacts>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.yellow,
        title: Text(
          'Favorite Contact',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Contact()));
//            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 452,
            child: ListView.builder(
              itemBuilder: (context, index) => ListTile(
                title: Text(item_provider.favorites()[index].name),
                subtitle: Text(item_provider.favorites()[index].phone),
                leading: CircleAvatar(
                  backgroundColor: Colors.primaries[index],
                ),
                trailing: IconButton(icon: Icon(Icons.close,color: Colors.black,), onPressed: (){
                  item_provider.removeFav(index);
                }),
              ),
              itemCount: item_provider.favorites().length,
            ),
          ),
          Container(
            height: 60,
            color: Colors.yellow,
              child: Center(
                child: Text(
                  'Count of Contact : ' + item_provider.favorites().length.toString(),
                  style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
                ),
              )
          ),
        ],
      ),
    );
  }
}

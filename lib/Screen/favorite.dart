import 'package:contact_simple/Model/contact.dart';
import 'package:contact_simple/Screen/contact.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Favorite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    var itemProvider = Provider.of<Contacts>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.indigo,
        title: Text(
          'Favorite Contact',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 500,
            child: ListView.builder(
              itemBuilder: (context, index) => ListTile(
                title: Text(itemProvider.favorites()[index].name),
                subtitle: Text(itemProvider.favorites()[index].phone),
                leading: CircleAvatar(
                  backgroundColor: Colors.primaries[index],
                ),
                trailing: IconButton(icon: Icon(Icons.close,color: Colors.black,), onPressed: (){
                  itemProvider.removeFav(index);
                }),
              ),
              itemCount: itemProvider.favorites().length,
            ),
          ),
          Container(
            height: 50,
            color: Colors.indigoAccent,
              child: Center(
                child: Text(
                  'Count of Contact : ' + itemProvider.favorites().length.toString(),
                  style: TextStyle(fontSize: 15,fontWeight: FontWeight.w300,color: Colors.white),
                ),
              )
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:contact_simple/Model/contact.dart';

final _formKey = GlobalKey<FormState>();

class Add extends StatelessWidget {

  final TextEditingController  name_controller = new TextEditingController();
  final TextEditingController  phone_controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    var item_provider = Provider.of<Contacts>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.white,
        title: Text(
          'Create Contact',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 100,),
              Theme(
                data: ThemeData(primaryColor: Colors.black),
                child: TextFormField(
                  controller: name_controller,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      labelText: 'Name',
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      prefixIcon: Icon(
                        Icons.account_circle,
                        color: Colors.black,
                      )),
                  validator: (val) {
                    if (val.isEmpty) {
                      return 'Enter Your Name';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Theme(
                data: ThemeData(primaryColor: Colors.black),
                child: TextFormField(
                  controller: phone_controller,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      labelText: 'Phone',
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      prefixIcon: Icon(
                        Icons.phone,
                        color: Colors.black,
                      )),
                  validator: (val) {
                    if (val.isEmpty) {
                      return 'Enter your phone Number';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              SizedBox(
                height: 60,
              ),
              ButtonTheme(
                height: 50,
                minWidth: 150,
                child: RaisedButton(
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.white),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  color: Colors.black,
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    Item _item = new Item(name: name_controller.text, phone: phone_controller.text, isFav: false);
                    item_provider.addContact(_item);
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

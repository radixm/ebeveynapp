import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'selection.dart';

class LoginSuccesful extends StatefulWidget {
  LoginSuccesful({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginSuccesfulState createState() => _LoginSuccesfulState();
}

class _LoginSuccesfulState extends State<LoginSuccesful> {
  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.white),
            ),
            Text('Geri',
                style: TextStyle(color:Colors.white,fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  Widget _submitButton() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ChildorParent()));
      },
      child: Container(
        width: 100,
        alignment: Alignment.center,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          border: Border.all(color: Colors.white, width: 2),
          color: Colors.red,
        ),
        child: Text(
          'Devam',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _title() {
    return Text(
      "Ebeveyn App",
      style: TextStyle(
        fontSize: 30,
        color: Colors.white,
      ),
    );
  }

  Widget _succesfulWidget() {
    return Container(
      height: 200,
      width: 400,
      decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: new BorderRadius.all(Radius.circular(30.0))),
      child: Center(
        child: Text(
          "Kayıt başarılı. Hoşgeldiniz!",
          style: TextStyle(color: Colors.white,fontSize: 30),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
     
            
      body: Container(
        height: height,
        child: Stack(
          children: <Widget>[
              Container(
              width: 1000,
              height: 90,
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: new BorderRadius.only(
                      bottomLeft: const Radius.circular(30.0),
                      bottomRight: const Radius.circular(30.0))),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 35),
                    _title(),
                    SizedBox(height:50),
                    _succesfulWidget(),
                    SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        _submitButton(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(top: 40, left: 0, child: _backButton()),
          ],
        ),
      ),
    );
  }
}

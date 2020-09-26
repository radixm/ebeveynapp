import 'succesful.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class EmailPassword extends StatefulWidget {
  EmailPassword({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _EmailPasswordState createState() => _EmailPasswordState();
}


class _EmailPasswordState extends State<EmailPassword> {

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
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text('Geri',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  Widget _submitButton() {
    return InkWell(
      onTap: () {
         Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginSuccesful()));
      },
      child: Container(
        width: 100,
        alignment: Alignment.center,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          border: Border.all(color: Colors.white, width: 2),
          color: Colors.red[400],
        ),
        child: Text(
          'Bitir',
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
        color: Colors.red,
      ),
    );
  }

  Widget _emailPasswordInputWidget() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Container(
              width: 300,
              child: Wrap(
                runSpacing: 20,
                children: <Widget>[
                  Text(
                    "Kullanıcı Adı",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.grey[800]),
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.grey[900]),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        fillColor: Colors.grey[50],
                        filled: true),
                    keyboardType: TextInputType.text,
                  ),
                  Text(
                    "E-posta",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.grey[800]),
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.grey[900]),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        fillColor: Colors.grey[50],
                        filled: true),
                    keyboardType: TextInputType.text,
                  ),
                  Text(
                    "Şifre",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.grey[800]),
                  ),
                  TextFormField(
                    obscureText: true,
                    style: TextStyle(color: Colors.grey[900]),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        fillColor: Colors.grey[50],
                        filled: true),
                    keyboardType: TextInputType.text,
                  ),
                ],
              ),
            ),
          ],
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
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 100),
                    _title(),
                    SizedBox(
                      height: 30,
                    ),
                    _emailPasswordInputWidget(),
                    SizedBox(
                      height: 100,
                    ),
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

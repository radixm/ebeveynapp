import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'pregnancy.dart';

class ParentLogin extends StatefulWidget {
  ParentLogin({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ParentLoginState createState() => _ParentLoginState();
}

class _ParentLoginState extends State<ParentLogin> {
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
              child: Icon(Icons.keyboard_arrow_left, color: Colors.grey[900]),
            ),
            Text('Geri',
                style: TextStyle(
                    color: Colors.grey[900],
                    fontSize: 12,
                    fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 30,
          width: 140,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(35)),
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.centerRight,
                  colors: [Colors.red[800], Colors.red[400]])),
          child: Center(
            child: Text(
              "Ebeveyn App",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _subjects() {
    return Container(
        child: Wrap(
      spacing: 20,
      runSpacing: 15,
      children: <Widget>[
        Container(
          height: 70,
          width: 400,
          child: RaisedButton(
            onPressed: () {Navigator.push(
            context, MaterialPageRoute(builder: (context) => PregnancySubjects()));},
            color: Colors.red,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
                side: BorderSide(color: Colors.red)),
            child: Text(
              "Hamilelik Dönemi",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Container(
          height:70,
          width: 400,
          child: RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
                side: BorderSide(color: Colors.red)),
            onPressed: () {},
            color: Colors.red,
            child: Text(
              "Bebeğe Dair",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Container(
          height: 70,
          width: 400,
          child: RaisedButton(
            onPressed: () {},
            color: Colors.red,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
                side: BorderSide(color: Colors.red)),
            child: Text(
              "Kitap Önerileri",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    ));
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
                    SizedBox(
                      height: 30,
                    ),
                    _title(),
                    SizedBox(height: 40,),
                    Container(
                      
                      child: Row(
                        children: <Widget>[
                          Text("Hangisini İncelemek İstersiniz?",
                          style: TextStyle(
                            fontSize: 25
                          ),
                          ),
                        ],
                      )),
                    SizedBox(height: 40),
                    _subjects(),
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

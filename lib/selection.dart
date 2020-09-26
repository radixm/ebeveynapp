import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'parentlogin.dart';

class ChildorParent extends StatefulWidget {
  ChildorParent({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ChildorParentState createState() => _ChildorParentState();
}

class _ChildorParentState extends State<ChildorParent> {
 

  Widget _ebeveyn() {
    return Container(
      color: Colors.white,
     height: MediaQuery.of(context).size.height/2,
      width: MediaQuery.of(context).size.width,
      child: FlatButton(
        onPressed: () {Navigator.push(
            context, MaterialPageRoute(builder: (context) => ParentLogin()));},
        
        child: Center(
          child: Text(
            "Ebeveyn Girişi",
            style: TextStyle(
              fontSize: 40,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }

  Widget _children() {
    return Container(
      height: MediaQuery.of(context).size.height/2,
      width: MediaQuery.of(context).size.width,
      child: FlatButton(
        onPressed: () {},
        color: Colors.red,
        child: Text(
          "Çocuk Girişi",
          style: TextStyle(
            fontSize: 40,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: height,
        child: Stack(
          children: <Widget>[
            Container(
              child: Column(
        
                children: <Widget>[
                  
                  _ebeveyn(),
                  _children(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

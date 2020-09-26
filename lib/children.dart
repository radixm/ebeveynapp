import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'emailpassword.dart';

class ChildrenInfo extends StatefulWidget {
  ChildrenInfo({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ChildrenInfoState createState() => _ChildrenInfoState();
}

class NumberList {
  String number;
  int index;
  NumberList({this.number, this.index});
}

final _formKey = GlobalKey<FormState>();
final List<String> names = <String>[];
final List<String> gender = <String>[];
final List<int> age = <int>[];
TextEditingController nameController = TextEditingController();
TextEditingController ageController = TextEditingController();
TextEditingController genderController = TextEditingController();

// Default Radio Button Selected Item.
String radioItemHolder = 'Kız';

// Group Value for Radio Button.
int id = 1;

List<NumberList> nList = [
  NumberList(
    index: 1,
    number: "Kız",
  ),
  NumberList(
    index: 2,
    number: "Erkek",
  ),
];

class _ChildrenInfoState extends State<ChildrenInfo> {
  void addItemToList() {
    setState(() {
      names.insert(0, nameController.text);
      age.insert(0, int.parse(ageController.text));
      gender.insert(0, radioItemHolder);
    });
  }

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
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  Widget _submitButton() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => EmailPassword()));
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

  Widget _childrenNameAge() {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20),
            child: TextFormField(
         
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Çocuğunuzun Adı',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: TextFormField(
              keyboardType: TextInputType.number,
              controller: ageController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Çocuğunuzun Yaşı',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _childrenGender() {
    return Container(
      height: 112.0,
      child: Column(
        children: nList
            .map((data) => RadioListTile(
                  title: Text("${data.number}"),
                  groupValue: id,
                  value: data.index,
                  onChanged: (val) {
                    setState(() {
                      radioItemHolder = data.number;
                      id = data.index;
                    });
                  },
                ))
            .toList(),
      ),
    );
  }

  Widget _addButton() {
    return FlatButton(
        color: Colors.red,
        child: Text(
          'Ekle',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          
            addItemToList();
          
        });
  }

  Widget _childrenList() {
    return Container(
        height: 170,
        child: ListView.builder(
            itemCount: names.length,
            itemBuilder: (
              BuildContext context,
              int index,
            ) {
              return Container(
                height: 50,
                margin: EdgeInsets.all(2),
                color: Colors.red,
                child: Center(
                    child: Text(
                  '${names[index]} ${age[index]} ${gender[index]}  ',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                )),
              );
            }));
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
                    SizedBox(
                      height: 30,
                    ),
                    _childrenNameAge(),
                    _childrenGender(),
                    _addButton(),
                    _childrenList(),
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

 
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PregnancyNutrition extends StatefulWidget {
  PregnancyNutrition({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PregnancyNutritionState createState() => _PregnancyNutritionState();
}

class _PregnancyNutritionState extends State<PregnancyNutrition> {
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

  Widget _nutritionPost() {
    return Container(
      height: 1100,
      width: 350,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset("assets/pregnancynutrition.png"),
          Text(
            "Hamilelikte Hangi Besinlere İhtiyacınız Var?",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Text(
            "Hamileliğiniz sırasında bazı besinleri daha fazla tüketmeniz gerekebilir. Bunlardan en önemlisi, beyin ve omurlardaki doğum kusurlarını engellemeye yardımcı olan folik asittir. Ancak demir ve kalsiyum alımı da önem taşımaktadır. Gebelikte vitamin takviyelerinden destek alabilirsiniz, ancak kalsiyum ve demir açısından zengin besinleri de içeren kapsamlı bir beslenme, size ve bebeğinize hamilelik boyunca ihtiyacınız olan her şeyi verebilir. Besin takviyesi almanız gerekip gerekmediğine dair öneri almak için doktorunuza danışabilirsiniz.",
            style: TextStyle(fontSize: 17),
          ),
          Image.asset("assets/pregnancynutrition2.png"),
          Text("Prof. Dr. Meltem Kartal",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          Text("29 Temmuz 2020"),
        ],
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
                    SizedBox(
                      height: 30,
                    ),
                    _title(),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: <Widget>[
                        _nutritionPost(),
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

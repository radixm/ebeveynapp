import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter/rendering.dart';


class DuringPregnancy extends StatefulWidget {
  DuringPregnancy({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DuringPregnancyState createState() => _DuringPregnancyState();
}

class _DuringPregnancyState extends State<DuringPregnancy> {
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

  Widget _heading() {
    return Text(
      "Hamilelik sürecinde sizi neler bekliyor?",
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    );
  }

  Widget _description() {
    return Container(
      
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
   
        children: <Widget>[
          SizedBox(height: 10,),
          Text(
        "Anne adayları için gebelik haftaları süresince yaşanan gelişmeler kendini sürekli değiştirmektedir. Hafta hafta hamilelik süresince yaşanan değişimler etkisini artırarak devam ederken anne adayları da bu süreçte çeşitli hormonal değişikliklere maruz kalırlar.",
        style: TextStyle( fontSize: 18),
      ),
      SizedBox(height: 20,),
          Text(
        "Prof. Dr. Merve Öztürk",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
      Text("27 Kasım 2020 "),
        ],
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

  String videoURL = "https://www.youtube.com/watch?v=XJLKUW1ajDQ";

  YoutubePlayerController _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(videoURL));

    super.initState();
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
                    _heading(),
                    SizedBox(height: 10),
                    Container(
                    
                        child: Column(
                          children: <Widget>[
                            YoutubePlayer(
                           
                              controller: _controller,
                              showVideoProgressIndicator: true,
                            ),
                          ],
                        ),
                      
                    ),
                    _description(),
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

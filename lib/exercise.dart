import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Exercise extends StatefulWidget {
  Exercise({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ExerciseState createState() => _ExerciseState();
}

class _ExerciseState extends State<Exercise> {
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
  Widget _header(){
     return Text(
      "Hamilelik Sürecinde Egzersiz",
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
    );
  }
  Widget _description(){
       return Container(
      
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
   
        children: <Widget>[
          SizedBox(height: 10,),
          Text(
        "Hamililelik ağrısı çekmeyen anne adayı yoktur. Bu ağrılara iyi gelen ve en çok tavsiye edilen sporlar; yüzme ve özellikle yürüyüş yapmak. Fakat gündelik pratiklerin içinde istediğin her an yapabileceğin uzmanımızın önerisi olan iki kolay hareket ile ağrılarını kolayca dindirebilirsin.",
        style: TextStyle( fontSize: 18),
      ),
      SizedBox(height: 20,),
          Text(
        "Gözde Biber",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
      Text("22 Ağustos 2020 "),
        ],
      ),
    );
  }
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
        'assets/egzersiz.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }
  void dispose() {
    super.dispose();
    _controller.dispose();
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
                    SizedBox(height:20 ,),
                    _header(),
                    Column(mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       
                            Container(
          child: _controller.value.initialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : Container(),
        ),
     FloatingActionButton(
          onPressed: () {
            setState(() {
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            });
          },
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),
      
    
  

 
  
                    
                  
                    
                      ],
                    ),
                            SizedBox(height:10),
                    
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









    
    
     
         

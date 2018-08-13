import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }

}

class HomeState extends State<Home> {
  /*
  source: https://www.livescience.com/33356-weight-on-planets-mars-moon.html
  Mercury: 0.38
  Venus: 0.91
  Earth: 1.00
  Mars: 0.38
  Jupiter: 2.34
  Saturn: 1.06
  Uranus: 0.92
  Neptune: 1.19
  Pluto: 0.06
  */

  final TextEditingController _weightController = new TextEditingController();
  int radioValue = 0;
  double _finalResult = 0.0;
  String _formattdText = "";

  void handleRadioValueChanged(int value){
    setState(() {
      radioValue = value;

      switch(radioValue){
        case 0:
          _finalResult = calculateWeight(_weightController.text, 0.06);
          _formattdText = "Your weight on Pluto is ${_finalResult.toStringAsFixed(1)}";
          break;
        case 1:
          _finalResult = calculateWeight(_weightController.text, 0.38);
          _formattdText = "Your weight on Mars is ${_finalResult.toStringAsFixed(1)}";
          break;
        case 2:
          _finalResult = calculateWeight(_weightController.text, 0.91);
          _formattdText = "Your weight on Venus is ${_finalResult.toStringAsFixed(1)}";
          break;
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Weight on Planet X"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),

      backgroundColor: Colors.white,
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(2.5),
          children: <Widget>[
            new Image.asset('images/ParkE1.png',
            fit: BoxFit.fill,),

            new Container(
              margin: const EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: new Column(
                children: <Widget>[

                  new TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelText: 'Your weight on Earth',
                      hintText: 'In Pounds',
                      icon: new Icon(Icons.person_outline)
                    ),
                  ),

                  new Padding(padding: new EdgeInsets.all(5.0)),

                  //three radio buttons
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      //radio buttons
                      new Radio<int>(
                        activeColor: Colors.brown,
                          value: 0, groupValue: radioValue, onChanged: handleRadioValueChanged),
                      new Text("Pluto",
                      style: new TextStyle(color: Colors.brown),),

                      new Radio<int>(
                        activeColor: Colors.red,
                          value: 1, groupValue: radioValue, onChanged: handleRadioValueChanged),
                      new Text("Mars",
                        style: new TextStyle(color: Colors.red),),

                      new Radio<int>(
                        activeColor: Colors.orangeAccent,
                          value: 2, groupValue: radioValue, onChanged: handleRadioValueChanged),
                      new Text("Venus",
                        style: new TextStyle(color: Colors.orangeAccent),),

                    ],
                  ),

                  new Padding(padding: new EdgeInsets.all(20.0)),
                  //result text
                  new Text(
                    _weightController.text.isEmpty ? "Please enter weight" : _formattdText + "lbs",
                    //"$_formattdText lbs",
                    style: new TextStyle(
                      color: Colors.black,
                      fontSize: 30.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),

                ],
              ),
            )
          ],
        ),
      ),

    );
  }

  double calculateWeight(String weight, double multiplier) {
    if (int.parse(weight).toString().isNotEmpty && int.parse(weight) > 0) {
      return int.parse(weight) * multiplier;
    }
    else{
      print("Error");
      return int.parse("180") * 0.38;
    }
  }
}
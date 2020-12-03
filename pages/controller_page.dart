import 'package:flutter/material.dart';

class ControllerPage extends StatefulWidget {
  @override
  _ControllerPageState createState() => _ControllerPageState();
}

class _ControllerPageState extends State<ControllerPage> {
  List<double> servos = [0, 0, 0, 0];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Controller"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  generateSlider(0, "Base"),
                  generateSlider(1, "Shoulder"),
                  generateSlider(2, "Elbow"),
                  generateSlider(3, "Gripper"),
                ],
              ),
            ),
            FlatButton(
              child: Text("DISCONNECT"),
              onPressed: () {
                Navigator.pushReplacementNamed(context, "/connect");
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget generateSlider(int servoNum, String name) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: <Widget>[
          SizedBox(width: 60, child: Text(name)),
          Expanded(
            child: Slider(
              value: servos[servoNum],
              min: 0.0,
              max: 1.0,
              divisions: 100,
              activeColor: Colors.blue[900],
              //inactiveColor: Colors.black,
              label: '${servos[servoNum]}',
              onChanged: (double newValue) {
                setState(() => servos[servoNum] = newValue);
              },
            ),
          ),
        ],
      ),
    );
  }
}

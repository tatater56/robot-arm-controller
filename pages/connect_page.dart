import 'package:flutter/material.dart';
import 'dart:math';

class ConnectPage extends StatefulWidget {
  @override
  _ConnectPageState createState() => _ConnectPageState();
}

class _ConnectPageState extends State<ConnectPage> {
  List<BTDeviceWidget> btWidgets = [];

  @override
  void initState() {
    super.initState();
    new Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        btWidgets.add(BTDeviceWidget("BTRobotArm1"));
        btWidgets.add(BTDeviceWidget("Some_Other_BT_Device"));
        btWidgets.add(BTDeviceWidget("A5489FB80"));
        btWidgets.shuffle();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Connect to device"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              SizedBox(height: 12),
              if (btWidgets.isEmpty) 
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.bluetooth_searching, color: Colors.blue[800]),
                    SizedBox(width: 10),
                    Text("Scanning for devices...", textScaleFactor: 1.5),
                  ],
                )
              else
                ...btWidgets
            ],
          ),
        ),
      ),
    );
  }
}

class BTDeviceWidget extends StatelessWidget {
  final String name;

  BTDeviceWidget(this.name);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushReplacementNamed(context, "/controller"),
      child: Card(
        margin: EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Row(children: <Widget>[
                Icon(Icons.settings_bluetooth, color: Colors.blue[800]),
                Text(name),
              ]),
              Text("Signal strength: ${(new Random().nextInt(2) + 3)}/5",
                  textScaleFactor: .8),
            ],
          ),
        ),
      ),
    );
  }
}

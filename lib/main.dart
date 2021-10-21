import 'dart:ui';
import 'package:beeaway/avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polygon/flutter_polygon.dart';
import 'package:sound_generator/sound_generator.dart';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatelessWidget {

    @override
    Widget build(BuildContext context) {

        return Scaffold(
            backgroundColor: Color(0xFFFEE384),
            appBar: AppBar(
                backgroundColor: Color(0x00FEE384),
                elevation: 0
            ),
            body: Container(
              child: Stack(
                  children: [
                      Center(child: Image(image: AssetImage('assets/drawables/waben.png'))),
                      Center(
                          child: Bouncing(onPress: (){},child: onClick(polygon(), 0)),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                              Container(
                                  width: 350,
                                  margin:EdgeInsets.only(top: 70),
                                  child: Flexible(
                                    child: new Text("Biene drücken zum Starten", textAlign: TextAlign.center, style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
                                 ),
                              ),
                         ],
                      ),

                  ],
              ),
            ),
        );

    }

    Widget polygon() {
        return Center(
            child: Container(
                height: 250,
                width: 250,
                child: ClipPolygon(
                    child: Container(color: Color(0xFFFEFDF5)),
                    rotate: 90.0,
                    boxShadows: [
                        PolygonBoxShadow(color: Color(0xFF000000), elevation: 5000.0)
                    ],
                    sides: 6,
                    borderRadius: 10,
                ),
            ),
        );
    }

    Widget onClick(view, pos){
        return GestureDetector(
            onTap: () {
                switch (pos) {
                    case 0:
                        SoundGenerator.init(96000);
                        SoundGenerator.setFrequency(200.0);
                        SoundGenerator.play();
                        break;
                    case 1:
                        print('ontap Emre');
                        break;
                }
            },
            child: view
        );
    }
}
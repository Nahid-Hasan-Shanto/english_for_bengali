import 'dart:math';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:text_to_speech/text_to_speech.dart';

class FlipPage extends StatelessWidget {
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  Color bdColro = Colors.primaries[Random().nextInt(Colors.primaries.length)];
  Color fbdColro = Colors.primaries[Random().nextInt(Colors.primaries.length)];
  final String id;
  final String name;
  final String label;
  final String frontText;
  final String backText;
  final bool isSpeakOff;
  final FlipDirection direction;
  TextToSpeech tts = TextToSpeech();
  double volume = 1.0;
  double rate = 0.6;
  double pitch = 1.0;

  FlipPage({
    required this.id,
    required this.name,
    required this.label,
    required this.frontText,
    required this.backText,
    required this.direction,
    required this.isSpeakOff,
  });

  @override
  Widget build(BuildContext context) {
    tts.setRate(rate);
    tts.setPitch(pitch);
    tts.setVolume(volume);
    speak(String txt) {
      if (!isSpeakOff) {
        tts.speak(txt);
      }
    }

    return Card(
      elevation: 0.0,
      margin: EdgeInsets.only(
        bottom: 96,
        left: 38,
        top: 96,
        right: 38,
      ),
      child: FlipCard(
          key: cardKey,
          direction: direction,
          speed: 500,
          onFlipDone: (status) {
            if (status) {
              speak(frontText);
            } else {
              speak('$backText');
            }
          },
          //direction: FlipDirection.HORIZONTAL,
          front: Container(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    color: fbdColro,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    //top: 10,
                    // bottom: 10,
                    right: 5,
                    left: 10,
                  ),
                  child: Column(
                    // mainAxisSize: MainAxisSize.max,
                    // verticalDirection: VerticalDirection.down,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          label,
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.right,
                        ),
                      ),
                      Text(
                        frontText,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w600),
                      ),
                      Icon(
                        Icons.touch_app_sharp,
                        color: Colors.white,
                        size: 60,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          back: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  color: bdColro,
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                  right: 10,
                  left: 10,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      backText,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w600),
                    ),
                    Icon(
                      Icons.swipe,
                      color: Colors.white,
                      size: 60,
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

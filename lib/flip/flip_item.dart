import 'package:english_for_bengali/flip/flip_page.dart';
import 'package:english_for_bengali/model/items.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:swipe/swipe.dart';
import 'package:text_to_speech/text_to_speech.dart';

class FlipItem extends StatefulWidget {
  final String eventType;
  final List<Items> topicItems;
  final bool isSpeakOff;
  FlipItem({
    required this.eventType,
    required this.topicItems,
    required this.isSpeakOff,
  });

  @override
  _FlipItemState createState() => _FlipItemState();
}

class _FlipItemState extends State<FlipItem> {
  List<Items> category = []; //Dummy.item;
  bool _isSpeakOff = true;
  int currentIndex = 0;
  TextToSpeech tts = TextToSpeech();
  double volume = 1.0;
  var direction = FlipDirection.HORIZONTAL;

  speak(String txt) {
    if (!_isSpeakOff) {
      tts.speak(txt);
    }
  }

  @override
  void initState() {
    category = widget.topicItems;
    _isSpeakOff = widget.isSpeakOff;
    print(_isSpeakOff);
    // TODO: implement initState
    super.initState();
  }

  @override
  void didUpdateWidget(covariant FlipItem oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    // if (widget.eventType == 'increment') {
    //   onIncrement();
    // } else if (widget.eventType == 'decrement') {
    //   onDecrement();
    // } else {
    //   onInit();
    // }
    _isSpeakOff = widget.isSpeakOff;

    //print(widget.eventType);
  }

  onIncrement() {
    setState(() {
      currentIndex = category.length - 1 == currentIndex ? 0 : currentIndex + 1;
      speak(category[currentIndex].frontText);
    });
  }

  onDecrement() {
    setState(() {
      currentIndex =
          currentIndex == 0 ? (category.length - 1) : currentIndex - 1;
      speak(category[currentIndex].frontText);
    });
  }

  onInit() {
    setState(() {
      currentIndex = 0;
      speak(category[currentIndex].frontText);
    });
  }

  @override
  Widget build(BuildContext context) {
    Items currentItem = category[currentIndex];
    tts.setVolume(volume);
    return Container(
      child: Swipe(
        child: FlipPage(
          label: '${currentIndex + 1}/${category.length}',
          frontText: currentItem.frontText,
          backText: currentItem.backText,
          direction: (currentIndex % 2 == 0)
              ? FlipDirection.HORIZONTAL
              : FlipDirection.VERTICAL,
          id: '',
          name: '',
          isSpeakOff: _isSpeakOff,
        ),
        onSwipeLeft: () {
          print('Left');
          onIncrement();
        },
        onSwipeRight: () {
          print('Right');
          onDecrement();
        },
        onSwipeUp: () {
          onIncrement();
        },
        onSwipeDown: () {
          onDecrement();
        },
        verticalMaxWidthThreshold: 250,
        verticalMinDisplacement: 100,
        verticalMinVelocity: 300,
        horizontalMaxHeightThreshold: 250,
        horizontalMinDisplacement: 100,
        horizontalMinVelocity: 300,
      ),
    );
  }
}

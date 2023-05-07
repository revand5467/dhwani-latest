import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/tile_model.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:text_to_speech/text_to_speech.dart';

final String assetName = 'assets/images/bird.svg';
final Widget svg = SvgPicture.asset(assetName, semanticsLabel: 'Acme Logo');

Widget tileWidget(int index) {
  TextToSpeech tts = TextToSpeech();

  FlutterTts ftts = FlutterTts();
  return GestureDetector(
    onTap: () async {
      //your custom configuration
      await ftts.setLanguage("en-US");
      await ftts.setSpeechRate(0.25); //speed of speech
      await ftts.setVolume(1.0); //volume of speech
      await ftts.setPitch(1); //pitc of sound

      //play text to sp
      var result = await ftts.speak(demo[index].description);
      if (result == 1) {
        //speaking
      } else {
        //not speaking
      }
    },
    child: Card(
      child: SvgPicture.asset(demo[index].image,
          // color: Colors.black,
          semanticsLabel: demo[index].description),
    ),
  );
}

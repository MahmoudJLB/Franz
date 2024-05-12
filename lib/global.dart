import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

/* ================================================================================================
User Theme
================================================================================================ */

class UserTheme extends ChangeNotifier {
  static bool isDark = false;
  bool isDarkNotify = isDark;
  toggleTheme(bool flag) {
    isDark = flag;
    isDarkNotify = flag;
    return notifyListeners();
  }
}

// Color Palette ==================================================================================

class Palette {
  static const int darkgrey = 0xFF6b705c;
  static const int grey = 0xFFb7b7a4;
  static const int brown = 0xFF825f45;
  static const int lightbrown = 0xFF997b66;
  static const int green = 0xFF797d62;
  static const int orange = 0xFFd08c60;
  static const int yellow = 0xFFffcb69;
}

/* ================================================================================================
Dialog Pop Up
================================================================================================ */

class Alert {
  static show(context, String title, content, Color backgroundColor, String type) {
    type = type.toLowerCase(); // For comparison checks
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        backgroundColor: backgroundColor,
        actions: [
          TextButton(
            child: Text(type.toUpperCase()),
            onPressed: () async {
              switch (type) {
                case "exit":
                  await SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop');
                  break;
                case "login":
                  Navigator.of(context).pop();
                  Navigator.pushReplacementNamed(context, "HomeScreen");
                  break;
                case "logout":
                  Navigator.pushNamed(context, "WelcomeScreen");
                  break;
                default:
                  Navigator.of(context).pop();
              }
            },
          )
        ],
      ),
    );
  }
}

/* ================================================================================================
Loading Animation
================================================================================================ */

class Loading extends StatelessWidget {

  final Color? backgroundColor;
  final Color? color;
  final double? size;

  const Loading({super.key, this.backgroundColor, this.color, this.size});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor ?? (UserTheme.isDark ? Colors.black : const Color(Palette.orange)),
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        ),
        child: SpinKitFadingCircle(
          color: color ?? (UserTheme.isDark ? const Color(Palette.orange) : Colors.black),
          size: size ?? 50.0,
        ),
      ),
    );
  }
}


class Instruments {
  static Map<String, List<String>> midiInstruments = {
    "Piano": [
      "Acoustic Grand Piano",
      "Bright Acoustic Piano",
      "Electric Grand Piano",
      "Honky-tonk Piano",
      "Electric Piano 1",
      "Electric Piano 2",
      "Harpsichord",
      "Clavinet",
    ],
    "Chromatic Percussion": [
      "Celesta",
      "Glockenspiel",
      "Music Box",
      "Vibraphone",
      "Marimba",
      "Xylophone",
      "Tubular Bells",
      "Dulcimer",
    ],
    "Organ": [
      "Drawbar Organ",
      "Percussive Organ",
      "Rock Organ",
      "Church Organ",
      "Reed Organ",
      "Accordion",
      "Harmonica",
      "Tango Accordion",
    ],
    "Guitar": [
      "Acoustic Guitar (nylon)",
      "Acoustic Guitar (steel)",
      "Electric Guitar (jazz)",
      "Electric Guitar (clean)",
      "Electric Guitar (muted)",
      "Overdriven Guitar",
      "Distortion Guitar",
      "Guitar Harmonics",
    ],
    "Bass": [
      "Acoustic Bass",
      "Electric Bass (finger)",
      "Electric Bass (pick)",
      "Fretless Bass",
      "Slap Bass 1",
      "Slap Bass 2",
      "Synth Bass 1",
      "Synth Bass 2",
    ],
    "Strings": [
      "Violin",
      "Viola",
      "Cello",
      "Contrabass",
      "Tremolo Strings",
      "Pizzicato Strings",
      "Orchestral Harp",
      "Timpani",
    ],
    "Ensemble": [
      "String Ensemble 1",
      "String Ensemble 2",
      "SynthStrings 1",
      "SynthStrings 2",
      "Choir Aahs",
      "Voice Oohs",
      "Synth Voice",
      "Orchestra Hit",
    ],
    "Brass": [
      "Trumpet",
      "Trombone",
      "Tuba",
      "Muted Trumpet",
      "French Horn",
      "Brass Section",
      "SynthBrass 1",
      "SynthBrass 2",
    ],
    "Reed": [
      "Soprano Sax",
      "Alto Sax",
      "Tenor Sax",
      "Baritone Sax",
      "Oboe",
      "English Horn",
      "Bassoon",
      "Clarinet",
    ],
    "Pipe": [
      "Piccolo",
      "Flute",
      "Recorder",
      "Pan Flute",
      "Blown Bottle",
      "Shakuhachi",
      "Whistle",
      "Ocarina",
    ],
    "Synth Lead": [
      "Lead 1 (square)",
      "Lead 2 (sawtooth)",
      "Lead 3 (calliope)",
      "Lead 4 (chiff)",
      "Lead 5 (charang)",
      "Lead 6 (voice)",
      "Lead 7 (fifths)",
      "Lead 8 (bass + lead)",
    ],
    "Synth Pad": [
      "Pad 1 (new age)",
      "Pad 2 (warm)",
      "Pad 3 (polysynth)",
      "Pad 4 (choir)",
      "Pad 5 (bowed)",
      "Pad 6 (metallic)",
      "Pad 7 (halo)",
      "Pad 8 (sweep)",
    ],
    "Synth Effects": [
      "FX 1 (rain)",
      "FX 2 (soundtrack)",
      "FX 3 (crystal)",
      "FX 4 (atmosphere)",
      "FX 5 (brightness)",
      "FX 6 (goblins)",
      "FX 7 (echoes)",
      "FX 8 (sci-fi)",
    ],
    "Ethnic": [
      "Sitar",
      "Banjo",
      "Shamisen",
      "Koto",
      "Kalimba",
      "Bag pipe",
      "Fiddle",
      "Shanai",
    ],
    "Percussive": [
      "Tinkle Bell",
      "Agogo",
      "Steel Drums",
      "Woodblock",
      "Taiko Drum",
      "Melodic Tom",
      "Synth Drum",
      "Reverse Cymbal",
    ],
    "Sound Effects": [
      "Guitar Fret Noise",
      "Breath Noise",
      "Seashore",
      "Bird Tweet",
      "Telephone Ring",
      "Helicopter",
      "Applause",
      "Gunshot",
    ],
  };

}

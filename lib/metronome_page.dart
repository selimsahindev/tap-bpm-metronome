import 'dart:async';
import 'package:bpmcounter/metronome_brain.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:bpmcounter/constants.dart';

class MetronomePage extends StatefulWidget {
  @override
  _MetronomePageState createState() => _MetronomePageState();
}

class _MetronomePageState extends State<MetronomePage> {
  static List<Color> signalColors = [
    Colors.grey[800],
    Colors.red,
    Colors.yellow,
  ];

  static Color leftSignalColor = signalColors[0];
  static Color rightSignalColor = signalColors[0];

  static int _currentValue = 110;
  static int _minValue = 20;
  static int _maxValue = 400;

  NumberPicker numPic;

  List<Icon> buttonIcon = [
    Icon(
      Icons.play_arrow,
      size: 64.0,
    ),
    Icon(
      Icons.stop,
      size: 64.0,
    ),
  ];

  void setSignalColors() {
    int clickCount = MetronomeBrain.clickCount;
    // Left signal turned on
    if (clickCount % 2 == 1) {
      rightSignalColor = signalColors[0];
      if (clickCount % MetronomeBrain.beatsPerBar == 1) {
        leftSignalColor = signalColors[1];
        rightSignalColor = signalColors[1];
      } else {
        leftSignalColor = signalColors[2];
      }
    }
    // Right signal turned on
    else {
      leftSignalColor = signalColors[0];
      if (clickCount % MetronomeBrain.beatsPerBar == 1) {
        rightSignalColor = signalColors[1];
      } else {
        rightSignalColor = signalColors[2];
      }
    }
    // Reset colors after pause
    if (!MetronomeBrain.isPlaying()) {
      leftSignalColor = signalColors[0];
      rightSignalColor = signalColors[0];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: Container(
            margin: EdgeInsets.all(6.0),
            decoration: kPageContainerDecoration,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 10.0),
                Text('Metronome', style: kPageTitleTextStyle),
                SizedBox(height: 15.0),
                Divider(
                  color: Colors.grey,
                  height: 32,
                  indent: 32.0,
                  endIndent: 32.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        RawMaterialButton(
                          onPressed: () {
                            if (MetronomeBrain.isPlaying())
                              MetronomeBrain.togglePlaying();
                            setState(() {
                              (_currentValue <= _maxValue - 10)
                                  ? _currentValue += 10
                                  : _currentValue = _maxValue;
                              numPic.animateInt(_currentValue);
                            });
                          },
                          elevation: 2.0,
                          child: Text('+10', style: TextStyle(fontSize: 20.0)),
                          constraints: BoxConstraints.tightFor(
                            width: 48.0,
                            height: 48.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(6.0),
                            ),
                          ),
                          fillColor: kButtonGroupColor,
                        ),
                        SizedBox(height: 20.0),
                        RawMaterialButton(
                          onPressed: () {
                            if (MetronomeBrain.isPlaying())
                              MetronomeBrain.togglePlaying();
                            setState(() {
                              (_currentValue >= _minValue + 10)
                                  ? _currentValue -= 10
                                  : _currentValue = _minValue;
                              numPic.animateInt(_currentValue);
                            });
                          },
                          elevation: 2.0,
                          child: Text('-10', style: TextStyle(fontSize: 20.0)),
                          constraints: BoxConstraints.tightFor(
                            width: 48.0,
                            height: 48.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(6.0),
                            ),
                          ),
                          fillColor: kButtonGroupColor,
                        ),
                      ],
                    ),
                    numPic = NumberPicker.integer(
                      initialValue: _currentValue,
                      minValue: _minValue,
                      maxValue: _maxValue,
                      highlightSelectedValue: true,
                      onChanged: (val) {
                        if (MetronomeBrain.isPlaying())
                          MetronomeBrain.togglePlaying();
                        setState(() {
                          _currentValue = val;
                          MetronomeBrain.setBpm(_currentValue);
                        });
                      },
                    ),
                    Column(
                      children: <Widget>[
                        RawMaterialButton(
                          onPressed: () {
                            if (MetronomeBrain.isPlaying())
                              MetronomeBrain.togglePlaying();
                            setState(
                              () {
                                (_currentValue <= _maxValue - 5)
                                    ? _currentValue += 5
                                    : _currentValue = _maxValue;
                                numPic.animateInt(_currentValue);
                              },
                            );
                          },
                          elevation: 2.0,
                          child: Text('+5', style: TextStyle(fontSize: 20.0)),
                          constraints: BoxConstraints.tightFor(
                            width: 48.0,
                            height: 48.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(6.0),
                            ),
                          ),
                          fillColor: kButtonGroupColor,
                        ),
                        SizedBox(height: 20.0),
                        RawMaterialButton(
                          onPressed: () {
                            if (MetronomeBrain.isPlaying())
                              MetronomeBrain.togglePlaying();
                            setState(
                              () {
                                (_currentValue >= _minValue + 5)
                                    ? _currentValue -= 5
                                    : _currentValue = _minValue;
                                numPic.animateInt(_currentValue);
                              },
                            );
                          },
                          elevation: 2.0,
                          child: Text('-5', style: TextStyle(fontSize: 20.0)),
                          constraints: BoxConstraints.tightFor(
                            width: 48.0,
                            height: 48.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(6.0),
                            ),
                          ),
                          fillColor: kButtonGroupColor,
                        ),
                      ],
                    ),
                  ],
                ),
                Divider(
                  color: Colors.grey,
                  height: 32,
                  indent: 32.0,
                  endIndent: 32.0,
                ),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.brightness_1,
                      color: leftSignalColor,
                      size: 14,
                    ),
                    SizedBox(width: 2.0),
                    Icon(
                      Icons.brightness_1,
                      color: rightSignalColor,
                      size: 14,
                    ),
                  ],
                ),
                SizedBox(height: 30.0),
                RawMaterialButton(
                  onPressed: () {
                    MetronomeBrain.setBpm(_currentValue);
                    MetronomeBrain.togglePlaying();
                    Timer.periodic(MetronomeBrain.clickPeriod, (timer) {
                      if (MetronomeBrain.isPlaying() == false) {
                        timer.cancel();
                      } else {
                        MetronomeBrain.play();
                      }
                      setState(() {
                        setSignalColors();
                      });
                    });
                  },
                  elevation: MetronomeBrain.isPlaying() ? 0.0 : 2.0,
                  child: MetronomeBrain.isPlaying()
                      ? buttonIcon[1] // 1 = Pause Icon
                      : buttonIcon[0], // 0 = Play Icon
                  constraints: BoxConstraints.tightFor(
                    width: 96.0,
                    height: 96.0,
                  ),
                  shape: CircleBorder(),
                  fillColor: MetronomeBrain.isPlaying()
                      ? Color(0xFF2EE770)
                      : Color(0xFF1ED760),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

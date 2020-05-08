import 'package:flutter/material.dart';
import 'package:bpmcounter/bpm_counter_brain.dart';
import 'package:bpmcounter/constants.dart';

class BPMPage extends StatefulWidget {
  @override
  _BPMPageState createState() => _BPMPageState();
}

class _BPMPageState extends State<BPMPage> {
  BPMCounterBrain bpmBrain = BPMCounterBrain();

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
                Column(
                  children: <Widget>[
                    SizedBox(height: 60.0),
                    Text(
                      'Bpm Counter',
                      style: kPageTitleTextStyle,
                    ),
                    SizedBox(height: 15.0),
                    Divider(
                      color: Colors.grey,
                      height: 32,
                      indent: 32.0,
                      endIndent: 32.0,
                    ),
                    Text(
                      bpmBrain.getBpm().toString(),
                      style: TextStyle(
                        fontSize: 62.0,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      'bpm',
                      style: kLabelTextStyle,
                    ),
                    Divider(
                      color: Colors.grey,
                      height: 32,
                      indent: 32.0,
                      endIndent: 32.0,
                    ),
                    SizedBox(height: 5.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Expanded(
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              'average: ',
                              style: kLabelTextStyle,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              bpmBrain.getRawBpm().toStringAsFixed(2),
                              style: kNumberTextStyle,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Expanded(
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              'taps: ',
                              style: kLabelTextStyle,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              bpmBrain.getNumberOfTaps().toString(),
                              style: kNumberTextStyle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 35.0),
                RawMaterialButton(
                  onPressed: () {
                    setState(
                      () {
                        bpmBrain.calculateBpm();
                      },
                    );
                  },
                  elevation: 2.0,
                  child: Text(
                    'tap',
                    style: TextStyle(
                      fontSize: 52.0,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  constraints: BoxConstraints.tightFor(
                    width: 164.0,
                    height: 164.0,
                  ),
                  shape: CircleBorder(),
                  fillColor: Color(0xFF1ED760),
                ),
                SizedBox(height: 75.0),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

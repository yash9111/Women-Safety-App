// import 'dart:html';

import 'dart:html';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class SOSButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Center(
      child: Container(
        width: 200.0,
        height: 200.0,
        child: ElevatedButton(
          onPressed: () {
            _showSOSConfirmationDialog(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            // shadowColor: Colors.black,
            shape: CircleBorder(),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Icon(
                  Icons.warning,
                  size: 50.0,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 5.0),
              // Text(
              //   'SOS',
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 20.0,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSOSConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Emergency Alert'),
          content: Text('Are you sure you want to send an SOS?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Add code to send SOS alerts or notifications here.
                // You can call a function to handle the emergency alert.
                // For now, we'll just close the dialog.
                _sosFunction();

                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Send SOS'),
            ),
          ],
        );
      },
    );
  }
}

_sosFunction() async {
  AudioPlayer audioPlayer = AudioPlayer();

  // final String audioUrl = "assets/audios/sos.wav";

  // await audioPlayer.play(
  //     UrlSource(
  //         'https://commondatastorage.googleapis.com/codeskulptor-assets/Epoq-Lepidoptera.ogg'),
  //     volume: 100);

  audioPlayer.setSource(AssetSource('assets/audios/sos.wav'));
}

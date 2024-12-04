import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class MusicControls extends StatelessWidget {
  final AudioPlayer audioPlayer;
  final double currentPosition;
  final double duration;
  final Function(double) seekTo;

  MusicControls({
    required this.audioPlayer,
    required this.currentPosition,
    required this.duration,
    required this.seekTo,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Seek bar
        Slider(
          value: currentPosition,
          min: 0.0,
          max: duration,
          onChanged: (value) {
            seekTo(value);
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.shuffle),
              onPressed: () {
                // Implement shuffle functionality
              },
            ),
            IconButton(
              icon: Icon(Icons.repeat),
              onPressed: () {
                // Implement repeat functionality
              },
            ),
          ],
        ),
      ],
    );
  }
}

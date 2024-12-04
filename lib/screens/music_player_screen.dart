import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class MusicPlayerScreen extends StatefulWidget {
  final String mood;

  const MusicPlayerScreen({required this.mood, Key? key}) : super(key: key);

  @override
  _MusicPlayerScreenState createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  late AudioPlayer _audioPlayer;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();

    String audioFile = _getAudioFileForMood(widget.mood);
    _audioPlayer.setSource(AssetSource(audioFile));
  }

  String _getAudioFileForMood(String mood) {
    switch (mood) {
      case 'Happy':
        return 'assets/happy_song.mp3';
      case 'Sad':
        return 'assets/sad_song.mp3';
      case 'Relaxed':
        return 'assets/relaxed_song.mp3';
      case 'Energetic':
        return 'assets/energetic_song.mp3';
      case 'Angry':
        return 'assets/angry_song.mp3';
      default:
        return 'assets/default_song.mp3';
    }
  }

  void _togglePlayPause() async {
    if (_isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.resume();
    }
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Now Playing - ${widget.mood} Mood'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
              onPressed: _togglePlayPause,
              iconSize: 64,
              color: Colors.blue,
            ),
            SizedBox(height: 20),
            Text('Playing ${widget.mood} Music',
                style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}

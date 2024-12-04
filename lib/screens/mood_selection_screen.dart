import 'package:flutter/material.dart';
import 'package:melo/screens/music_player_screen.dart';

class MoodSelectionScreen extends StatefulWidget {
  final Function(String) updateTheme;

  const MoodSelectionScreen({required this.updateTheme, Key? key})
      : super(key: key);

  @override
  _MoodSelectionScreenState createState() => _MoodSelectionScreenState();
}

class _MoodSelectionScreenState extends State<MoodSelectionScreen> {
  String selectedMood = "Sad"; // Default mood
  double sliderValue = 0.0; // Slider value

  // Define moods and their corresponding icons
  final moods = ["Happy", "Sad", "Relaxed", "Energetic", "Angry"];
  final moodIcons = {
    "Happy": Icons.sentiment_satisfied,
    "Sad": Icons.sentiment_dissatisfied,
    "Relaxed": Icons.airline_seat_recline_normal,
    "Energetic": Icons.flash_on,
    "Angry": Icons.sentiment_very_dissatisfied,
  };

  // Map slider value to mood
  String getMoodFromSlider(double value) {
    if (value < 0.2) return "Sad";
    if (value < 0.4) return "Relaxed";
    if (value < 0.6) return "Happy";
    if (value < 0.8) return "Energetic";
    return "Angry";
  }

  // Update background color based on the slider value
  Color getBackgroundColor(double value) {
    if (value < 0.2) return Colors.blueGrey; // Sad mood color
    if (value < 0.4) return Colors.lightBlueAccent; // Relaxed mood color
    if (value < 0.6) return Colors.yellow; // Happy mood color
    if (value < 0.8) return Colors.orange; // Energetic mood color
    return Colors.red; // Angry mood color
  }

  // Function to handle mood selection via slider
  void onSliderChanged(double value) {
    setState(() {
      sliderValue = value;
      selectedMood = getMoodFromSlider(value);
    });
  }

  void navigateToMusicPlayer() {
    widget.updateTheme(selectedMood);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MusicPlayerScreen(mood: selectedMood),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: getBackgroundColor(sliderValue),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Selected Mood: $selectedMood',
                style: const TextStyle(fontSize: 24, color: Colors.white),
              ),
              const SizedBox(height: 30),
              Slider(
                value: sliderValue,
                min: 0.0,
                max: 1.0,
                divisions: 4,
                onChanged: onSliderChanged,
                activeColor: Colors.white,
                inactiveColor: Colors.grey,
              ),
              const SizedBox(height: 30),
              Icon(
                moodIcons[selectedMood],
                size: 100,
                color: Colors.white,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: navigateToMusicPlayer,
                child: const Text("Select Mood"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

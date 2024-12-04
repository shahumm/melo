import 'package:flutter/material.dart';
import '/models/song.dart';

class PlaylistTile extends StatelessWidget {
  final Song song;
  final VoidCallback onTap;

  PlaylistTile({required this.song, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(song.title),
      subtitle: Text(song.tags.join(", ")),
      onTap: onTap,
    );
  }
}

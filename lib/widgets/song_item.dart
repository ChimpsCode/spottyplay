import 'package:flutter/material.dart';
import 'package:music_player/models/song.dart';

class SongItem extends StatelessWidget {
  final Song song;

  const SongItem({Key? key, required this.song}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Handle song item click
      },
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset(
              song.albumArtImage,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  song.songName,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  song.artistName,
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

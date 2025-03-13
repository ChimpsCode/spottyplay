import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:music_player/models/playlist_provider.dart';
import 'package:music_player/pages/song_page.dart';

class MiniPlayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PlayListProvider>(
      builder: (context, playlistProvider, child) {
        if (playlistProvider.currentSongIndex == null) {
          return SizedBox.shrink(); // Return an empty widget if no song is selected
        }

        final currentSong = playlistProvider.playlist[playlistProvider.currentSongIndex!];
        final totalDuration = playlistProvider.totalDuration.inSeconds.toDouble();
        final progress = totalDuration > 0
            ? playlistProvider.currentDuration.inSeconds.toDouble() / totalDuration
            : 0.0;

        return GestureDetector(
          onTap: () async {
            // Navigate to the song details screen with a smooth animation
            await Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) => SongPage(),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  const begin = Offset(0.0, 1.0);
                  const end = Offset.zero;
                  const curve = Curves.ease;

                  var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

                  return SlideTransition(
                    position: animation.drive(tween),
                    child: child,
                  );
                },
              ),
            );
          },
          child: Container(
            color: Colors.black,
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            margin: EdgeInsets.only(bottom: 0.0), // Adjust margin to avoid spaces
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(
                      currentSong.albumArtImage,
                      width: 40,
                      height: 40,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          currentSong.songName,
                          style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          currentSong.artistName,
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ],
                    ),
                    Spacer(),
                    IconButton(
                      icon: Icon(Icons.skip_previous, color: Colors.white),
                      onPressed: () {
                        playlistProvider.playPreviousSong();
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        playlistProvider.isPlaying ? Icons.pause : Icons.play_arrow,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        playlistProvider.pauseOrResume();
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.skip_next, color: Colors.white),
                      onPressed: () {
                        playlistProvider.playNextSong();
                      },
                    ),
                  ],
                ),
                LinearProgressIndicator(
                  value: progress,
                  backgroundColor: const Color.fromARGB(255, 73, 73, 73),
                  color: Colors.green,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

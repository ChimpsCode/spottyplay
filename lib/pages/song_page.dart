import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:music_player/components/neu_box.dart';
import 'package:music_player/models/playlist_provider.dart';
import 'package:provider/provider.dart';

class SongPage extends StatefulWidget {
  const SongPage({super.key});

  @override
  _SongPageState createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {
  ScrollController _scrollController = ScrollController();
  Timer? _scrollTimer;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  @override
  void dispose() {
    _scrollTimer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  void _startAutoScroll() {
    _scrollTimer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.offset + 2,
          duration: Duration(milliseconds: 50),
          curve: Curves.linear,
        );
      }
    });
  }

  // convert duration into min/seconds
  String formatTime(Duration duration) {
    String digitSeconds =
        duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    String formattedTime = "${duration.inMinutes}:$digitSeconds";

    return formattedTime;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PlayListProvider>(
      builder: (context, value, child) {
        //get playlits
        final playlist = value.playlist;

        //get current song index
        final currentSong = playlist[value.currentSongIndex ?? 0];
        final isFavorite = value.favoriteSongs.contains(currentSong);

        //return scaffold UI
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //app bar
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // arrow down button
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context, true);
                          },
                          icon: const Icon(Icons.arrow_downward),
                        ),
                        //title
                        const Text(
                          "P L A Y I N G",
                        ),
                        //menue button
                        IconButton(
                          onPressed: () {
                            value.toggleFavorite(currentSong);
                          },
                          icon: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            color: isFavorite ? Colors.red : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),
                  //album artwork
                  NueBox(
                    child: Column(
                      children: [
                        //image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(currentSong.albumArtImage),
                        ),

                        //song and artist name
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // song and arist name
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    currentSong.songName,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    currentSong.artistName,
                                  ),
                                ],
                              ),
                              //heart icon
                              IconButton(
                                onPressed: () {
                                  value.toggleFavorite(currentSong);
                                },
                                icon: Icon(
                                  isFavorite ? Icons.favorite : Icons.favorite_border,
                                  color: isFavorite ? Colors.red : Colors.black,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //start and end time
                              Text(
                                formatTime(value.currentDuration),
                              ),

                              //shuffle icon
                              IconButton(
                                onPressed: () {
                                  value.toggleShuffle();
                                },
                                icon: Icon(
                                  Icons.shuffle,
                                  color: value.isShuffleActivated
                                      ? Colors.green
                                      : Colors.black,
                                ),
                              ),

                              //repeat icon
                              IconButton(
                                onPressed: () {
                                  value.loop();
                                },
                                icon: Icon(
                                  Icons.repeat,
                                  color: value.isLoopActivated
                                      ? Colors.green
                                      : Colors.black,
                                ),
                              ),
                              //end time
                              Text(
                                formatTime(value.totalDuration),
                              ),
                            ],
                          ),
                        ),

                        //song duration progress
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbShape: const RoundSliderThumbShape(
                                enabledThumbRadius: 0),
                          ),
                          child: Slider(
                            min: 0,
                            max: max(
                              value.totalDuration.inSeconds.toDouble(),
                              value.currentDuration.inSeconds.toDouble(),
                            ),
                            value: min(
                              value.currentDuration.inSeconds.toDouble(),
                              value.totalDuration.inSeconds.toDouble(),
                            ),
                            activeColor: Colors.black, //add a background for slider =============
                            onChanged: (double double) {
                              //when the user is sliding around
                            },
                            onChangeEnd: (double double) {
                              //sliding has finished go to that position in song duration
                              value.seek(Duration(seconds: double.toInt()));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 15), // Adjusted to move controls up
                  //playback controls
                  Row(
                    children: [
                      //skip pervious
                      Expanded(
                        child: GestureDetector(
                          onTap: value.playPreviousSong,
                          child: const NueBox(
                            child: Icon(Icons.skip_previous),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      //play pause
                      Expanded(
                        flex: 2,
                        child: GestureDetector(
                          onTap: value.pauseOrResume,
                          child: NueBox(
                            child: Icon(value.isPlaying
                                ? Icons.pause
                                : Icons.play_arrow),
                          ),
                        ),
                      ),

                      const SizedBox(width: 20),
                      // skip forword
                      Expanded(
                        child: GestureDetector(
                          onTap: value.playNextSong,
                          child: const NueBox(
                            child: Icon(Icons.skip_next),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  // Lyrics section
                  Expanded(
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 5.0,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Text(
                          currentSong.lyrics ?? 'No lyrics available',
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:music_player/models/playlist_provider.dart';
import 'package:music_player/widgets/song_item.dart';
import 'package:music_player/widgets/mini_player.dart';

class PlaylistScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Playlist'),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FavoritesScreen()),
                );
              },
              child: Text('Favorites'),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<PlayListProvider>(
              builder: (context, playlistProvider, child) {
                return ListView.builder(
                  itemCount: playlistProvider.playlist.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        playlistProvider.currentSongIndex = index;
                      },
                      child: SongItem(song: playlistProvider.playlist[index]),
                    );
                  },
                );
              },
            ),
          ),
          LyricsBox(),
          MiniPlayer(),
        ],
      ),
    );
  }
}

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: Consumer<PlayListProvider>(
        builder: (context, playlistProvider, child) {
          final favoriteSongs = playlistProvider.favoriteSongs;
          if (favoriteSongs.isEmpty) {
            return Center(child: Text('No favorite songs'));
          }
          return ListView.builder(
            itemCount: favoriteSongs.length,
            itemBuilder: (context, index) {
              return SongItem(song: favoriteSongs[index]);
            },
          );
        },
      ),
    );
  }
}

class PlayingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Now Playing'),
      ),
      body: Stack(
        children: [
          Center(
            child: Text('Playing Screen Content'),
          ),
          MiniPlayer(),
        ],
      ),
    );
  }
}

class LyricsBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PlayListProvider>(
      builder: (context, playlistProvider, child) {
        if (playlistProvider.currentSongIndex == null) {
          return SizedBox.shrink(); // Return an empty widget if no song is selected
        }

        final currentSong = playlistProvider.playlist[playlistProvider.currentSongIndex!];

        return Container(
          margin: EdgeInsets.all(10.0),
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
          child: SingleChildScrollView(
            child: Text(
              currentSong.lyrics ?? 'No lyrics available',
              style: TextStyle(color: Colors.black, fontSize: 14),
            ),
          ),
        );
      },
    );
  }
}

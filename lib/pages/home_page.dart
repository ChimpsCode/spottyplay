import 'package:flutter/material.dart';
import 'package:music_player/components/drawer.dart';
import 'package:music_player/models/playlist_provider.dart';
import 'package:music_player/models/song.dart';
import 'package:music_player/widgets/mini_player.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //get playlist provider
  late final dynamic playlistProvider;
  int _selectedIndex = 0;
  List<Song> _selectedFavorites = [];

  @override
  void initState() {
    super.initState();

    //get playlist provider
    playlistProvider = Provider.of<PlayListProvider>(context, listen: false);
  }

  //go to a song
  void goToSong(int songIndex) {
    //udpate index
    playlistProvider.currentSongIndex = songIndex;
  }

  // Widget for Home section
  Widget _buildHomeSection() {
    return Consumer<PlayListProvider>(builder: (context, value, child) {
      //get the playlist
      final List<Song> playlist = value.playlist;
      final List<Song> recentlyPlayed = value.recentlyPlayed.take(4).toList();
      final List<Song> musicForYou = playlist.take(5).toList();

      return ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Recently Played",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemCount: recentlyPlayed.length,
            itemBuilder: (context, index) {
              final song = recentlyPlayed[index];
              return GestureDetector(
                onTap: () => goToSong(playlist.indexOf(song)),
                child: Column(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          margin: EdgeInsets.all(8),
                          child: Image.asset(
                            song.albumArtImage,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      song.songName,
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Music for You",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ...musicForYou.map((song) => ListTile(
                title: Text(song.songName),
                subtitle: Text(song.artistName),
                leading: Image.asset(song.albumArtImage),
                onTap: () => goToSong(playlist.indexOf(song)),
              )),
        ],
      );
    });
  }

  // Widget for Playlist section
  Widget _buildPlaylistSection() {
    return Consumer<PlayListProvider>(
      builder: (context, playlistProvider, child) {
        return ListView.builder(
          itemCount: playlistProvider.playlist.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                playlistProvider.currentSongIndex = index;
              },
              child: ListTile(
                title: Text(playlistProvider.playlist[index].songName),
                subtitle: Text(playlistProvider.playlist[index].artistName),
                leading: Image.asset(playlistProvider.playlist[index].albumArtImage),
              ),
            );
          },
        );
      },
    );
  }

  // Widget for Favorites section
  Widget _buildFavoritesSection() {
    return Consumer<PlayListProvider>(
      builder: (context, playlistProvider, child) {
        final favoriteSongs = playlistProvider.favoriteSongs;
        if (favoriteSongs.isEmpty) {
          return Center(child: Text('No favorite songs'));
        }
        return ListView.builder(
          itemCount: favoriteSongs.length,
          itemBuilder: (context, index) {
            final song = favoriteSongs[index];
            final isSelected = _selectedFavorites.contains(song);
            return Dismissible(
              key: Key(song.songName),
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Icon(Icons.delete, color: Colors.white),
              ),
              onDismissed: (direction) {
                playlistProvider.toggleFavorite(song);
              },
              child: ListTile(
                title: Text(song.songName),
                subtitle: Text(song.artistName),
                leading: Image.asset(song.albumArtImage),
                trailing: isSelected ? Icon(Icons.check_box) : null,
                onTap: () {
                  if (_selectedFavorites.isNotEmpty) {
                    setState(() {
                      if (isSelected) {
                        _selectedFavorites.remove(song);
                      } else {
                        _selectedFavorites.add(song);
                      }
                    });
                  } else {
                    goToSong(playlistProvider.playlist.indexOf(song));
                  }
                },
                onLongPress: () {
                  setState(() {
                    if (isSelected) {
                      _selectedFavorites.remove(song);
                    } else {
                      _selectedFavorites.add(song);
                    }
                  });
                },
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
        centerTitle: true,
        toolbarHeight: 60.2,
        toolbarOpacity: 0.8,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = 0;
                });
              },
              child: Text(
                "Home",
                style: TextStyle(
                  color: _selectedIndex == 0 ? const Color.fromARGB(255, 68, 177, 38) : Colors.grey,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = 1;
                });
              },
              child: Text(
                "Playlist",
                style: TextStyle(
                  color: _selectedIndex == 1 ? const Color.fromARGB(255, 68, 177, 38) : Colors.grey,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = 2;
                });
              },
              child: Text(
                "Favorites",
                style: TextStyle(
                  color: _selectedIndex == 2 ? const Color.fromARGB(255, 68, 177, 38) : Colors.grey,
                ),
              ),
            ),
          ],
        ),
        actions: _selectedFavorites.isNotEmpty
            ? [
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    setState(() {
                      _selectedFavorites.forEach((song) {
                        playlistProvider.toggleFavorite(song);
                      });
                      _selectedFavorites.clear();
                    });
                  },
                ),
              ]
            : null,
      ),
      drawer: const MyDrawer(),
      body: Column(
        children: [
          Expanded(
            child: _selectedIndex == 0
                ? _buildHomeSection()
                : _selectedIndex == 1
                    ? _buildPlaylistSection()
                    : _buildFavoritesSection(),
          ),
          MiniPlayer(),
        ],
      ),
    );
  }
}

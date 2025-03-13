import 'package:flutter/material.dart';
import 'package:music_player/models/playlist_provider.dart';
import 'package:music_player/pages/splash_screen.dart';
import 'package:music_player/theme/theme_provider.dart';
import 'package:music_player/widgets/song_item.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => PlayListProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}

class PlaylistScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Playlist'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<PlayListProvider>(
              builder: (context, playlistProvider, child) {
                return ListView.builder(
                  itemCount: playlistProvider.playlist.length,
                  itemBuilder: (context, index) {
                    return SongItem(song: playlistProvider.playlist[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

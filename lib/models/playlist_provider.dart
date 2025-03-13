import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_player/models/song.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;

class PlayListProvider extends ChangeNotifier {
  final List<Song> _playlist = [
    Song(
      songName: "Died Once",
      artistName: "Yeat",
      albumArtImage: "assets/images/yeat_cover.jpg",
      audioPath: "audio/DiedOnce.mp3",
      lyrics: """Yeah, I ain't try once
They say, "Yeat, how you so fire?" 'Cause I ain't try once
Got the Trackhawk in the back, I heard it whine once (woo)
I took way too many Percs, I think I died once (woo)
Got the Cayenne sitting outside, I seen it fly once (SK-K-K-KY)
Got the Cuban on my body, I rolled the dice once (yeah)
They say, "How many times you died?" I only died once
They say, "How many times you fly?" I'm flyin' private every time
Yeah, I just pulled up in a monster
I just pulled up with the mob, we pulled up in a Tonker
Yeah, huh, bitch, I'm going bonkers
Wifey came and ate me up, that bitch just got some chompers
Five thousand dollar pants, bitch, I call 'em rompers (ack)
If it ain't about the bands, why the hell would I convert?
Why? Tell me, yeah, tell me (tell me, yeah)
Why? Tell me (yeah), tell me (yeah)
Sipping on the Tosie, bitch, it done hurt my tummy
Smashing on this broad, she feel it in her stomach (let's go)
I just sip the drank, a dirtbag, get that copy, bitch, they 'bout me
I call all my twizzys, "Dawg, " let them bark, don't got a bounty
My twizzy on the run, we got to get up out this county
Y'all be sippin' on fake lean, that shit some soap, you sippin' bounty (bounty)
Yes, they say that I'm the G.O.A.T., so where the fuck is my lil' crown-y? (crown-y)
Got a new bitch in the back, got another one staying down me (go)
(SK-K-K-KY)
Yeah, I ain't try once
They say, "Yeat, how you so fire?" 'Cause I ain't try once
Got the Trackhawk in the back, I heard it whine once (woo)
I took way too many Percs, I think I died once (woo)
Got the Cayenne sitting outside, I seen it fly once
Got the Cuban on my body, I rolled the dice once (yeah)
They say, "How many times you died?" I only died once
They say, "How many times you fly?" I'm flyin' private every time""",
    ),
    Song(
      songName: "Paris",
      artistName: "ZIAD ZAZA",
      albumArtImage: "assets/images/zaza_cover.jpg",
      audioPath: "audio/ZIADZAZAPARIS.mp3",
      lyrics: """We were stayin' in Paris
To get away from your parents
And I thought, "Wow
If I could take this in a shot right now
I don't think that we could work this out"
Out on the terrace
I don't know if it's fair, but I thought, "How
Could I let you fall by yourself
While I'm wasted with someone else?"

[Chorus: Andrew Taggart]
If we go down, then we go down together
They'll say you could do anything
They'll say that I was clever
If we go down, then we go down together
We'll get away with everything
Let's show them we are better

[Refrain: Andrew Taggart]
Let's show them we are better
Let's show them we are better

[Verse 2: Andrew Taggart]
We were stayin' in Paris
To get away from your parents
You look so proud
Standing there with a frown and a cigarette
Postin' pictures of yourself on the Internet
Out on the terrace
We breathe in the air of this small town
On our own, cuttin' class for the thrill of it
Gettin' drunk on the past we were livin' in""",
    ),
    Song(
      songName: "Marilag",
      artistName: "Dionela Belono-ac",
      albumArtImage: "assets/images/S1.jpg",
      audioPath: "audio/marilag.mp3",
      lyrics: """Hotshot running in mind nonstop vertigo
Curled plot whiskey in a teapot ethanol
Burnin' like KELT-9b bright heavenly body
Only music can define you and it sounds like ah
You're like a
D'amalfi in a bar Au in a goose
A photo of me knocked Chuck point black smooth
Ikaw ang minsan sa mga palagi
Ang mitolohiya sa'yo'y maaari (hey)
Shawty you don't need no makeup (ah)
Brown-eyed chick northside beauty stand out
Pretty pretty lady Big Bang doesn't make sense
I see God in your face girl I mean it
Marilag
Ang himala'y sa'yo ibibintang
Haven't felt so divine 'til I looked in your eyes
I see my future
Baby loving you saved me
I wonder what genre was in heaven
When I caught a glimpse of it coming from your lips babe
Music to my ears babe makin' the whole place okay
Girl you are my Friday
A reason to give my thanks I love every part of you
Can we slow down
Girl I don't wanna miss a thing
Ibigin ka'y drama sa teatrong upua'y limitado
Bawat kislap ng mata'y kawalan oo (hey)
Shawty you don't need no makeup (ah)
Brown-eyed chick northside beauty stand out (ooh)
Pretty pretty lady Big Bang doesn't make sense
I see God in your face girl I mean it
Marilag
Ang himala'y sa'yo ibibintang
Haven't felt so divine 'til I looked in your eyes (haven't felt so divine)
I see my future (ooh)
Baby loving you saved me (loving you saved me)
Hotshot running in mind nonstop vertigo
Curled plot whiskey in a teapot ethanol (I don't wanna live this love without you girl)
Burnin' like KELT-9b bright heavenly body
Only music can define you and it sounds like""",
    ),
    Song(
      songName: "goodbye",
      artistName: "airsupply",
      albumArtImage: "assets/images/S7.jpg",
      audioPath: "audio/goodbye.mp3",
      lyrics: """I can see the pain living in your eyes
And I know how hard you try
You deserve to have so much more
I can feel your heart and I sympathize
And I'll never criticize all you've ever meant to my life
I don't want to let you down
I don't want to lead you on
I don't want to hold you back
From where you might belong
You would never ask me why
My heart is so disguised
I just can't live a lie anymore
I would rather hurt myself
Than to ever make you cry
There's nothing left to say but good-bye
You deserve the chance at the kind of love
I'm not sure I'm worthy of
Losing you is painful to me
My heart is so disguised
I just can't live a lie anymore
I would rather hurt myself
Than to ever make you cry
There's nothing left to try
Though it's gonna hurt us both
There's no other way than to say good-bye""",
    ),
    Song(
      songName: "Imahe",
      artistName: "Kuya Kim",
      albumArtImage: "assets/images/S5.jpg",
      audioPath: "audio/image.mp3",
      lyrics: """Kinukulayan ang isipan
Pabalik sa nakaraan
'Wag mo ng balikan
Patuloy ka lang masasaktan
Hindi nagkulang kakaisip
Sa isang magandang larawan
Paulit-ulit na binabanggit
Ang pangalang nakasanayan
Tayo ay pinagtagpo
Ngunit hindi tinadhana
Sadyang mapaglaro itong mundo
Kinalimutan kahit nahihirapan
Para sa sariling kapakanan
Kinalimutan kahit nahihirapan
Mga oras na hindi na mababalikan
Pinagtagpo
Ngunit hindi tinadhana
Puso natin ay hindi
Sa isa't-isa
Hindi na maibabalik ang dati nating pagsasama
Ang tamis ng iyong halik ay di na madarama
Pangako sa isa't-isa ay 'di na mabubuhay pa
Paaalam sa 'ting pagibig na minsa'y pinag-isa
Tayo ay pinagtagpo
Ngunit hindi tinadhana
Sadyang mapaglaro itong mundo
Kinalimutan kahit nahihirapan
Para sa sariling kapakanan
Kinalimutan kahit nahihirapan
Mga oras na hindi na mababalikan
Pinagtagpo
Ngunit hindi tinadhana
Puso natin ay hindi
Sa isa't-isa
Kinalimutan kahit nahihirapan
Para sa sariling kapakanan
Kinalimutan kahit nahihirapan
Pagibig na ating sinayang
Pinagtagpo
Ngunit hindi tinadhana
Hanggang dito na lang tayo
Kinalimutan kahit nahihirapan (oh)
Para sa sariling kapakanan (oh)
Kinalimutan kahit nahihirapan (oh)
Mga oras na hindi na mababalikan
Pinagtagpo
Ngunit hindi tinadhana
Puso natin ay hindi
Sa isa't-isa""",
    ),
    Song(
      songName: "Perfect",
      artistName: "Ed Caluag",
      albumArtImage: "assets/images/S4.jpg",
      audioPath: "audio/perfect.mp3",
      lyrics: """I found a love for me
Oh, darling, just dive right in and follow my lead
Well, I found a girl, beautiful and sweet
Oh, I never knew you were the someone waitin' for me
'Cause we were just kids when we fell in love, not knowin' what it was
I will not give you up this time
Oh, darling, just kiss me slow, your heart is all I own
And in your eyes, you're holding mine
Baby, I'm dancin' in the dark with you between my arms
Barefoot on the grass while listenin' to our favourite song
When you said you looked a mess, I whispered underneath my breath
But you heard it, "Darling, you look perfect tonight"
Well, I found a woman, stronger than anyone I know
She shares my dreams, I hope that someday, I'll share her home
I found a love to carry more than just my secrets
To carry love, to carry children of our own
We are still kids, but we're so in love, fightin' against all odds
I know we'll be alright this time
Darling, just hold my hand, be my girl, I'll be your man
I see my future in your eyes
Oh, baby, I'm dancin' in the dark with you between my arms
Barefoot on the grass while listenin' to our favourite song
When I saw you in that dress, lookin' so beautiful
I don't deserve this, darling, you look perfect tonight
No, no, no
Mm, oh
Baby, I'm dancin' in the dark with you between my arms
Barefoot on the grass, oh, listenin' to our favourite song
I have faith in what I see, now I know I have met
An angel in person, and she looks perfect
Though I don't deserve this, you look perfect tonight""",
    ),
    Song(
      songName: "What Makes You Beautiful",
      artistName: "One Direction",
      albumArtImage: "assets/images/S8.jpg",
      audioPath: "audio/what_makes_you_beautiful.mp3",
      lyrics: """You're insecure, don't know what for
You're turnin' heads when you walk through the door
Don't need makeup to cover up (Huh)   
Bein' the way that you are is enough

[Pre-Chorus: Harry]
Everyone else in the room can see it
Everyone else but you

[Chorus: All & Harry]
Baby, you light up my world like nobody else
The way that you flip your hair gets me overwhelmed
But when you smile at the ground, it ain't hard to tell
You don't know, oh-oh, you don't know you're beautiful
If only you saw what I can see
You'll understand why I want you so desperately
Right now I'm looking at you and I can't believe
You don't know, oh-oh, you don't know you're beautiful, oh-oh
That's what makes you beautiful

[Verse 2: Zayn]
So c-come on, you got it wrong
To prove I'm right, I put it in a song
I don't know why you're being shy
And turn away when I look into your eyes""",
    ),
    Song(
      songName: "Your Song",
      artistName: "Parokya ni Zata",
      albumArtImage: "assets/images/S2.jpg",
      audioPath: "audio/your_song.mp3",
      lyrics: """It took one look
And forever lay out in front of me
One smile, then I died
Only to be revived by you
There I was
Thought I had everything figured out
Goes to show just how much I know
'Bout the way life plays out
I take one step away
Then I find myself coming back to you
My one and only
One and only you
Ooh
Now I know
That I know not a thing at all
Except the fact that I am yours
And that you are mine
Oh
They told me that this wouldn't be easy
And no
I'm not one to complain
I take one step away
Then I find myself coming back to you
My one and only
One and only
I take one step away
Then I find myself coming back to you
My one and only
One and only you""",
    ),
    Song(
      songName: "Blue",
      artistName: "John Cena",
      albumArtImage: "assets/images/S3.jpg",
      audioPath: "audio/blue.mp3",
      lyrics: """Your morning eyes, I could stare like watching stars
I could walk you by, and I'll tell without a thought
You'd be mine, would you mind if I took your hand tonight?
Know you're all that I want this life

[Chorus]
I'll imagine we fell in love
I'll nap under moonlight skies with you
I think I'll picture us, you with the waves
The ocean's colors on your face
I'll leave my heart with your air
So let me fly with you
Will you be forever with me?

[Verse 2]
My love will always stay by you
I'll keep it safe, so don't you worry a thing
I'll tell you I love you more
It's stuck with you forever, so promise you won't let it go
I'll trust the universe will always bring me to you

[Chorus]
I'll imagine we fell in love
I'll nap under moonlight skies with you
I think I'll picture us, you with the waves
The ocean's colors on your face
I'll leave my heart with your air
So let me fly with you
Will you be forever with me?""",
    ),
    Song(
      songName: "Apt",
      artistName: "Jerimiah and Maria Karey",
      albumArtImage: "assets/images/S6.jpg",
      audioPath: "audio/apt.mp3",
      lyrics: """채영이가 좋아하는 랜덤 게임, 랜덤 게임
Game start
아파트, 아파트, 아파트, 아파트
아파트, 아파트, uh, uh-huh, uh-huh
아파트, 아파트, 아파트, 아파트
아파트, 아파트, uh, uh-huh, uh-huh
Kissy face, kissy face sent to your phone, but
I'm trying to kiss your lips for real (uh-huh, uh-huh)
Red hearts, red hearts, that's what I'm on, yeah
Come give me somethin' I can feel, oh-oh-oh
Don't you want me like I want you, baby?
Don't you need me like I need you now?
Sleep tomorrow, but tonight go crazy
All you gotta do is just meet me at the
아파트, 아파트, 아파트, 아파트
아파트, 아파트, uh, uh-huh, uh-huh
아파트, 아파트, 아파트, 아파트
아파트, 아파트, uh, uh-huh, uh-huh
It's whatever, it's whatever, it's whatever you like (whoo)
Turn this 아파트 into a club (uh-huh, uh-huh)
I'm talking drink, dance, smoke, freak, party all night (come on)
건배, 건배, girl, what's up? Oh-oh-oh
Don't you want me like I want you, baby?
Don't you need me like I need you now?
Sleep tomorrow, but tonight go crazy
All you gotta do is just meet me at the
아파트, 아파트, 아파트, 아파트
아파트, 아파트, uh, uh-huh, uh-huh
아파트, 아파트, 아파트, 아파트
아파트, 아파트, uh, uh-huh, uh-huh
Hey, so now you know the game
Are you ready? 'Cause I'm comin' to get you, get you, get you
Hold on, hold on, I'm on my way
Yeah, yeah, yeah, yeah, yeah, I'm on my way
Hold on, hold on, I'm on my way
Yeah, yeah, yeah, yeah, yeah, I'm on my way
Don't you want me like I want you, baby?
Don't you need me like I need you now?
Sleep tomorrow, but tonight go crazy
All you gotta do is just meet me at the
아파트, 아파트, 아파트, 아파트
아파트, 아파트, uh, uh-huh, uh-huh (just meet me at the)
아파트, 아파트, 아파트, 아파트
아파트, 아파트, uh, uh-huh, uh-huh (just meet me at the)
아파트, 아파트, 아파트, 아파트
아파트, 아파트, uh, uh-huh, uh-huh (just meet me at the)
아파트, 아파트, 아파트, 아파트
아파트, 아파트, uh, uh-huh, uh-huh""",
    ),
  ];

  final List<Song> _favoriteSongs = [];
  final List<Song> _recentlyPlayed = [];

  // Current song index
  int? _currentSongIndex;

  // Audio player
  final AudioPlayer _audioPlayer = AudioPlayer();

  // Loop
  bool _isLoopActivated = false;
  bool get isLoopActivated => _isLoopActivated;

  // Shuffle confirmation
  bool _isShuffleActivated = false;
  bool get isShuffleActivated => _isShuffleActivated;

  // Shuffle
  List<Song> _shuffledPlaylist = [];

  // Duration
  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;

  // Constructor
  PlayListProvider() {
    listenToDuration();
    resizeAllImages();
  }

  // Initially not playing
  bool _isPlaying = false;

  // Play the song
  void play() async {
    final String path = _playlist[_currentSongIndex!].audioPath;
    await _audioPlayer.stop(); // stop current song
    await _audioPlayer.play(AssetSource(path)); // play the new song
    _isPlaying = true;
    addRecentlyPlayed(_playlist[_currentSongIndex!]);
    notifyListeners();
  }

  // Pause current song
  void pause() async {
    await _audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

  // Resume playing
  void resume() async {
    await _audioPlayer.resume();
    _isPlaying = true;
    notifyListeners();
  }

  // Pause or resume
  void pauseOrResume() {
    if (_isPlaying) {
      pause();
    } else {
      resume();
    }
    notifyListeners();
  }

  // Loop the song
  void loop() {
    _isLoopActivated = !_isLoopActivated;
    _audioPlayer.setReleaseMode(
        _isLoopActivated ? ReleaseMode.loop : ReleaseMode.release);
    notifyListeners();
  }

  // Shuffle the playlist
  void toggleShuffle() {
    _isShuffleActivated = !_isShuffleActivated;
    if (_isShuffleActivated) {
      _shuffledPlaylist = List.of(_playlist)..shuffle();
      _currentSongIndex =
          _shuffledPlaylist.indexOf(_playlist[_currentSongIndex!]);
    } else {
      _shuffledPlaylist = [];
    }
    notifyListeners();
  }

  // Seek to position in current song
  void seek(Duration position) async {
    await _audioPlayer.seek(position);
  }

  // Play next song
  void playNextSong() {
    if (_currentSongIndex != null) {
      if (_currentSongIndex! < _playlist.length - 1) {
        // Go to the next song if it's not the last song
        _currentSongIndex = _currentSongIndex! + 1;
      } else {
        // If it's the last song, loop back to the first song
        _currentSongIndex = 0;
      }
      play();
    }
  }

  // Play previous song
  void playPreviousSong() async {
    // If more than 2 seconds have passed, restart the current song
    if (_currentDuration.inSeconds > 2) {
      seek(Duration.zero);
    } else {
      if (_currentSongIndex! > 0) {
        _currentSongIndex = _currentSongIndex! - 1;
      } else {
        // If it's the first song, loop back to the last song
        _currentSongIndex = _playlist.length - 1;
      }
      play();
    }
  }

  // Listen to duration
  void listenToDuration() {
    // Listen for total duration
    _audioPlayer.onDurationChanged.listen((newDuration) {
      _totalDuration = newDuration;
      notifyListeners();
    });
    // Listen for current duration
    _audioPlayer.onPositionChanged.listen((newPosition) {
      _currentDuration = newPosition;
      notifyListeners();
    });

    // Listen for song completion
    _audioPlayer.onPlayerComplete.listen((event) {
      playNextSong();
    });
  }

  // Add or remove favorite song
  void toggleFavorite(Song song) {
    if (_favoriteSongs.contains(song)) {
      _favoriteSongs.remove(song);
    } else {
      _favoriteSongs.add(song);
    }
    notifyListeners();
  }

  // Add to recently played
  void addRecentlyPlayed(Song song) {
    if (_recentlyPlayed.contains(song)) {
      _recentlyPlayed.remove(song);
    }
    _recentlyPlayed.insert(0, song);
    if (_recentlyPlayed.length > 10) {
      _recentlyPlayed.removeLast();
    }
    notifyListeners();
  }

  // Getters
  List<Song> get playlist => _playlist;
  List<Song> get favoriteSongs => _favoriteSongs;
  List<Song> get recentlyPlayed => _recentlyPlayed;
  int? get currentSongIndex => _currentSongIndex;
  bool get isPlaying => _isPlaying;
  Duration get currentDuration => _currentDuration;
  Duration get totalDuration => _totalDuration;

  get playpreviousSong => null;

  // Setters
  set currentSongIndex(int? newIndex) {
    // To update current song index
    _currentSongIndex = newIndex;

    if (newIndex != null) {
      play(); // Play the song at the new index
    }

    // Update
    notifyListeners();
  }

  // Method to resize image
  Future<Uint8List> resizeImage(String imagePath, int width, int height) async {
    ByteData data = await rootBundle.load(imagePath);
    ui.Codec codec = await ui.instantiateImageCodec(
      data.buffer.asUint8List(),
      targetWidth: width,
      targetHeight: height,
    );
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
  }

  // Method to resize all images in the playlist
  void resizeAllImages() async {
    for (var song in _playlist) {
      song.albumArtImage = (await resizeImage(song.albumArtImage, 100, 100)) as String;
    }
    notifyListeners();
  }
}

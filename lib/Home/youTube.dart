// import 'package:flutter/material.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// class youTube extends StatefulWidget {
//   const youTube({super.key});

//   @override
//   State<youTube> createState() => _youTubeState();
// }

// class _youTubeState extends State<youTube> {
//   @override
//   String? videoId = YoutubePlayer.convertUrlToId(
//       "https://www.youtube.com/watch?v=BBAyRBTfsOU");
//   YoutubePlayerController _controller = YoutubePlayerController(
//     initialVideoId:,
//     flags: YoutubePlayerFlags(
//       autoPlay: true,
//       mute: true,
//     ),
//   );

//   Widget build(BuildContext context) {
//     return YoutubePlayerBuilder(
//         player: YoutubePlayer(
//           controller: _controller,
//         ),
//         builder: (context, player) {
//           return Column(
//             children: [
//               // some widgets
//               player,
//               //some other widgets
//             ],
//           );
//         });
//   }
// }

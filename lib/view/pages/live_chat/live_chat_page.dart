import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class LiveChatPage extends StatefulWidget {
  const LiveChatPage({super.key});

  static const String routeName = '/live_chat_page';

  @override
  State<LiveChatPage> createState() => _LiveChatPageState();
}

class _LiveChatPageState extends State<LiveChatPage> {
  late VideoPlayerController _controller;

  final List<Map<String, String>> comments = [
    {
      "name": "Everhart Tween",
      "message": "Thanks for sharing doctor",
      "avatar": "https://i.pravatar.cc/150?img=5",
    },
    {
      "name": "Bonebrake Mash",
      "message": "They treat immune system disorders",
      "avatar": "https://i.pravatar.cc/150?img=2",
    },
    {
      "name": "Handler Wack",
      "message": "This is the largest directory 👍",
      "avatar": "https://i.pravatar.cc/150?img=3",
    },
    {
      "name": "Comfort Love",
      "message": "Depending on their education 👩‍🎓",
      "avatar": "https://i.pravatar.cc/150?img=4",
    },
  ];

  @override
  void initState() {
    super.initState();

    // Gunakan video open source (contoh dari Coverr)
    _controller = VideoPlayerController.networkUrl(
        Uri.parse(
          'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
        ),
      )
      ..initialize()
          .then((_) {
            _controller.setLooping(true);
            _controller.setVolume(0);
            _controller.play();
            setState(() {});
          })
          .catchError((error) {
            debugPrint("Error initializing video: $error");
          });

    _controller.addListener(() {
      if (_controller.value.hasError) {
        debugPrint("Video Error: ${_controller.value.errorDescription}");
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildCommentItem(Map<String, String> comment) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(comment["avatar"]!),
            radius: 18,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  comment["name"]!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  comment["message"]!,
                  style: const TextStyle(color: Colors.white70, fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Background Video
          Positioned.fill(
            child:
                _controller.value.isInitialized
                    ? FittedBox(
                      fit: BoxFit.cover,
                      child: SizedBox(
                        width: _controller.value.size.width,
                        height: _controller.value.size.height,
                        child: VideoPlayer(_controller),
                      ),
                    )
                    : const Center(child: CircularProgressIndicator()),
          ),

          // Overlay transparan gelap agar teks lebih terlihat
          Container(color: Colors.black.withOpacity(0.25)),

          // Konten
          SafeArea(
            child: Column(
              children: [
                // Appbar manual
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white.withOpacity(0.2),
                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.white,
                            size: 18,
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                      const CircleAvatar(
                        backgroundImage: NetworkImage(
                          "https://i.pravatar.cc/150?img=1",
                        ),
                        radius: 18,
                      ),
                    ],
                  ),
                ),
                const Spacer(),

                // List komentar
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: comments.map((c) => _buildCommentItem(c)).toList(),
                ),

                const SizedBox(height: 12),

                // Input komentar
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 10,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.9),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const TextField(
                            decoration: InputDecoration(
                              hintText: "Add a Comment......",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Icon(
                            Icons.send,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

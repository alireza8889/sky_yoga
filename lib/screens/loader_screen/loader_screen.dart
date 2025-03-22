import 'package:flutter/material.dart';
import 'package:skyyoga/screens/loader_screen/widget/background_loading.dart';
import 'package:skyyoga/screens/loader_screen/widget/loading_logo.dart';
import 'package:skyyoga/screens/loader_screen/widget/text_loading.dart';
import 'package:skyyoga/screens/video_player/video_player_screen.dart';

class LoaderScreen extends StatefulWidget {
  const LoaderScreen({super.key});

  @override
  State<LoaderScreen> createState() => _LoaderScreenState();
}

class _LoaderScreenState extends State<LoaderScreen> {
  @override
  void initState() {
    Future.delayed(
      Duration(seconds: 3),
    ).then(
      (value) => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => VideoPlayerScreen(),
        ),
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Stack(
        children: [
          BackGround(),
          LoadingLogo(
            size: size,
          ),
          TextLoading(size: size),
        ],
      ),
    );
  }
}

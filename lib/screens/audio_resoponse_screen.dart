import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:optimum_music/screens/activity_screen.dart';
import 'package:optimum_music/screens/emotion_screen.dart';
import 'package:optimum_music/services/dio_service.dart';
import 'package:optimum_music/utils/models.dart';
import 'package:optimum_music/widgets/app_bar.dart';
import 'package:optimum_music/widgets/image_response_loading_widget.dart';

enum LoadingState { Loading, NotLoading }

class AudioResponseScreen extends StatefulWidget {
  const AudioResponseScreen({Key? key, required this.audioFile})
      : super(key: key);
  final Audio? audioFile;

  @override
  State<AudioResponseScreen> createState() => _AudioResponseScreenState();
}

class _AudioResponseScreenState extends State<AudioResponseScreen>
    with SingleTickerProviderStateMixin {
  LoadingState _lodingState = LoadingState.Loading;

  late Emotion _emotion;

  @override
  void initState() {
    _init();

    super.initState();
  }

  void _init() async {
    await Future.delayed(const Duration(seconds: 3));

    if (widget.audioFile != null) {
      try {
        final resActivity =
        await DioService().sendRequest(widget.audioFile!.path, 'emotionAudio');

        print('--------------------------------------------');
        print(resActivity);
        _emotion = Emotion.fromJson(resActivity);
      } catch (e) {
        print('Error Occured while demographic req');
      }
      setState(() {
        _lodingState = LoadingState.NotLoading;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final _textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(_size.width, _size.height * 0.1),
          child: const Center(child: AppBarWidget())),
      body: _lodingState == LoadingState.Loading
          ? const ImageResponseLoadingWidget()
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: _size.width * 0.07),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: _size.height * 0.02,
                  ),
                  Text(
                    'Playlist',
                    style: _textTheme.headline1
                        ?.copyWith(fontSize: _size.height * 0.034),
                  ),
                  SizedBox(height: _size.height * 0.03),
                  const Divider(
                    color: Colors.white,
                  ),
                  Expanded(
                    child: EmotionScreen(
                      emotion: _emotion,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

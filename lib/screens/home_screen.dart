import 'dart:async';
import 'dart:io';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:flutter_sound/public/flutter_sound_recorder.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:optimum_music/screens/audio_resoponse_screen.dart';
import 'package:optimum_music/screens/image_resoponse_screen.dart';
import 'package:optimum_music/screens/video_resoponse_screen.dart';
import 'package:optimum_music/services/dio_service.dart';
import 'package:optimum_music/widgets/app_logo.dart';
import 'package:optimum_music/widgets/btn.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:path/path.dart' as path;
import 'package:stop_watch_timer/stop_watch_timer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  XFile? _imageFile;
  Audio? _audioFile;
  dynamic _pickImageError;
  final ImagePicker _picker = ImagePicker();

  late FlutterSoundRecorder myRecorder;
  final audioPlayer = AssetsAudioPlayer();
  late String filePath;

  final StopWatchTimer _stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countUp,
    onChange: (value) => print('onChange $value'),
    onChangeRawSecond: (value) => print('onChangeRawSecond $value'),
    onChangeRawMinute: (value) => print('onChangeRawMinute $value'),
  );

  @override
  void initState() {
    super.initState();
  }

  Future<void> _pickimage(ImageSource source) async {
    try {
      final pickedFile = await _picker.pickImage(source: source);
      setState(() {
        _imageFile = pickedFile;
      });
    } catch (e) {
      setState(() {
        _pickImageError = e;
      });
    }
  }

  Future<void> _pickVideo(ImageSource source) async {
    try {
      final pickedFile = await _picker.pickVideo(source: source);
      setState(() {
        _imageFile = pickedFile;
      });
    } catch (e) {
      setState(() {
        _pickImageError = e;
      });
    }
  }

  Future<void> startIt() async {
    filePath = '/sdcard/Download/temp.wav';
    myRecorder = FlutterSoundRecorder();

    await myRecorder.openAudioSession(
        focus: AudioFocus.requestFocusAndStopOthers,
        category: SessionCategory.playAndRecord,
        mode: SessionMode.modeDefault,
        device: AudioDevice.speaker);
    await myRecorder.setSubscriptionDuration(Duration(milliseconds: 10));
    await initializeDateFormatting();

    await Permission.microphone.request();
    await Permission.storage.request();
    await Permission.manageExternalStorage.request();
  }

  Future<void> record() async {
    Directory dir = Directory(path.dirname(filePath));
    if (!dir.existsSync()) {
      dir.createSync();
    }
    await myRecorder.openAudioSession();
    await myRecorder.startRecorder(
      toFile: filePath,
      codec: Codec.pcm16WAV,
    );
  }

  Future<String?> stopRecord() async {
    myRecorder.closeAudioSession();
    return await myRecorder.stopRecorder();
  }

  Future<void> startPlaying() async {
    audioPlayer.open(
      Audio.file(filePath),
      autoStart: true,
      showNotification: true,
    );

    _audioFile = Audio.file(filePath);
  }

  Widget _bottomSheetBtn(onTap, _size, icon, title, _textTheme) {
    return Material(
      color: Colors.blue,
      borderRadius: BorderRadius.circular(30),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(30),
        child: Container(
          height: _size.height * 0.08,
          width: _size.width * 0.4,
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(30)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 30,
                color: Colors.white,
              ),
              SizedBox(
                height: _size.height * 0.005,
              ),
              Text(
                title,
                style: _textTheme.button?.copyWith(
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showBottomSheet(
      {required Size size,
      required void Function()? onPressedGallery,
      required void Function()? onPressedCamera,
      required TextTheme textTheme}) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: size.height * 0.2,
          color: Colors.white,
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.1,
                          vertical: size.height * 0.02),
                      child: Text(
                        'Choose Image Source',
                        style: textTheme.headline3?.copyWith(
                            color: Colors.black, fontWeight: FontWeight.w700),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                    child: Row(
                      children: [
                        Expanded(
                          child: _bottomSheetBtn(onPressedGallery, size,
                              Icons.image, 'Gallery', textTheme),
                        ),
                        SizedBox(
                          width: size.width * 0.05,
                        ),
                        Expanded(
                          child: _bottomSheetBtn(onPressedCamera, size,
                              Icons.camera, 'Camera', textTheme),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _showBottomSheetAudio({
    required Size size,
  }) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (BuildContext context, setStateCus) {
          return Container(
              height: size.height * 0.2,
              color: Colors.white,
              child: Container(
                height: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Icon(
                            Icons.mic,
                            color: Colors.red,
                            size: 40,
                          ),

                          /// Display stop watch time
                          StreamBuilder<int>(
                            stream: _stopWatchTimer.rawTime,
                            initialData: _stopWatchTimer.rawTime.value,
                            builder: (context, snap) {
                              final value = snap.data!;
                              final displayTime = StopWatchTimer.getDisplayTime(
                                  value,
                                  hours: true,
                                  milliSecond: false);
                              return Padding(
                                padding: const EdgeInsets.all(8),
                                child: Text(
                                  displayTime,
                                  style: const TextStyle(
                                      fontSize: 30,
                                      fontFamily: 'Helvetica',
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              );
                            },
                          ),
                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.all(10.0),
                                shape: CircleBorder(),
                                primary: Colors.white,
                                elevation: 10.0,
                                alignment: Alignment.center),
                            onPressed: () async {
                              _stopWatchTimer.onExecute
                                  .add(StopWatchExecute.stop);
                              await stopRecord();
                              startPlaying();

                              Navigator.pop(context);
                              _stopWatchTimer.onExecute
                                  .add(StopWatchExecute.reset);

                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return AudioResponseScreen(
                                  audioFile: _audioFile,
                                );
                              }));
                            },
                            icon: Icon(
                              Icons.send,
                              color: Colors.black,
                              size: 25.0,
                            ),
                            label: Text(''),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ));
        });
      },
    ).then((_) {
      _stopWatchTimer.onExecute.add(StopWatchExecute.reset);
    });
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final _textTheme = Theme.of(context).textTheme;
    return Scaffold(
      key: _scaffoldKey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AppLogo(
              height: 100,
            ),
            SizedBox(
              height: _size.height * 0.05,
            ),
            CustomButton(
              onTap: () {
                _showBottomSheet(
                    onPressedCamera: () async {
                      if (await Permission.camera.request().isGranted) {
                        await _pickimage(ImageSource.camera);
                        Navigator.pop(context);
                        if (_imageFile != null) {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return ImageResponseScreen(
                              imageFile: _imageFile,
                            );
                          }));
                        }
                      } else {
                        Navigator.pop(context);
                      }
                    },
                    onPressedGallery: () async {
                      if (await Permission.storage.request().isGranted) {
                        await _pickimage(ImageSource.gallery);
                        Navigator.pop(context);
                        if (_imageFile != null) {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return ImageResponseScreen(
                              imageFile: _imageFile,
                            );
                          }));
                        }
                      } else {
                        Navigator.pop(context);
                      }
                    },
                    size: _size,
                    textTheme: _textTheme);
              },
              title: 'Add Image',
              icon: Icons.image,
              index: 1,
            ),
            SizedBox(
              height: _size.height * 0.01,
            ),
            CustomButton(
              onTap: () async {
                if (await Permission.storage.request().isGranted) {
                  await _pickVideo(ImageSource.gallery);
                  if (_imageFile != null) {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return VideoResponseScreen(
                        videoFile: _imageFile,
                      );
                    }));
                  }
                }
              },
              index: 2,
              title: 'Add Video',
              icon: Icons.video_library_outlined,
            ),
            SizedBox(
              height: _size.height * 0.01,
            ),
            CustomButton(
              onTap: () async {
                await startIt();
                _stopWatchTimer.onExecute.add(StopWatchExecute.start);
                _showBottomSheetAudio(size: _size);
              },
              index: 1,
              title: 'Add Audio',
              icon: Icons.audiotrack,
            ),
            // _recorderWidget()
          ],
        ),
      ),
    );
  }
}

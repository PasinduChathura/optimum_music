import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:optimum_music/screens/image_resoponse_screen.dart';
import 'package:optimum_music/widgets/app_logo.dart';
import 'package:optimum_music/widgets/btn.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  XFile? _imageFile;
  dynamic _pickImageError;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
  }

  Future<void> _pickimage(ImageSource source) async {
    try {
      final pickedFile = await _picker.pickImage(source: source
          // maxWidth: maxWidth,
          // maxHeight: maxHeight,
          // imageQuality: quality,
          );
      setState(() {
        _imageFile = pickedFile;
      });
    } catch (e) {
      setState(() {
        _pickImageError = e;
      });
    }
  }

  void _showBottomSheet(_size) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: _size.height * 0.15,
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text('Modal BottomSheet'),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: _size.width * 0.1),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          child: const Text('Gallery'),
                          onPressed: () async {
                            await _pickimage(ImageSource.gallery);
                            Navigator.pop(context);
                            if (_imageFile != null) {
                              Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) {
                                return ImageResponseScreen(
                                  imageFile: _imageFile,
                                );
                              }));
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        width: _size.width * 0.05,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          child: const Text('Camera'),
                          onPressed: () async {
                            await _pickimage(ImageSource.camera);
                            Navigator.pop(context);
                            if (_imageFile != null) {
                              Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) {
                                return ImageResponseScreen(
                                  imageFile: _imageFile,
                                );
                              }));
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
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
                _showBottomSheet(_size);
              },
              // onTap: () {
              // Navigator.of(context)
              //     .pushReplacement(MaterialPageRoute(builder: (context) {
              //   return const ImageResponseScreen();
              // }));
              // },
              title: 'Add Image',
              icon: Icons.image,
              index: 1,
            ),
            SizedBox(
              height: _size.height * 0.01,
            ),
            CustomButton(
              onTap: () {
                // Navigator.of(context)
                //     .pushReplacement(MaterialPageRoute(builder: (context) {
                //   return const HomeScreen();
                // }));
              },
              index: 2,
              title: 'Add Video',
              icon: Icons.video_library_outlined,
            )
          ],
        ),
      ),
    );
  }
}

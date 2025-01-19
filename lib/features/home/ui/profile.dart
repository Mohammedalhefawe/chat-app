import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../my_widgets/utils.dart';


class Profile extends StatefulWidget {
  const Profile({super.key});
  @override
  State<Profile> createState() => _ProfileState();
}
class _ProfileState extends State<Profile> {
  Uint8List? _image;
  void selectImage()async{
    Uint8List img =await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [

              // Image.asset('images/Capture.png',),
              _image  != null?
              CircleAvatar(
                radius: 65,backgroundImage: MemoryImage(_image!),

              ):
              const CircleAvatar(
                radius: 65,backgroundImage:AssetImage('assets/images/profile.jpg',),//NetworkImage(''),
              ),
              Positioned(child: IconButton(
                onPressed: selectImage,
                icon: const Icon(Icons.add_a_photo),
              ),
                bottom: -10,
                left: 90,
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

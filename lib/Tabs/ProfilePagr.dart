import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? image;
  final _picker = ImagePicker();
  String gender = "Male"; //منحددا من الباك

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  Future<void> _loadImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? imagePath = prefs.getString('profile_image');
    if (imagePath != null && imagePath.isNotEmpty) {
      setState(() {
        image = File(imagePath);
      });
    }
  }

  Future<void> getImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('profile_image', pickedFile.path);
    } else {
      print("No image selected");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffdf5d7),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Expanded(
          flex: 4,
          child: Column(
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 100,
                      bottom: 8,
                    ),

                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.blueAccent, //اللون
                          width: 6.0, // عرض
                        ),
                      ),
                      child: CircleAvatar(
                        radius: 70,
                        backgroundImage: image != null ? FileImage(image!)
                            : const AssetImage('assets/images/Capture.png') as ImageProvider<Object>?
                      ),
                    ),
                  ),
                  Positioned(
                    child: IconButton(
                      onPressed: getImage,
                      icon: const Icon(Icons.add_a_photo),
                    ),
                    bottom: -9,
                    left: 88,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
              const Text(
                "Ghina",
                style: TextStyle(
                  fontFamily: "Montserrat",
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const Text(
                "Programmer",
                style: TextStyle(
                  fontFamily: "Montserrat",
                  color: Colors.black54,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 5,
          child: Container(
            padding: const EdgeInsets.only(
              top: 20,
              left: 24,
              right: 24,
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "PROFILE",
                style: TextStyle(
                  fontFamily: "Montserrat",
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 16),
              listProfile(Icons.person, "Full Name", "Ghina ALNouimi"),
              listProfile(Icons.date_range, "Date of Birth", "April 9, 2003"),
              listProfile(Icons.location_pin, "Location", "Syria, Daraa"),
              listProfile(
                  gender == "Male" ? Icons.male : Icons.female,
                  "Gender",
                  gender
              ),
              listProfile(Icons.email, "Email", "ghinwano003@gmail.com"),
            ],
          ),
        ),
      ),
      ],
    ),
    ),
    );
  }

  Widget listProfile(IconData icon, String text1, String text2) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 20,
          ),
          const SizedBox(width: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text1,
                style: const TextStyle(
                  color: Colors.black87,
                  fontFamily: "Montserrat",
                  fontSize: 14,
                ),
              ),
              Text(
                text2,
                style: const TextStyle(
                  color: Colors.black87,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
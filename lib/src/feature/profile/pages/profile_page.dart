import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_total_fit/src/common/constents/app_images.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:my_total_fit/src/common/widgets/custom_button.dart';
import 'package:my_total_fit/src/feature/profile/widgets/custom_row_widget.dart';
import 'package:my_total_fit/src/feature/profile/model/profile_model.dart';
import 'package:my_total_fit/src/route/get_pages.dart';
import 'dart:io';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  User? user;
  File? _selectedImage;

  @override
  void initState() {
    user = dummyUser;
    super.initState();
  }

  Future<void> _pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  void _showImageSourceOptions() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Select Image Source"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _pickImage(ImageSource.camera);
              },
              child: const Text("Camera"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _pickImage(ImageSource.gallery);
              },
              child: const Text("Gallery"),
            ),
          ],
        );
      },
    );
  }

  void _showLogoutBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
        side: BorderSide(color: Colors.red, width: 1),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Do You really want to Logout?",
                style: textTheme(context).headlineMedium?.copyWith(
                    color: colorScheme(context).onSurface,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Cancel button

                  SizedBox(
                    height: 45,
                    width: 151,
                    child: CustomButton(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        color: colorScheme(context).surface,
                        textColor: colorScheme(context).primary,
                        textSize: 14,
                        borderRadius: 8,
                        borderColor: colorScheme(context).primary,
                        text: "Cancel"),
                  ),
                  // logout button
                  SizedBox(
                    height: 45,
                    width: 151,
                    child: CustomButton(
                        onTap: () {
                          Navigator.pop(context); // Close the bottom sheet
                          context.pushNamed(AppRoute.signInPage);
                        },
                        color: colorScheme(context).primary,
                        textColor: colorScheme(context).surface,
                        textSize: 14,
                        borderRadius: 8,
                        text: "Yes Logout"),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Profile",
          style: textTheme(context).headlineLarge?.copyWith(
                color: colorScheme(context).onSurface,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: colorScheme(context).primary, width: 2),
                      ),
                      child: CircleAvatar(
                        radius: 36,
                        backgroundImage: _selectedImage != null
                            ? FileImage(_selectedImage!)
                            : NetworkImage(user!.imageUrl) as ImageProvider,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      left: 57,
                      top: 40,
                      child: GestureDetector(
                        onTap: _showImageSourceOptions,
                        child: Image.asset(
                          AppImages.edit,
                          cacheHeight: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 16),
                InkWell(
                  onTap: () => context.pushNamed(AppRoute.settingPage),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: height * 0.04,
                      ),
                      Text(
                        user!.username,
                        style: textTheme(context).headlineLarge?.copyWith(
                              color: colorScheme(context).onSurface,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      Text(
                        user!.email,
                        style: textTheme(context).headlineLarge?.copyWith(
                              color: colorScheme(context).onSurface,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.07,
            ),
            CustomRowWidget(
                onTap: () {
                  context.pushNamed(AppRoute.achievementPage);
                },
                text: "Achievements"),
            CustomRowWidget(
                onTap: () {
                  context.pushNamed(AppRoute.appUsagePage);
                },
                text: "App Usage"),
            CustomRowWidget(
                onTap: () {
                  context.pushNamed(AppRoute.fitnessProgressPage);
                },
                text: "Fitness Progress Tracking"),
            CustomRowWidget(
                onTap: () {
                  context.pushNamed(AppRoute.goalsPage);
                },
                text: "Goals"),
            CustomRowWidget(
                onTap: () {
                  context.pushNamed(AppRoute.settingPage);
                },
                text: "Settings"),
            CustomRowWidget(
                onTap: () {
                  context.pushNamed(AppRoute.subscriptions, extra: true);
                },
                text: "Upgrade Plan"),
            CustomRowWidget(
                onTap: () {
                  _showLogoutBottomSheet(context);
                },
                text: "Logout"),
          ],
        ),
      ),
    );
  }
}

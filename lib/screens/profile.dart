import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:sisa/constant/string.dart';
import 'package:sisa/constant/image_string.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {}, icon: const Icon(LineAwesomeIcons.angle_left)),
        title: Text(
          tProfile,
          style: Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.center,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(isDark ? LineAwesomeIcons.sun : LineAwesomeIcons.sun))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(
                width: 120,
                height: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image(image: AssetImage(tProfileImage)),
                ),
              ),
              const SizedBox(height: 20),
              Text("Shanon", style: Theme.of(context).textTheme.headlineLarge),
              Text("ShanonADM@gmail.com",
                  style: Theme.of(context).textTheme.bodyMedium),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 247, 192, 15),
                      side: BorderSide.none,
                      shape: const StadiumBorder()),
                  child: const Text(
                    "Edit Profile",
                    style: TextStyle(color: Color(0xFF000000)),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Divider(),
              const SizedBox(height: 10),
              //Menu
              ProfileMenuWidget(
                  title: "Settings",
                  icon: LineAwesomeIcons.cog,
                  onPress: () {}),
              ProfileMenuWidget(
                  title: "User Mamagement",
                  icon: LineAwesomeIcons.user_check,
                  onPress: () {}),
              const Divider(color: Colors.grey),
              const SizedBox(height: 10),
              ProfileMenuWidget(
                  title: "Information",
                  icon: LineAwesomeIcons.info,
                  onPress: () {}),
              ProfileMenuWidget(
                  title: "Logout",
                  icon: LineAwesomeIcons.alternate_sign_out,
                  textColor: Colors.red,
                  endIcon: false,
                  onPress: () {}),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 45,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.grey.withOpacity(0.1),
        ),
        child: Icon(icon, color: Color.fromARGB(255, 31, 8, 235)),
      ),
      title: Text(title, style: Theme.of(context).textTheme.bodyLarge?.apply()),
      trailing: endIcon
          ? Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.grey.withOpacity(0.1),
              ),
              child: const Icon(LineAwesomeIcons.angle_right,
                  size: 18.0, color: Colors.grey))
          : null,
    );
  }
}

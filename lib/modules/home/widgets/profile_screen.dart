import 'package:flutter/material.dart';
import 'package:office_furniture_store/core/values/app_asset.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: MediaQuery.sizeOf(context).width / 2,
            backgroundImage: AssetImage(AppAsset.profilePic),
          ),
          const Text(
            "Hello Sina!",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppAsset.githubPic, width: 50),
              const SizedBox(width: 10),
              const Text(
                "https://github.com/SinaSys",
                style: TextStyle(fontSize: 20),
              )
            ],
          )
        ],
      ),
    );
  }
}

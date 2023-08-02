import 'package:flutter/material.dart';

import '../constants/color.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: const Text('Settings',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center),
          ),
          const SizedBox(
            height: 30,
          ),
          ListTile(
            leading: const Icon(
              Icons.payments_outlined,
              color: kColorSian,
            ),
            title: const Text('Payment Method'),
            trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 18),
            onTap: () {},
          ),
          Divider(
            color: Colors.grey.shade200,
          ),
          ListTile(
            leading: const Icon(
              Icons.person_2_outlined,
              color: kColorSian,
            ),
            title: const Text('Personal Information'),
            trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 18),
            onTap: () {},
          ),
          Divider(color: Colors.grey.shade200),
          ListTile(
            leading: const Icon(
              Icons.help_outline,
              color: kColorSian,
            ),
            title: const Text('Help'),
            trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 18),
            onTap: () {},
          ),
          Divider(color: Colors.grey.shade200),
          ListTile(
            leading: const Icon(
              Icons.notifications_outlined,
              color: kColorSian,
            ),
            title: const Text('Notifications'),
            trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 18),
            onTap: () {},
          ),
          Divider(color: Colors.grey.shade200),
        ],
      ),
    );
  }
}

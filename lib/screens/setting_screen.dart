import 'package:flutter/material.dart';

import '../constants/color.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

bool isNotification = false;
ValueNotifier<bool> isDarkMode = ValueNotifier(false);

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Text('Settings',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w500,
                  color: isDarkMode.value ? Colors.white : Colors.black,
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
            title: Text(
              'Payment Method',
              style: TextStyle(
                color: isDarkMode.value ? Colors.white : Colors.black,
              ),
            ),
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
            title: Text(
              'Personal Information',
              style: TextStyle(
                color: isDarkMode.value ? Colors.white : Colors.black,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 18),
            onTap: () {},
          ),
          Divider(color: Colors.grey.shade200),
          SwitchListTile(
            inactiveThumbColor: Colors.grey,
            inactiveTrackColor: Colors.transparent,
            activeColor: kColorSian,
            title: Row(
              children: [
                const Icon(
                  Icons.notifications_outlined,
                  color: kColorSian,
                ),
                const SizedBox(width: 16),
                Text(
                  'Notifications',
                  style: TextStyle(
                    color: isDarkMode.value ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
            value: isNotification,
            onChanged: (value) {
              setState(() {});
              isNotification = value;
            },
          ),
          Divider(color: Colors.grey.shade200),
          SwitchListTile(
            inactiveThumbColor: Colors.grey,
            inactiveTrackColor: Colors.transparent,
            activeColor: kColorSian,
            title: Row(
              children: [
                const Icon(
                  Icons.dark_mode_outlined,
                  color: kColorSian,
                ),
                const SizedBox(width: 16),
                Text(
                  'Dark mode',
                  style: TextStyle(
                    color: isDarkMode.value ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
            value: isDarkMode.value,
            onChanged: (value) {
              setState(() {});
              isDarkMode.value = value;
            },
          ),
          Divider(color: Colors.grey.shade200),
          ListTile(
            leading: const Icon(
              Icons.help_outline,
              color: kColorSian,
            ),
            title: Text(
              'Help',
              style: TextStyle(
                color: isDarkMode.value ? Colors.white : Colors.black,
              ),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 18,
            ),
            onTap: () {},
          ),
          Divider(color: Colors.grey.shade200),
        ],
      ),
    );
  }
}

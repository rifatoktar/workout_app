import 'package:fitness/theme/dark_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
   bool light1 = true;

  final MaterialStateProperty<Icon?> thumbIcon =
      MaterialStateProperty.resolveWith<Icon?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return Icon(
          Icons.check,
          color: Colors.white,
        );
      }
      return Icon(Icons.close);
    },
  );

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Dark Mode',
                      style: Theme.of(context).textTheme.headlineLarge),
                  Switch(
                      thumbIcon: thumbIcon,
                      value: themeChange.darkTheme,
                      onChanged: (bool? value) {
                        themeChange.darkTheme = value!;
                      }),
                ],
              ),
            ),
    );
  }
}
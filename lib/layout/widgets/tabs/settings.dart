import 'package:flutter/material.dart';
import 'package:news/core/theme/theme.dart';

class SettingsTab extends StatefulWidget {
  static const String routeName = 'Settings';

  @override
  State<SettingsTab> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: MyTheme.whiteColor,
          child: Image.asset(
            'assets/images/main_background.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: Text(
                  'Language',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: 22,
                      ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Container(
                margin: EdgeInsets.all(25),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: MyTheme.primaryLightColor,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'English',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const Icon(
                      Icons.arrow_drop_down,
                      size: 35,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

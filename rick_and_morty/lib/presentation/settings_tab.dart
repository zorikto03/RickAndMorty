import 'package:flutter/material.dart';

class SettingsTab extends StatelessWidget{
  final ValueNotifier<ThemeMode> themeMode;

  const SettingsTab({super.key, required this.themeMode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        centerTitle: true,
      ),
      body: ValueListenableBuilder(
        valueListenable: themeMode,
        builder: (context, mode, child){
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Смена темы", 
                  style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.normal))),
              IconButton(
                onPressed: (){
                  themeMode.value = mode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
                }, 
                icon: mode == ThemeMode.light ? Icon(Icons.dark_mode) : Icon(Icons.light_mode))
            ],
          );
        }
      )
    );
  }
}
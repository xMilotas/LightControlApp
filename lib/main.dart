import 'package:flutter/material.dart';
import 'package:panda/light_panel.dart';
import 'package:panda/util/lights.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Light Control',
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        scaffoldBackgroundColor: Colors.grey.shade900,
        primaryColor: Colors.black,
        colorScheme: const ColorScheme.dark(),
        iconTheme: IconThemeData(color: Colors.purple.shade200, opacity: 0.8),
      ),
      home: const LightControlPage(title: 'Light Control'),
    );
  }
}

class LightControlPage extends StatefulWidget {
  const LightControlPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<LightControlPage> createState() => _LightControlPageState();
}

class _LightControlPageState extends State<LightControlPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Light Control')),
      body: ListView(
          children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              direction: Axis.horizontal,
              children: lights
                .map((Light light) => LightPanel(
                    localizedTitle: light.localizedTitle,
                    subTitle: light.subTitle,
                    id: light.id.toString()))
                .toList()),
          ),
              ]),
    );
  }
}


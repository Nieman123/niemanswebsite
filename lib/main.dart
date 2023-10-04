import 'package:flutter/material.dart';
import 'package:flutter_list_view/flutter_list_view.dart';
import 'package:niemanswebsite/underconstruction.dart';
import 'package:sa3_liquid/liquid/plasma/plasma.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'home.dart';
import 'custom_theme.dart';

final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Nieman's Website",
      theme: CustomTheme.darkTheme,
      darkTheme: CustomTheme.darkTheme,
      home: const MyHomePage(title: "Welcome to Nieman's Website"),
      navigatorObservers: <NavigatorObserver>[observer],
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> widgetList = [
    const UnderConstruction(),
    const HomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 1000) {
        //Mobile Layout
        return Scaffold(
          body: Stack(children: [
            const PlasmaRenderer(
              type: PlasmaType.infinity,
              particles: 15,
              color: Color.fromARGB(29, 165, 0, 143),
              blur: 0.5,
              size: 1,
              speed: 0.5,
              offset: 0,
              blendMode: BlendMode.plus,
              particleType: ParticleType.circle,
              variation1: 1,
              variation2: 0,
              variation3: 0,
              rotation: 0,
            ),
            FlutterListView(
                delegate: FlutterListViewDelegate(
              (BuildContext context, int index) => widgetList[index],
              childCount: widgetList.length,
            ))
          ]),
        );
      } else {
        return Scaffold(
          body: Stack(children: [
            const PlasmaRenderer(
              type: PlasmaType.infinity,
              particles: 15,
              color: Color.fromARGB(29, 165, 0, 143),
              blur: 0.5,
              size: 1,
              speed: 0.5,
              offset: 0,
              blendMode: BlendMode.plus,
              particleType: ParticleType.circle,
              variation1: 1,
              variation2: 0,
              variation3: 0,
              rotation: 0,
            ),
            FlutterListView(
                delegate: FlutterListViewDelegate(
              (BuildContext context, int index) => widgetList[index],
              childCount: widgetList.length,
            ))
          ]),
        );
      }
    });
  }
}

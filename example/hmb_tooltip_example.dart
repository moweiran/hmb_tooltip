import 'package:flutter/material.dart';
import 'package:hmb_tooltip/hmb_tooltip.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HMB Tooltip Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'HMB Tooltip Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ASTooltip(
                text: 'Click and Ask me questions!',
                color: Colors.indigo,
                milliseconds: 0,
                arrowAlign: ArrowAlign.bottomLeft,
                animateDuration: const Duration(milliseconds: 1500),
                width: 80,
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.amberAccent,
                ),
              ),
              SizedBox(width: 60),
              ASTooltip(
                text: 'Click and Ask me questions!',
                color: Colors.indigo,
                milliseconds: 0,
                arrowAlign: ArrowAlign.bottomCenter,
                animateDuration: const Duration(milliseconds: 1500),
                width: 80,
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.amberAccent,
                ),
              ),
              SizedBox(width: 60),
              ASTooltip(
                text: 'Click and Ask me questions!',
                color: Colors.indigo,
                milliseconds: 0,
                arrowAlign: ArrowAlign.bottomRight,
                animateDuration: const Duration(milliseconds: 1500),
                width: 80,
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.amberAccent,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ASTooltip(
                text: 'Click and Ask me questions!',
                color: Colors.indigo,
                milliseconds: 0,
                arrowAlign: ArrowAlign.topLeft,
                animateDuration: const Duration(milliseconds: 1500),
                width: 80,
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.amberAccent,
                ),
              ),
              SizedBox(width: 60),
              ASTooltip(
                text: 'Click and Ask me questions!',
                color: Colors.indigo,
                milliseconds: 0,
                arrowAlign: ArrowAlign.topCenter,
                animateDuration: const Duration(milliseconds: 1500),
                width: 80,
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.amberAccent,
                ),
              ),
              SizedBox(width: 60),
              ASTooltip(
                text: 'Click and Ask me questions!',
                color: Colors.indigo,
                milliseconds: 0,
                arrowAlign: ArrowAlign.topRight,
                animateDuration: const Duration(milliseconds: 1500),
                width: 80,
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.amberAccent,
                ),
              ),
            ],
          ),
          SizedBox(height: 100),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ASTooltip(
                text: 'Click and Ask me questions!',
                color: Colors.indigo,
                milliseconds: 0,
                arrowAlign: ArrowAlign.rightBottom,
                animateDuration: const Duration(milliseconds: 1500),
                width: 80,
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.amberAccent,
                ),
              ),
              SizedBox(width: 60),
              ASTooltip(
                text: 'Click and Ask me questions!',
                color: Colors.indigo,
                milliseconds: 0,
                arrowAlign: ArrowAlign.rightCenter,
                animateDuration: const Duration(milliseconds: 1500),
                width: 80,
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.amberAccent,
                ),
              ),
              SizedBox(width: 60),
              ASTooltip(
                text: 'Click and Ask me questions!',
                color: Colors.indigo,
                milliseconds: 0,
                arrowAlign: ArrowAlign.rightTop,
                animateDuration: const Duration(milliseconds: 1500),
                width: 80,
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.amberAccent,
                ),
              ),
            ],
          ),
          SizedBox(height: 100),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ASTooltip(
                text: 'Click and Ask me questions!',
                color: Colors.indigo,
                milliseconds: 0,
                arrowAlign: ArrowAlign.leftBottom,
                animateDuration: const Duration(milliseconds: 1500),
                width: 80,
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.amberAccent,
                ),
              ),
              SizedBox(width: 60),
              ASTooltip(
                text: 'Click and Ask me questions!',
                color: Colors.indigo,
                milliseconds: 0,
                arrowAlign: ArrowAlign.leftCenter,
                animateDuration: const Duration(milliseconds: 1500),
                width: 80,
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.amberAccent,
                ),
              ),
              SizedBox(width: 60),
              ASTooltip(
                text: 'Click and Ask me questions!',
                color: Colors.indigo,
                milliseconds: 0,
                arrowAlign: ArrowAlign.leftTop,
                animateDuration: const Duration(milliseconds: 1500),
                width: 80,
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.amberAccent,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: V3(),
      ),
    );
  }
}
class V3 extends StatefulWidget {
  const V3({super.key});

  @override
  State<V3> createState() => _V3State();
}

class _V3State extends State<V3> {
  double _red = 58;
  double _green = 178;
  double _blue = 230;

  Widget _buildSliderGroup({
    required String label,
    required double value,
    required ValueChanged<double> onChanged,
  }) {
    return SizedBox(
      width: 320,
      child: Column(
        children: [
          RichText(
            text: TextSpan(
              style: const TextStyle(fontSize: 16, color: Colors.black87),
              children: [
                TextSpan(text: '$label: '),
                TextSpan(
                  text: '${value.round()}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Slider(
            value: value,
            min: 0,
            max: 255,
            divisions: 255,
            onChanged: onChanged,
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 140,
            height: 140,
            decoration: BoxDecoration(
              color: Color.fromRGBO(
                _red.round(),
                _green.round(),
                _blue.round(),
                1.0,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
          ),

          const SizedBox(height: 36),

          _buildSliderGroup(
            label: 'Red',
            value: _red,
            onChanged: (val) => setState(() => _red = val),
          ),
          _buildSliderGroup(
            label: 'Green',
            value: _green,
            onChanged: (val) => setState(() => _green = val),
          ),
          _buildSliderGroup(
            label: 'Blue',
            value: _blue,
            onChanged: (val) => setState(() => _blue = val),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Halo Dunia',
    home: MainScreen(),
  ));
}

class MainScreen extends StatelessWidget {
  // Membuat GlobalKey untuk mengakses state dari TeksUtamaWidget
  final GlobalKey<TeksUtamaState> teksUtamaKey = GlobalKey<TeksUtamaState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JOBSHEET6'),
      ),
      body: Center(
        child: TeksUtamaWidget(key: teksUtamaKey), // Menyematkan GlobalKey
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Refresh',
        child: Icon(Icons.refresh),
        onPressed: () {
          teksUtamaKey.currentState?.updateIndex();
        },
      ),
    );
  }
}

class TeksUtamaWidget extends StatefulWidget {
  TeksUtamaWidget({Key? key}) : super(key: key);

  @override
  TeksUtamaState createState() => TeksUtamaState();
}

class TeksUtamaState extends State<TeksUtamaWidget> {
  var listNama = [
    'Firsta Zulfatun Yanuarsih',
    'Vika Wulandari',
    'Widyantika',
    'Athiroh Qothrun Nada',
    'Dwi Yuly Ardaneswari',
  ];
  var listWarna = [
    Colors.red,
    Colors.purple,
    Colors.teal,
    Colors.lime,
    Colors.indigo,
  ];
  int index = 0;

  void updateIndex() {
    setState(() {
      index++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Apa Kabar',
          textDirection: TextDirection.ltr,
        ),
        Text(
          listNama[index % listNama.length],
          textDirection: TextDirection.ltr,
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: listWarna[index % listWarna.length],
          ),
        ),
      ],
    );
  }
}
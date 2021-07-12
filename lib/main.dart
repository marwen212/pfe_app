/*import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:association/screens/scan_qr_code.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scan and Create QR Code',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.black,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Scan and Generate QR Code'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => ScanQRCode()));
                },
                textColor: Colors.white,
                padding: const EdgeInsets.all(0.0),
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[
                        Color(0xFF0D47A1),
                        Color(0xFF1976D2),
                        Color(0xFF42A5F5),
                      ],
                    ),
                  ),
                  padding: const EdgeInsets.all(10.0),
                  child: const Text('  Scan QR Code    ',
                      style: TextStyle(fontSize: 20)),
                )
              ),
          ],
        ),
      ),
    );
  }
}*/
import 'package:association/screens/navigation-drawer.dart';
import 'package:association/screens/reclamation_page.dart';
import 'package:association/screens/scan_qr_code.dart';
import 'package:flutter/material.dart';
import 'package:association/screens/login_page.dart';
import 'package:association/screens/home_page.dart';
import 'package:association/screens/personne_page.dart';
import 'package:association/screens/validation_page.dart';
import 'package:association/model/profile_model.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    HomePage.tag: (context) => HomePage(),
    Personnepage.tag: (context) => Personnepage(),
    Validationpage.tag: (context) => Validationpage(),
    ScanQRCode.tag: (context) =>ScanQRCode(),
    Reclamationpage.tag: (context) =>Reclamationpage(),
    NavigationDrawerWidget.tag: (context)=> NavigationDrawerWidget()
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'جمعية النهوض للتنمية بالوردانين ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        fontFamily: 'Nunito',
      ),
      home: LoginPage(),
      routes: routes,
    );
  }
}

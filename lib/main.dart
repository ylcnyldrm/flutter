import 'package:flutter/material.dart';
import 'package:flutterstatemanagement/Counter.dart';
import 'package:flutterstatemanagement/ikinci_sayfa.dart';
import 'package:provider/provider.dart';
import 'package:flutterstatemanagement/auth_islemleri.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
        child: RaisedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MultiProvider(
                    providers: [
                      ChangeNotifierProvider(
                        create: (_) => Counter(0),
                      ),
                      ChangeNotifierProvider(
                        create: (_) => AuthServices(),
                      ),
                    ],
                    child: IkinciSayfa(),
                  ),
                ));
          },
          child: Text("Ikinci sayfaya git "),
        ),
      ),
    );
  }
}

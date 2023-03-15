import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:stem_flutter/products.dart';

import 'news.dart';

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
        primarySwatch: Colors.blue,
        // textTheme: TextTheme()
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      initialRoute: '/',
      routes: {
        '/': (_) => const MyHomePage(title: 'My App'),
        '/news': (_) => const NewsPage(),
        '/products': (_) => const ProductsPage(),
      },
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times der:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const Text('Sabaidee', style: TextStyle(color: Colors.green)),
              // const Text('Sabaidee', style: TextStyle(color: Colors.green)),
              // const Text('Sabaidee', style: TextStyle(color: Color(0xFF0000FF))),
              // const Text(
              //   'Sabaidee',
              //   style: TextStyle(
              //     color: Color.fromARGB(255, 255, 0, 0),
              //   ),
              // ),
              // const Text('Sabaidee', style: TextStyle(fontSize: 50)),
              // Text('Sabaidee', style: Theme.of(context).textTheme.displayLarge?.copyWith(color: Colors.red))
              const Card(
                // elevation: 12,
                elevation: 0,
                color: Colors.grey,
                child: Padding(
                  padding: EdgeInsets.all(32.0),
                  child: Text('This is card'),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    // setState(() {
                    //   _counter = _counter * 2;
                    // });
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (context) => const NewsPage(),
                    //     settings: const RouteSettings(arguments: '12345678'),
                    //   ),
                    // );
                    Navigator.of(context).pushNamed('/news', arguments: '12345678');
                  },
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(12),
                  ),
                  child: Text('To the moon 🌒')),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // mainAxisAlignment: MainAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Card(
                    elevation: 0,
                    color: Colors.grey,
                    child: Padding(padding: EdgeInsets.all(8.0), child: Text('Item 1')),
                  ),
                  Card(
                    elevation: 0,
                    color: Colors.grey,
                    child: Padding(padding: EdgeInsets.all(8.0), child: Text('Item 2')),
                  ),
                  Card(
                    elevation: 0,
                    color: Colors.grey,
                    child: Padding(padding: EdgeInsets.all(8.0), child: Text('Item 3')),
                  ),
                  Card(
                    elevation: 0,
                    color: Colors.grey,
                    child: Padding(padding: EdgeInsets.all(8.0), child: Text('Item 3')),
                  ),
                ],
              ),
              Image.asset('assets/logo.png'),
              Image.network('https://www.kpoplove.net/wp-content/uploads/2022/12/Blackpink-Lisa.jpeg'),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

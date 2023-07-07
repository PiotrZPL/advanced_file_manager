import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import 'tools/launch_directory_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: FutureBuilder<PermissionStatus>(
          future: Permission.manageExternalStorage.status,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data == PermissionStatus.granted) {
                return GridView.count(
                  primary: false,
                  padding: const EdgeInsets.all(20),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 3,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        launchDirectoryPage(directoryName: "Main storage", directoryPath: "/storage/emulated/0/", context: context);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(8),
                        // fixedSize: const Size(200, 60),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                        )
                      ),
                      // padding: const EdgeInsets.all(8),
                      // color: Colors.teal[100],
                      child: const Column(
                        children: [
                          Icon(
                            Icons.storage,
                            size: 56,
                          ),
                          Text("Main storage")
                        ],
                      )
                    ),
                    ElevatedButton(
                      onPressed: () {
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(8),
                        // fixedSize: const Size(200, 60),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                        )
                      ),
                      child: const Column(
                        children: [
                          Icon(
                            Icons.download,
                            size: 56,
                          ),
                          Text("Downloads")
                        ],
                      )
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.teal[300],
                      child: const Text('Sound of screams but the'),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.teal[400],
                      child: const Text('Who scream'),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.teal[500],
                      child: const Text('Revolution is coming...'),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.teal[600],
                      child: const Text('Revolution, they...'),
                    ),
                  ],
                );
              }
              else {
                return ListView(
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        await Permission.manageExternalStorage.request();
                        setState(() {
                          
                        });
                        },
                      child: const Text("Grant"),
                    )
                  ]
                );
              }
            }
            else if (snapshot.hasError) {
              return const Text("error");
            }
            return const Text("loading");
          }
        )
      ),
    );
  }
}

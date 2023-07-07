import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../tools/launch_directory_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Advanced file manager"),
      ),
      body: Center(
        child: FutureBuilder<bool>(
          future: Permission.manageExternalStorage.isGranted,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!) {
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
                return Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 4,
                    ),
                    Text(
                      "Advanced file manager requires \ngranting a permission to work",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: Theme.of(context).textTheme.titleLarge!.fontSize!,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 7,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await Permission.manageExternalStorage.request();
                        setState((){});
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                        )
                      ),
                      child: SizedBox(
                        width: 70,
                        child: Text(
                          "Grant",
                          style: TextStyle(
                            fontSize: Theme.of(context).textTheme.titleLarge!.fontSize,
                            fontWeight: FontWeight.bold
                          ),
                          textAlign: TextAlign.center,
                        )
                      ),
                    )
                  ],
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
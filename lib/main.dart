import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      routes: {
        '/grid': (context) => GridScreen(),
        '/list': (context) => ListScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appbar'),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            color: Colors.red[100],
            child: Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  color: Colors.grey[300],
                  child: Center(child: Text('Img')),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('NIM : 5220411031'),
                    Text('Nama : Zuniz'),
                    Text('Prodi : Informatika'),
                    Text('Mata Kuliah : Mobile & Web Praktik'),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Navigator(
              initialRoute: '/grid',
              onGenerateRoute: (settings) {
                Widget page;
                switch (settings.name) {
                  case '/grid':
                    page = GridScreen();
                    break;
                  case '/list':
                    page = ListScreen();
                    break;
                  default:
                    page = GridScreen();
                }
                return MaterialPageRoute(builder: (_) => page);
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Grid',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'List',
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, '/grid');
          } else if (index == 1) {
            Navigator.pushNamed(context, '/list');
          }
        },
      ),
    );
  }
}

class GridScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: 4,
        itemBuilder: (context, index) {
          return Container(
            color: Colors.grey[300],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  color: Colors.grey[400],
                  child: Center(child: Image.network('https://www.fr.de/assets/images/36/36/36036794-wurde-im-clasico-opfer-rassistischer-beleidigungen-barca-star-lamine-yamal-2kK6WVv9xkfe.jpg')),
                ),
                SizedBox(height: 8),
                Text('Object $index'),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Container(
            width: 50,
            height: 50,
            color: Colors.grey[300],
            child: Center(child: Text('poto')),
          ),
          title: Text('Item $index'),
          subtitle: Text('..... $index'),
        );
      },
    );
  }
}

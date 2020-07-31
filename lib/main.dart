import 'package:flutter/material.dart';
import 'package:gallery/api_service.dart';
import 'package:gallery/detail_image.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.blue,
      ),
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gallery"),
      ),
      body: FutureBuilder(
        future: api_service.getImage(),
        builder: (context, snapshot) {
          final images = snapshot.data;
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                    shape: RoundedRectangleBorder( //закругление углов у карточки
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 2, //тень
                    margin: EdgeInsets.all(5), //внешние отступы
                    child: ListTile(
                      contentPadding: EdgeInsets.all(4), //внутренние отступы
                      title: Text(
                          images[index]['description'] ?? 'Name not found',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      subtitle: Text(images[index]['user']['name'] ?? 'default value',
                        style: TextStyle(
                            fontSize: 15
                        ),
                      ),
                      leading: SizedBox(
                        height: 150,
                        width: 70,
                        child: Image.network(images[index]['urls']['thumb'],
                            fit: BoxFit.fill),
                      ),
                      onTap: () {
                        print(images[index]['id']);
                        _sendDataToDetailScreen(
                            context, images[index]['urls']['full']);
                      },
                    ));
              },
              itemCount: images.length,
            );
          }
          return Center( //индикатор загрузки
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  void _sendDataToDetailScreen(BuildContext context, imageFull) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ShowImageDetail(imageFull),
        ));
  }
}

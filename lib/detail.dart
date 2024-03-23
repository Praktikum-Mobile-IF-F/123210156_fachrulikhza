import 'package:flutter/material.dart';
import 'top_album.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  final TopAlbum album;

  DetailPage({required this.album});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(album.albumName),
        actions: [
          IconButton(
            onPressed: () {
              _launchSpotify(album.albumurl);
            },
            icon: Icon(Icons.share),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Center(
              child: Image.network(album.imageUrls),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(album.albumName, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text(album.singer, style: TextStyle(fontSize: 16)),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.event),
                      SizedBox(width: 5),
                      Text(album.releaseDate),
                      SizedBox(width: 10),
                      Container(
                        height: 15,
                        width: 1,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.business),
                      SizedBox(width: 5),
                      Text(album.source),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Text(
                    'Song List:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 200,
                    child: SingleChildScrollView(
                      child: Column(
                        children: List.generate(album.songs.length, (index) {
                          return Container(
                            decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(color: Colors.grey)), // border untuk memisahkan judul lagu
                            ),
                            padding: EdgeInsets.only(top: 4.0, bottom: 8.0), // tambahkan spasi atas dan bawah untuk setiap judul lagu
                            child: Row(
                              children: [
                                Text('${index + 1}'), // Nomor lagu
                                SizedBox(width: 10),
                                Expanded(
                                  child: Text(album.songs[index]), // Judul lagu
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _launchSpotify(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

import 'package:flutter/material.dart';
import 'top_album.dart';

class DetailPage extends StatelessWidget {
  final TopAlbum album;

  DetailPage({required this.album});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(album.albumName),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(album.imageUrls),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Singer: ${album.singer}'),
                  Text('Release Date: ${album.releaseDate}'),
                  Text('Source: ${album.source}'),
                  SizedBox(height: 10),
                  Text(
                    'Song List:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 200, // Adjust height according to your need
                    child: ListView(
                      children: album.songs
                          .map((song) => ListTile(
                        title: Text(song),
                      ))
                          .toList(),
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
}

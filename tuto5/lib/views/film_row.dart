import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/film.dart';

class FilmRow extends StatelessWidget {
  final Film film;

  const FilmRow({super.key, required this.film});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      subtitle: Row(
        children: [
          Image.network(film.image, width: 100),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(film.title),
                Text(film.description),
                Text(
                  "Directed by ${film.director} - ${film.runningTime} minutes",
                ),
                Text("Released on ${film.releaseDate} - ${film.rtScore}%"),
                InkWell(
                  onTap: () => launchUrl(Uri.parse(film.url)),
                  child: Text(film.url),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

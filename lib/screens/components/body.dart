import 'package:flutter/material.dart';
import 'package:moviez/models/movie.dart';
import 'package:moviez/screens/components/genres.dart';
import 'package:moviez/screens/components/movie_card.dart';

import '../../components/genre_card.dart';
import 'categories.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      // ignore: prefer_const_literals_to_create_immutables
      children: <Widget>[
        const CategoryList(),
        const Genres(),
        const MovieCards()

      ],
      
    );
  }
}



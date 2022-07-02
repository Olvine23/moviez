import 'package:flutter/material.dart';

import '../../models/movie.dart';

class MovieCards extends StatefulWidget {
  const MovieCards({Key? key}) : super(key: key);

  @override
  State<MovieCards> createState() => _MovieCardsState();
}

class _MovieCardsState extends State<MovieCards> {

  PageController? _pageController;

  int initial_Page = 1;

  @override

  void initState(){

    super.initState();
    _pageController = PageController(

      viewportFraction: 0.8,
      initialPage: initial_Page
    );
  }

  @override
  void dispose(){
    super.dispose();
    _pageController?.dispose();
  }



  Widget build(BuildContext context) {
    return  Padding(
      
      padding: EdgeInsets.symmetric(vertical: 20),
      child: AspectRatio(aspectRatio: 0.85, child: PageView.builder(controller: _pageController, itemCount: movies.length, itemBuilder: (context, index ) => 
          buildMovieSlider(index)
      )
      )
      );
    
  }

  Widget buildMovieSlider(int index) {
    return MovieCard(movie: movies[index]
        );
  }
}


 class MovieCard extends StatelessWidget {
  final Movie movie;
  const MovieCard({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(

        children: <Widget>[

          Expanded(child: Container(

            decoration: BoxDecoration( 
              borderRadius: BorderRadius.circular(50),
              boxShadow: [BoxShadow(
                      offset: Offset(0, 4),
                      blurRadius: 4,
                      color: Colors.black26,
                    )],
              image: DecorationImage(

              fit: BoxFit.fill, 
              image:  AssetImage(movie.poster))),
          )),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Text(movie.title, style: Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.w600),),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [

              Icon(Icons.star, color: Colors.yellow,),
              SizedBox(width: 10,),
              Text("${movie.rating}", style: Theme.of(context).textTheme.bodyText2,)

            ],
          )

        ],

      ),
    );
    
  }
}
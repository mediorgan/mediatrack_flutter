import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mediatrack_flutter/constants.dart';
import 'package:mediatrack_flutter/models/movie/movie.dart';

import 'package:mediatrack_flutter/providers/settings_provider.dart';
import 'package:provider/provider.dart';

class BottomSheetQuickInfoMovie extends StatelessWidget {
  const BottomSheetQuickInfoMovie({
    Key key,
    @required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Provider.of<SettingsProvider>(context).themeData.brightness ==
              Brightness.dark
          ? Color(0xff161616)
          : Color(0xff6d6d6d), //Behind bottomsheet color. (Rounded Corners).
      child: Container(
        // height: 350,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          //Add ClipRRect
          color: Theme.of(context)
              .scaffoldBackgroundColor, //BottomSheet background color.
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        child: Builder(
          builder: (context) => Container(
            // height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: 200,
                  child: Row(
                    children: <Widget>[
                      movie.posterPath != null
                          ? Container(
                              // height: 200,

                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: CachedNetworkImage(
                                  imageUrl:
                                      baseUrl + posterSize + movie.posterPath,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          : Container(),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(12.0),
                          child: SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  movie.title,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.star,
                                      color: Color(0xff90cea1),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    movie.voteAverage == 0
                                        ? Text('No rating')
                                        : Text(
                                            '${movie.voteAverage}',
                                            style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // SizedBox(
                //   height: 30,
                // ),
                Text(
                  movie.tagline != null
                      ? movie.tagline == '' ? 'No Tagline' : movie.tagline
                      : 'Waiting...',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                // SizedBox(
                //   height: 20,
                // ),
                Container(
                  height: 40,
                  child: movie.genres != null
                      ? ListView.builder(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: movie.genres.length,
                          itemBuilder: (context, genre) {
                            return Container(
                              height: 20,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      .color,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                '${movie.genres[genre].name}',
                                style: TextStyle(fontSize: 16),
                              ),
                            );
                          })
                      : Text('Waiting...'),
                ),
                Text(movie.status != null ? movie.status : 'Waiting...'),
                Text(movie.releaseDate != null
                    ? DateFormat.yMMMd().format(
                        DateTime.parse(movie.releaseDate),
                      )
                    : 'Waiting...'),
                SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

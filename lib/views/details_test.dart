import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mediatrack_flutter/constants.dart';
import 'package:mediatrack_flutter/models/movie.dart';
import 'package:mediatrack_flutter/providers/movies_provider.dart';
import 'package:mediatrack_flutter/views/home_page.dart';
import 'package:provider/provider.dart';
import 'package:mediatrack_flutter/components/horizontal_list.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsTest extends StatefulWidget {
  final Movie movie;
  final int index;
  DetailsTest({this.movie, this.index});

  @override
  _DetailsTestState createState() => _DetailsTestState();
}

class _DetailsTestState extends State<DetailsTest> {
  MoviesProvider resetDetailsProvider;

  @override
  void dispose() {
    resetDetailsProvider.resetDetails();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    resetDetailsProvider = Provider.of<MoviesProvider>(context, listen: false);

    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: widget.movie.posterPath != null
                  ? CachedNetworkImageProvider(
                      baseUrl + posterSize + widget.movie.posterPath,
                    )
                  : NetworkImage(url),
              fit: BoxFit.cover,
              colorFilter: widget.movie.posterPath != null
                  ? ColorFilter.mode(Colors.black, BlendMode.screen)
                  : ColorFilter.mode(Colors.white, BlendMode.clear)),
        ),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
            child: CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  title: Text(widget.movie.title),
                  floating: true,
                  expandedHeight: 0.3 * size.height,
                  flexibleSpace: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: widget.movie.backdropPath == null
                            ? NetworkImage(url) //TODO: Add placeholder.
                            : CachedNetworkImageProvider(
                                baseUrl +
                                    backdropSize +
                                    widget.movie.backdropPath,
                              ),
                        fit: BoxFit.cover,
                      ),
                      gradient: LinearGradient(
                        colors: [Colors.teal, Colors.blue],
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          stops: [0, 0.5, 1],
                          colors: [
                            Colors.transparent,
                            Colors.black26,
                            Colors.black87,
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    <Widget>[
                      // Container(
                      //   height: 0.5 * size.height,
                      //   child: Stack(
                      //     children: <Widget>[
                      //       Container(
                      //         //Backdrop
                      //         width: size.width,
                      //         height: 0.4 * size.height,
                      //         decoration: BoxDecoration(
                      //           gradient: LinearGradient(
                      //             colors: [Colors.purple, Colors.red],
                      //           ),
                      //           // color: Theme.of(context).accentColor,
                      //           image: DecorationImage(
                      //               image: widget.movie.backdropPath == null
                      //                   ? NetworkImage(
                      //                       url) //TODO: Add placeholder.
                      //                   : CachedNetworkImageProvider(
                      //                       baseUrl +
                      //                           backdropSize +
                      //                           widget.movie.backdropPath,
                      //                     ),
                      //               fit: BoxFit.cover),
                      //         ),
                      //         child: Container(
                      //           width: size.width,
                      //           alignment: Alignment.bottomLeft,
                      //           decoration: BoxDecoration(
                      //             gradient: LinearGradient(
                      //               begin: Alignment.bottomCenter,
                      //               end: Alignment.topCenter,
                      //               colors: [
                      //                 Colors.black87,
                      //                 Colors.transparent,
                      //               ],
                      //             ),
                      //           ),
                      //           child: Container(
                      //             //Title
                      //             width: 0.6 * size.width,
                      //             padding: EdgeInsets.all(16),
                      //             // margin: EdgeInsets.only(
                      //             //   left: 0.1 * size.width,
                      //             // ),
                      //             child: Text(
                      //               widget.movie.title,
                      //               style: TextStyle(
                      //                 color: Colors.white,
                      //                 fontSize: 20,
                      //                 fontWeight: FontWeight.w600,
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //       //Poster
                      //       Positioned(
                      //         bottom: 10,
                      //         right: 16,
                      //         child: Container(
                      //           height: 200,
                      //           decoration: BoxDecoration(
                      //             boxShadow: [
                      //               BoxShadow(
                      //                 color: Colors.black26,
                      //                 offset: Offset(5, 5),
                      //                 blurRadius: 3,
                      //               ),
                      //             ],
                      //             borderRadius: BorderRadius.circular(12),
                      //           ),
                      //           child: AspectRatio(
                      //             aspectRatio: 500 / 750,
                      //             child: ClipRRect(
                      //               borderRadius: BorderRadius.circular(12),
                      //               child: widget.movie.posterPath != null
                      //                   ? CachedNetworkImage(
                      //                       imageUrl: baseUrl +
                      //                           posterSize +
                      //                           widget.movie.posterPath,
                      //                       progressIndicatorBuilder:
                      //                           (context, url, progress) =>
                      //                               Container(
                      //                         color: Colors.white,
                      //                         child: Center(
                      //                           child:
                      //                               CircularProgressIndicator(
                      //                             value: progress.progress,
                      //                           ),
                      //                         ),
                      //                       ),
                      //                       errorWidget:
                      //                           (context, url, error) =>
                      //                               Icon(Icons.error),
                      //                     )
                      //                   : Container(
                      //                       color: Theme.of(context)
                      //                           .scaffoldBackgroundColor,
                      //                       padding: EdgeInsets.all(3),
                      //                       child: Center(
                      //                           child: Material(
                      //                         child: Text(
                      //                           'Image not available',
                      //                           textAlign: TextAlign.center,
                      //                           style: TextStyle(
                      //                               color: Colors.grey),
                      //                         ),
                      //                       )),
                      //                     ),
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //       Positioned(
                      //         left: 8,
                      //         top: 20,
                      //         child: IconButton(
                      //           icon: Icon(Icons.arrow_back),
                      //           color: Colors.white,
                      //           onPressed: () => Navigator.pop(context),
                      //         ),
                      //       ),
                      //       //Release date Row
                      //       Positioned(
                      //         left: 0,
                      //         bottom: 0,
                      //         child: Container(
                      //           padding: EdgeInsets.all(16),
                      //           height: 0.1 * size.height,
                      //           width: 0.6 * size.width,
                      //           child: Row(
                      //             mainAxisAlignment:
                      //                 MainAxisAlignment.spaceBetween,
                      //             crossAxisAlignment: CrossAxisAlignment.center,
                      //             children: <Widget>[
                      //               widget.movie.releaseDate != ''
                      //                   ? Text(
                      //                       '${DateTime.parse(widget.movie.releaseDate).year}',
                      //                       style: TextStyle(fontSize: 20),
                      //                     )
                      //                   : Text('Not Available'),
                      //               widget.movie.runtime == null
                      //                   ? Text('Waiting')
                      //                   : widget.movie.runtime != 0
                      //                       ? Text(
                      //                           widget.movie.runtime ~/ 60 !=
                      //                                       0 &&
                      //                                   widget.movie.runtime %
                      //                                           60 !=
                      //                                       0
                      //                               ? '${widget.movie.runtime ~/ 60}h ${widget.movie.runtime % 60}min'
                      //                               : widget.movie.runtime ~/
                      //                                           60 ==
                      //                                       0
                      //                                   ? '${widget.movie.runtime % 60}min'
                      //                                   : '${widget.movie.runtime ~/ 60}h',
                      //                           style: TextStyle(fontSize: 18),
                      //                         )
                      //                       : Text(''),
                      //               SizedBox.shrink(),
                      //             ],
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      Container(
                        padding: EdgeInsets.all(16),
                        height: 200,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  width: 0.6 * size.width,
                                  child: widget.movie.originalTitle != null
                                      ? Text(
                                          widget.movie.originalTitle +
                                              ' - ' +
                                              widget.movie.originalLanguage,
                                          style: GoogleFonts.lato(
                                            textStyle: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        )
                                      : Text(widget.movie.title),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    widget.movie.releaseDate != ''
                                        ? Text(
                                            '${DateTime.parse(widget.movie.releaseDate).year}',
                                            style: TextStyle(fontSize: 20),
                                          )
                                        : Text('Not Available'),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    widget.movie.runtime == null
                                        ? Text('Waiting')
                                        : widget.movie.runtime != 0
                                            ? Text(
                                                widget.movie.runtime ~/ 60 !=
                                                            0 &&
                                                        widget.movie.runtime %
                                                                60 !=
                                                            0
                                                    ? '${widget.movie.runtime ~/ 60}h ${widget.movie.runtime % 60}min'
                                                    : widget.movie.runtime ~/
                                                                60 ==
                                                            0
                                                        ? '${widget.movie.runtime % 60}min'
                                                        : '${widget.movie.runtime ~/ 60}h',
                                                style: TextStyle(fontSize: 18),
                                              )
                                            : Text(''),
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              height: 200,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(5, 5),
                                    blurRadius: 3,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: AspectRatio(
                                aspectRatio: 500 / 750,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: widget.movie.posterPath != null
                                      ? CachedNetworkImage(
                                          imageUrl: baseUrl +
                                              posterSize +
                                              widget.movie.posterPath,
                                          progressIndicatorBuilder:
                                              (context, url, progress) =>
                                                  Container(
                                            color: Colors.white,
                                            child: Center(
                                              child: CircularProgressIndicator(
                                                value: progress.progress,
                                              ),
                                            ),
                                          ),
                                          errorWidget: (context, url, error) =>
                                              Icon(Icons.error),
                                        )
                                      : Container(
                                          color: Theme.of(context)
                                              .scaffoldBackgroundColor,
                                          padding: EdgeInsets.all(3),
                                          child: Center(
                                              child: Material(
                                            child: Text(
                                              'Image not available',
                                              textAlign: TextAlign.center,
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                          )),
                                        ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            widget.movie.status != null
                                ? Text(
                                    widget.movie.status,
                                    style: TextStyle(fontSize: 16),
                                  )
                                : Text('Waiting...'),
                            // SizedBox.shrink(),
                            widget.movie.voteAverage != 0
                                ? Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.star,
                                        color: Color(0xffe4bb24),
                                        size: 30,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        widget.movie.voteAverage.toString(),
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  )
                                : Text(
                                    'NR',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                            // SizedBox.shrink(),
                            Container(
                              padding: EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        .color,
                                  ),
                                  borderRadius: BorderRadius.circular(3)),
                              child: Text(Provider.of<MoviesProvider>(context)
                                              .certification ==
                                          '' ||
                                      Provider.of<MoviesProvider>(context)
                                              .certification ==
                                          null
                                  ? 'NR'
                                  : Provider.of<MoviesProvider>(context)
                                      .certification),
                            ),
                            // SizedBox.shrink(),
                            // Text(widget.movie.voteCount.toString() + ' votes'),
                            GestureDetector(
                              onTap: widget.movie.imdbId != null
                                  ? () => launch(
                                        'http://www.imdb.com/title/' +
                                            widget.movie.imdbId,
                                      )
                                  : () {},
                              child: Image.asset(
                                'assets/images/imdb.png',
                                scale: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                      widget.movie.homepage != null
                          ? widget.movie.homepage != ''
                              ? Container(
                                  width: double.infinity,
                                  margin: EdgeInsets.all(16),
                                  padding: EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    // color: Colors.lightBlue,
                                    // border: Border.all(
                                    //   color:
                                    //       Theme.of(context).textTheme.bodyText2.color,
                                    // ),
                                    borderRadius: BorderRadius.circular(12),
                                    color: Theme.of(context).accentColor,
                                  ),
                                  child: InkWell(
                                    onTap: () => launch(widget.movie.homepage),
                                    child: Center(
                                      child: Text(
                                        '"' +
                                            widget.movie.title +
                                            '"' +
                                            ' \' Website',
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .scaffoldBackgroundColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : Container()
                          : Container(
                              child: Center(
                                child: Text('Waiting...'),
                              ),
                            ),

                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(16),
                        child: Text(
                          widget.movie.tagline != null
                              ? widget.movie.tagline == ''
                                  ? 'No Tagline'
                                  : widget.movie.tagline
                              : 'Waiting...',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          'Overview',
                          style: GoogleFonts.lato(
                            textStyle: Theme.of(context).textTheme.headline6,
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                        child: Text(
                          widget.movie.overview,
                          style: GoogleFonts.lato(
                            textStyle: Theme.of(context).textTheme.bodyText2,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          'Genres',
                          style: GoogleFonts.lato(
                            textStyle: Theme.of(context).textTheme.headline6,
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(2),
                        margin: EdgeInsets.all(14),
                        height: 45,
                        child: widget.movie.genres != null
                            ? widget.movie.genres.length == 0
                                ? Center(
                                    child: Text(
                                      'Not Available',
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  )
                                : ListView.builder(
                                    physics: BouncingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: widget.movie.genres.length,
                                    itemBuilder: (context, genre) {
                                      return Container(
                                        // height: 25,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 5),
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.only(right: 10),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Theme.of(context)
                                                .textTheme
                                                .bodyText2
                                                .color,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Text(
                                          '${widget.movie.genres[genre].name}',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      );
                                    })
                            : Text('Waiting...'),
                      ),
                      widget.movie.belongsToCollection != null
                          ? Padding(
                              padding: EdgeInsets.all(16),
                              child: Text(
                                'From Collection',
                                style: GoogleFonts.lato(
                                  textStyle:
                                      Theme.of(context).textTheme.headline6,
                                  color: Theme.of(context).accentColor,
                                ),
                              ),
                            )
                          : Container(),
                      widget.movie.belongsToCollection != null
                          ? Column(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(
                                    left: 16,
                                  ),
                                  height: 200,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black26,
                                        offset: Offset(5, 5),
                                        blurRadius: 3,
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: AspectRatio(
                                    aspectRatio: 16 / 9,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: widget.movie.belongsToCollection
                                                  .backdropPath !=
                                              null
                                          ? CachedNetworkImage(
                                              imageUrl: baseUrl +
                                                  backdropSize +
                                                  widget
                                                      .movie
                                                      .belongsToCollection
                                                      .backdropPath,
                                              progressIndicatorBuilder:
                                                  (context, url, progress) =>
                                                      Container(
                                                color: Colors.white,
                                                child: Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                    value: progress.progress,
                                                  ),
                                                ),
                                              ),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      Icon(Icons.error),
                                            )
                                          : Container(
                                              color: Theme.of(context)
                                                  .scaffoldBackgroundColor,
                                              padding: EdgeInsets.all(3),
                                              child: Center(
                                                  child: Material(
                                                child: Text(
                                                  'Image not available',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.grey),
                                                ),
                                              )),
                                            ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.all(16),
                                  child: Text(
                                      widget.movie.belongsToCollection.name),
                                ),
                              ],
                            )
                          : Container(),
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          'Spoken Languages',
                          style: GoogleFonts.lato(
                            textStyle: Theme.of(context).textTheme.headline6,
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                      ),
                      Container(
                        height: 25,
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        child: widget.movie.spokenLanguages == null
                            ? Center(child: Text('Waiting'))
                            : ListView.builder(
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Container(
                                      margin: EdgeInsets.only(right: 16),
                                      child: Text(widget
                                          .movie.spokenLanguages[index].name));
                                },
                                itemCount: widget.movie.spokenLanguages.length,
                              ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          'Production Countries',
                          style: GoogleFonts.lato(
                            textStyle: Theme.of(context).textTheme.headline6,
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                      ),
                      Container(
                        height: 25,
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        child: widget.movie.productionCountries == null
                            ? Center(child: Text('Waiting'))
                            : ListView.builder(
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Container(
                                      margin: EdgeInsets.only(right: 16),
                                      child: Text(widget.movie
                                          .productionCountries[index].name));
                                },
                                itemCount:
                                    widget.movie.productionCountries.length,
                              ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          'Production Companies',
                          style: GoogleFonts.lato(
                            textStyle: Theme.of(context).textTheme.headline6,
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                      ),
                      Container(
                        height: 30,
                        margin: EdgeInsets.all(16),
                        child: widget.movie.productionCompanies != null
                            ? widget.movie.productionCompanies.length != 0
                                ? ListView.builder(
                                    physics: BouncingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        margin: EdgeInsets.only(right: 16),
                                        child: widget
                                                    .movie
                                                    .productionCompanies[index]
                                                    .logoPath ==
                                                null
                                            ? Center(
                                                child: Text(widget
                                                        .movie
                                                        .productionCompanies[
                                                            index]
                                                        .name +
                                                    ' ' +
                                                    widget
                                                        .movie
                                                        .productionCompanies[
                                                            index]
                                                        .originCountry),
                                              )
                                            : Tooltip(
                                                message: widget
                                                        .movie
                                                        .productionCompanies[
                                                            index]
                                                        .name +
                                                    ' ' +
                                                    widget
                                                        .movie
                                                        .productionCompanies[
                                                            index]
                                                        .originCountry,
                                                child: Image.network(baseUrl +
                                                    logoSize +
                                                    widget
                                                        .movie
                                                        .productionCompanies[
                                                            index]
                                                        .logoPath),
                                              ),
                                      );
                                    },
                                    itemCount:
                                        widget.movie.productionCompanies.length)
                                : Center(
                                    child: Text('Not Available'),
                                  )
                            : Container(
                                child: Text('Waiting'),
                              ),
                      ),
                      GestureDetector(
                        onTap: widget.movie.imdbId != null
                            ? () => launch('http://www.imdb.com/title/' +
                                widget.movie.imdbId +
                                '/parentalguide')
                            : () {},
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Row(
                            children: <Widget>[
                              Text(
                                'Parental Guide from IMDb',
                                style: GoogleFonts.lato(
                                  textStyle:
                                      Theme.of(context).textTheme.headline6,
                                  color: Theme.of(context).accentColor,
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons.arrow_forward,
                                color: Theme.of(context).accentColor,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Row(
                          children: <Widget>[
                            Text(
                              'Recommendations',
                              style: GoogleFonts.lato(
                                textStyle:
                                    Theme.of(context).textTheme.headline6,
                                color: widget.movie.recommendations != null
                                    ? widget.movie.recommendations.results
                                                .length !=
                                            0
                                        ? Theme.of(context).accentColor
                                        : Colors.grey
                                    : Colors.grey,
                              ),
                            ),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward,
                              color: widget.movie.recommendations != null
                                  ? widget.movie.recommendations.results
                                              .length !=
                                          0
                                      ? Theme.of(context).accentColor
                                      : Colors.grey
                                  : Colors.grey,
                            ),
                          ],
                        ),
                      ),
                      //Removed because of Captain Marvel - Same Hero Tag.
                      widget.movie.recommendations != null
                          ? widget.movie.recommendations.results.length != 0
                              ? HorizontalList(
                                  itemList:
                                      widget.movie.recommendations.results,
                                )
                              : Container(
                                  padding: EdgeInsets.all(16),
                                  child: Center(
                                    child: Text(
                                      'Not Available',
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                )
                          : Container(
                              height: 200,
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          'More like this',
                          style: GoogleFonts.lato(
                            textStyle: Theme.of(context).textTheme.headline6,
                            color: widget.movie.similarMovies != null
                                ? widget.movie.similarMovies.results.length != 0
                                    ? Theme.of(context).accentColor
                                    : Colors.grey
                                : Colors.grey,
                          ),
                        ),
                      ),
                      widget.movie.similarMovies != null
                          ? widget.movie.similarMovies.results.length != 0
                              ? HorizontalList(
                                  itemList: widget.movie.similarMovies.results,
                                )
                              : Container(
                                  padding: EdgeInsets.all(16),
                                  child: Center(
                                    child: Text(
                                      'Not Available',
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                )
                          : Container(
                              height: 200,
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                      GestureDetector(
                        onTap: () => Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                          (Route<dynamic> route) => false,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.home,
                                color: Theme.of(context).accentColor,
                              ),
                              Spacer(),
                              Text(
                                'Go Home',
                                style: GoogleFonts.lato(
                                  textStyle:
                                      Theme.of(context).textTheme.headline6,
                                  color: Theme.of(context).accentColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

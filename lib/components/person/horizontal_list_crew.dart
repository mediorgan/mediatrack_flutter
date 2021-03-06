import 'package:animated_overflow/animated_overflow.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mediatrack_flutter/constants.dart';
import 'package:mediatrack_flutter/models/person/crew.dart';
import 'package:mediatrack_flutter/providers/person/person_provider.dart';
import 'package:mediatrack_flutter/views/person/details_screen_person.dart';
import 'package:provider/provider.dart';

class HorizontalListCrew extends StatelessWidget {
  const HorizontalListCrew({
    @required this.itemList,
    @required this.title,
  });

  final List<Crew> itemList;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
          child: Row(
            children: <Widget>[
              Text(
                title,
                style: GoogleFonts.lato(
                  textStyle: Theme.of(context).textTheme.headline6,
                  color: Theme.of(context).accentColor,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(8),
          height: 260,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                width: 120,
                margin: EdgeInsets.all(8),
                child: InkWell(
                  onTap: () {
                    Provider.of<PersonProvider>(context, listen: false)
                        .getPerson(itemList[index].id);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreenPerson(
                            person: Provider.of<PersonProvider>(context).person,
                          ),
                        ));
                  },
                  // onLongPress: () {
                  //   Provider.of<PersonProvider>(context, listen: false)
                  //       .updateDetails(itemList, index);
                  //   showModalBottomSheet(
                  //     context: context,
                  //     builder: (context) => BottomSheetQuickInfo(
                  //       movie: itemList[index],
                  //     ),
                  //   );
                  // },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
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
                        child: ClipRRect(
                          //Removed Aspect Ratio. Add if necessary.
                          borderRadius: BorderRadius.circular(12),
                          child: AspectRatio(
                            aspectRatio: 500 / 750,
                            child: itemList[index].profilePath != null
                                ? CachedNetworkImage(
                                    imageUrl: baseUrl +
                                        posterSize +
                                        itemList[index].profilePath,
                                    progressIndicatorBuilder:
                                        (context, url, progress) => Container(
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      child: Center(
                                        child: CircularProgressIndicator(
                                          value: progress.progress,
                                        ),
                                      ),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                    fit: BoxFit.cover,
                                  )
                                : Container(
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      // crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        SizedBox.shrink(),
                                        Material(
                                          child: Text(
                                            'Image not available',
                                            style: TextStyle(
                                              color: Colors.grey,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Material(
                                          child: Text(
                                            itemList[index].name,
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        SizedBox.shrink(),
                                      ],
                                    ),
                                  ),
                          ),
                        ),
                      ),
                      AnimatedOverflow(
                        animatedOverflowDirection:
                            AnimatedOverflowDirection.HORIZONTAL,
                        maxWidth: 120,
                        child: Text(
                          itemList[index].name,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.lato(),
                        ),
                      ),
                      AnimatedOverflow(
                        animatedOverflowDirection:
                            AnimatedOverflowDirection.HORIZONTAL,
                        maxWidth: 120,
                        child: Text(
                          itemList[index].job,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: itemList.length,
          ),
        ),
      ],
    );
  }
}

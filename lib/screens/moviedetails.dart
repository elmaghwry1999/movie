import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app_ui/components/constants.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen  ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenheight=MediaQuery.of(context).size.height;
    final screenwidth=MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration:const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.black,
              Color(0xff19191b),
            ]
          )
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
                left: 0,
                child:Container(
                  height: screenheight*0.5,
                  width: screenwidth,
                  child: Container(
                    decoration:const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image:AssetImage(
                          'assets/movie-posters/img-eternals.jpg'
                        ) ,

                      )
                    ),
                  ),
                )
            ),
            Positioned(
                top: screenheight*0.05,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 21.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Container(
                        height: 44,
                          width: 44,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(

                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(width: 3,color: Colors.white),
                         ),
                        child: SvgPicture.asset('assets/svg/icon-back.svg'),
                      ),
                      Container(
                        height: 44,
                          width: 44,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(

                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(width: 3,color: Colors.white),
                         ),
                        child: SvgPicture.asset('assets/svg/icon-menu.svg'),
                      ),

                    ],
                  ),
                )
            ),
            Positioned(
                top: screenheight*0.42,
                right: 9,
                child: Container(

                  height: 50,
                  width: 50,
                  padding:const EdgeInsets.all(3),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient:LinearGradient(colors: [
                      Color(0xfffe53bb),
                      Color(0xff09fbd3)
                    ])
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:Constants.kGreyColor
                    ),
                    child: const Icon(
                      Icons.play_arrow,

                    ),
                  ),


            )),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              top:700,

              child: Container(
                height: screenheight*0.5,
                transform: Matrix4.translationValues(0,-screenheight*0.5, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: screenwidth*0.7,
                      child: Column(
                        children: [
                          Text(
                            '$screenheight',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight:FontWeight.w700,
                              color: Colors.white.withOpacity(.85)
                            ),
                          ),
                          SizedBox(height: screenheight<=667?10:20,),
                          //2021.Actiom-Adventure-Fantasy.2h36m
                          Text(
                            '2021.Actiom-Adventure-Fantasy.2h36m',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.white.withOpacity(.75)
                            ),
                          ),
                          SizedBox(height: 10,),
                          RatingBar.builder(
                            itemSize: 14,
                            initialRating: 3,
                            minRating: 1,
                            direction: Axis.horizontal,
                            itemCount: 5,
                            itemPadding:const EdgeInsets.symmetric(
                              horizontal: 1
                            ),

                            onRatingUpdate: (double rating) {
                              debugPrint(rating.toString());
                            },
                            unratedColor: Constants.kWhiteColor,
                            itemBuilder: (BuildContext context, int index) {
                              return const Icon(
                                Icons.star,
                                color: Constants.kYellowColor,
                              );
                            },
                          ),
                          SizedBox(height: 20,),
                          Text('the sega of the Eternals, a race of \n immortal b',
                          textAlign: TextAlign.center,
                          maxLines: screenheight<=667?2:4,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white.withOpacity(0.75)
                          ),)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

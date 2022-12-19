import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:movie_app_ui/components/masked_image.dart';
import 'package:movie_app_ui/components/searchfieldwidget.dart';

import '../components/constants.dart';
import '../components/custom_outline.dart';
import '../models/movie.dart';
import 'homepage.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // screen height and screen width for mobile
    final screenHight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Constants.kBlackColor,
      body: Container(
        width: screenWidth,
        height: screenHight,
        child: Stack(
          children: [
            // position to select color palace in the background
            Positioned(
              top: screenHight * 0.1,
              left: -80,
              child: Container(
                height: 80,
                width: 166,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Constants.kGreenColor,
                ),
                child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 200, sigmaY: 200),
                    child: Container(
                      width: 166,
                      height: 166,
                    )),
              ),
            ),
            Positioned(
              top: screenHight * .99,
              left: -100,
              child: Container(
                height: 80,
                width: 166,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Constants.kGreenColor,
                ),
                child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 200, sigmaY: 200),
                    child: Container(
                      width: 166,
                      height: 166,
                    )),
              ),
            ),
            SafeArea(
              bottom:  false,
              child: ListView(
                primary: true,
                children: [
                const  SizedBox(
                   height: 24,
                 ) ,
                  Text(

                    'What would you \n  like to watch ?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: screenHight<=660?18:34,
                        fontWeight: FontWeight.bold,
                        color:Constants.kWhiteColor.withOpacity(0.8 )
                    ),
                  ),
                  const  SizedBox(
                    height: 30,
                  ),
                  SearchFieldWidget(

                      padding: EdgeInsets.symmetric(horizontal: 20),


                  ),
                  SizedBox(height: 39,),
                  Padding(
                      padding:EdgeInsets.only(right: 250),
                    child: Text(
                      'Popular Movies ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: screenHight<=660?17:17,
                          fontWeight: FontWeight.w100,
                          color:Constants.kWhiteColor
                      ),
                    ),

                  ),
                  SizedBox(height: 37,),

                  // use sized box and create in it listview.builder
                  SizedBox(
                    height: 160,

                  child: ListView.builder(
                    // عشان يصد ويجعلي الستخدمت boucingscrollphysics
                    physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: newMovies.length,
                      itemBuilder: (context,index){
                        String mask;
                        if(index==0){
                          mask=Constants.kMaskFirstIndex;
                        }else if (index==-1){
                          mask=Constants.kMaskLastIndex;
                        }else{
                          mask=Constants.kMaskCenter;
                        }
                    return GestureDetector(
                      child: Container(
                        margin: EdgeInsets.only(left: 20),
                        height: 160,
                        width: 142,
                        child: MaskedImage(
                          asset: newMovies[index].moviePoster,
                          mask: mask,

                        ),
                      ),
                    );
                  }),
                  ),

                  // Upcoming movies
                  SizedBox(height: 39,),
                  Padding(
                    padding:EdgeInsets.only(right: 250),
                    child: Text(
                      'Upcomin Movies ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: screenHight<=660?17:17,
                          fontWeight: FontWeight.w100,
                          color:Constants.kWhiteColor
                      ),
                    ),

                  ),
                  SizedBox(height: 37,),

                  // use sized box and create in it listview.builder
                  SizedBox(
                    height: 160,

                    child: ListView.builder(
                      // عشان يصد ويجعلي الستخدمت boucingscrollphysics
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: upcomingMovies.length,
                        itemBuilder: (context,index){
                          String mask;
                          if(index==0){
                            mask=Constants.kMaskFirstIndex;
                          }else if (index==-1){
                            mask=Constants.kMaskLastIndex;
                          }else{
                            mask=Constants.kMaskCenter;
                          }
                          return GestureDetector(
                            child: Container(
                              margin: EdgeInsets.only(left: 20),
                              height: 160,
                              width: 142,
                              child: MaskedImage(
                                asset: upcomingMovies[index].moviePoster,
                                mask: mask,

                              ),
                            ),
                          );
                        }),
                  ),


                ],
              ),
            ),




          ],
        ),
      ),
      floatingActionButton: Container(
        padding: EdgeInsets.all(4),
        margin: EdgeInsets.only(top: 40),
        height: 64,
        width: 64,
        decoration:BoxDecoration(
              shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [

              Constants.kPinkColor.withOpacity(0.2),
              Constants.kGreenColor.withOpacity(0.2),

            ],


          ),

        ) ,
        child: Container(
          padding: EdgeInsets.all(4),
          width: 60,
          height: 60,
          decoration:BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [

                Constants.kPinkColor.withOpacity(0.5),
                Constants.kGreenColor.withOpacity(0.5),

              ],


            ),

          ) ,


          child: RawMaterialButton(

            shape: const CircleBorder(),
            fillColor: const Color(0xff404c57),
            child:SvgPicture.asset('assets/svg/icon-plus.svg') ,
            onPressed:(){

            },
          ),
        ),
      ),


      // Move Location to center
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // to make navigator glass and it contents blur
      bottomNavigationBar: GlassmorphicContainer(
        linearGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [

            Constants.kWhiteColor.withOpacity(0.2),
            Constants.kWhiteColor.withOpacity(0.2),

          ],


        ),
        height:92,
        width: screenWidth,
        borderRadius: 0,
        blur: 30,
        border: 0,
        borderGradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [

            Constants.kWhiteColor.withOpacity(0.2),
            Constants.kWhiteColor.withOpacity(0.2),

          ],


        ),
        child: BottomAppBar(
notchMargin: 4,
          elevation: 0,

          // عشان تبقي شفافه color transparent
          color: Colors.transparent,
          child: Row(
            children: [

              Expanded(child: IconButton(
                onPressed: (){

                },
                icon: SvgPicture.asset(Constants.kIconHome),
              )),
              Expanded(child: IconButton(
                onPressed: (){

                },
                icon: SvgPicture.asset(Constants.kIconPlayOnTv),
              )),
              Expanded(child: Text('')),
              Expanded(child: IconButton(
                onPressed: (){

                },
                icon: SvgPicture.asset(Constants.kIconCategories),
              )),
              Expanded(child: IconButton(
                onPressed: (){

                },
                icon: SvgPicture.asset(Constants.kIconDownload),
              )),
            ],
          ),
        ),




      ),
    );
  }
}

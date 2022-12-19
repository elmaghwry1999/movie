import 'dart:ui';

import 'package:flutter/material.dart';

import '../components/constants.dart';
import '../components/custom_outline.dart';
import 'homepage.dart';

class OnBardingScreen extends StatelessWidget {
  const OnBardingScreen({Key? key}) : super(key: key);

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
              left: -88,
              child: Container(
                height: 166,
                width: 166,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Constants.kPinkColor,
                ),
                child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 200, sigmaY: 200),
                    child: Container(
                      width: 166,
                      height: 166,
                    )),
              ),
            ),
            // position to select color palace in the background
            Positioned(
              top: screenHight * 0.5,
              right: -100,
              child: Container(
                height: 166,
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
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: screenHight * 0.07,
                    ),
                    //the circle is content on the image and colors gradient
                    CustomOutline(
                        strokeWidth: 4.0,
                        radius: screenWidth * .8,
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Constants.kPinkColor,
                              Constants.kPinkColor.withOpacity(0),
                              Constants.kGreenColor.withOpacity(0.1),
                              Constants.kGreenColor,
                            ],
                          stops: [0.2,0.4,0.6,1]

                        ),
                        child: Container(
                          width:  screenWidth * .8,
                          height:  screenHight* .8,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/img-onboarding.png'
                              ),
                              fit: BoxFit.cover,
                              alignment: Alignment.bottomLeft
                            ),
                          ),
                        ),
                        width: screenWidth * .8,
                        height: screenHight * .38,

                        padding: EdgeInsets.all(4)),
                    SizedBox(
                      height: screenHight*0.09,
                    ),
                    Text(

                        'Wach Movies In \n  My Virtual Reality',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: screenHight<=660?18:34,
                        fontWeight: FontWeight.w700,
                        color:Constants.kWhiteColor.withOpacity(0.8 )
                      ),
                    ),

                    SizedBox(
                      height: screenHight*0.05,
                    ),
                    Text(

                      'Download and Watch offline\n wherever you are ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: screenHight<=660?12:16,
                          fontWeight: FontWeight.w100,
                          color:Constants.kWhiteColor.withOpacity(0.75 )
                      ),
                    ),
                    SizedBox(
                      height: screenHight*0.03,
                    ),

                    //GestureDetector for create shape as a button
                    //move to home page

                    GestureDetector(
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder:(context)=>HomePage()));
                      },
                      child: CustomOutline(
                          strokeWidth: 0.9,
                          radius: 20,
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [

                                Constants.kPinkColor.withOpacity(0.5),
                                Constants.kGreenColor.withOpacity(0.5),

                              ],


                          ),
                          child: Container(
                            width:  screenWidth * .8,
                            height:  screenHight* .8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [

                                  Constants.kPinkColor.withOpacity(0.3),
                                  Constants.kGreenColor.withOpacity(0.3),

                                ],


                              ),
                            ),
                            child:Center(
                              child: Text(

                                'Sign Up',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: screenHight<=660?18:22,
                                    fontWeight: FontWeight.bold,
                                    color:Constants.kWhiteColor.withOpacity(0.8 )
                                ),
                              ),
                            ) ,
                          ),
                          width: 180,
                          height:60,

                          padding: EdgeInsets.all(3),
                      ),
                    ),


                    Spacer(),

                    //the point that explain where we are in any screen
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(3, (index){
                        return Container(
                          height: 7,
                          width: 7,
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: index==0?
                              Constants.kGreenColor:
                              index==1?Constants.kWhiteColor.withOpacity(0.2):Constants.kWhiteColor.withOpacity(0.2)

                          ),
                        );
                      }),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),



          ],
        ),
      ),
    );
  }
}

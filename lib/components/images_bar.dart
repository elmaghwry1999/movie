import 'package:flutter/material.dart';
import 'package:movie_app_ui/components/constants.dart';
import 'package:movie_app_ui/components/masked_image.dart';
import 'package:movie_app_ui/models/movie.dart';

class ImageBar extends StatelessWidget {
    ImageBar({Key? key,required this.namelist,required this.itemcount,required this.images}) : super(key: key);
int itemcount;
String images;
List  namelist;

  @override
  Widget build(BuildContext context) {
    // use sized box and create in it listview.builder fr create scroll for bar and put image posters
    return SizedBox(
      height: 160,

      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: itemcount,
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
                  asset: namelist[index].images,
                  mask: mask,

                ),
              ),
            );
          }),
    );
  }
}

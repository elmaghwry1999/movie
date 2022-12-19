import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app_ui/components/constants.dart';

class SearchFieldWidget extends StatelessWidget {
    SearchFieldWidget({Key? key,required this.padding}) : super(key: key);
   final EdgeInsetsGeometry padding;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: padding,
      child: Container(
        height: 36,
        decoration: BoxDecoration(
          color: Constants.kGreyColor.withOpacity(0.12),
          borderRadius: BorderRadius.circular(10),

        ),
        child: Row(
          children: [
            const SizedBox(width: 8,),
            SvgPicture.asset(Constants.kIconSearch),
            Expanded(
              child: TextField(
                style: TextStyle(
                  color: Constants.kWhiteColor.withOpacity(0.6),
                  fontSize: 17,
                  letterSpacing: -0.41
                ),
                decoration: InputDecoration(
                  hintText: 'Search ',
                  hintStyle: TextStyle(
                      color: Constants.kWhiteColor.withOpacity(0.6),
                      fontSize: 17,
                      letterSpacing: -0.41
                  ),
                  border: InputBorder.none,
                  isDense: true,


                ),
              ),
            ),
            SvgPicture.asset(Constants.kIconMic),

          ],
        ),
      ),

    );
  }
}

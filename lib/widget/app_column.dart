import 'package:flutter/material.dart';
import 'package:flutter_applications/widget/small_text.dart';

import '../colors/colors.dart';
import '../colors/dimensions.dart';
import '../screens/icon_and_text_widget.dart';
import 'big_text.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(text: text,size: Dimensions.font26,),
                  SizedBox(
                    height: Dimensions.height10,
                  ),
                  Row(
                    children: [
                      Wrap(
                        children: List.generate(5, (index) {
                          return Icon(
                            Icons.star,
                            color: AppColors.mainColor,
                            size: Dimensions.height15,
                          );
                        }),
                      ),
                      SizedBox(
                        width: Dimensions.height10,
                      ),
                      SmallText(text: "4.5"),
                      SizedBox(
                        width: Dimensions.height10,
                      ),
                      SmallText(text: "1209"),
                      SizedBox(
                        width: Dimensions.height10,
                      ),
                      SmallText(text: "Comments")
                    ],
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconAndTextWidget(
                          icon: Icons.circle_sharp,
                          text: "Normal",
                          iconColor: AppColors.iconColor1),
                      IconAndTextWidget(
                          icon: Icons.location_on,
                          text: "1.7km",
                          iconColor: AppColors.mainColor),
                      IconAndTextWidget(
                          icon: Icons.access_time_rounded,
                          text: "32min",
                          iconColor: AppColors.iconColor2),
                    ],
                  ),
                ],
              );
    
  }
}
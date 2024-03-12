import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wahg_v1/const/app_assete.dart';
import 'package:wahg_v1/features/domain/entities/photographer_entity.dart';
import 'package:wahg_v1/theme/app_decoration.dart';
import 'package:wahg_v1/theme/custom_text_style.dart';
import 'package:wahg_v1/theme/theme_helper.dart';
import 'package:wahg_v1/utils/size_utils.dart';
import 'package:wahg_v1/widgets/images/custom_image_view.dart';

/// [IW: Item Widget] [IM: Item Model]
// ignore: must_be_immutable
class HPPhotographerCardIW extends StatelessWidget {
  Photographer photographer;
  HPPhotographerCardIW({required this.photographer,Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 257.v,
      width: 203.h,
      child: Stack(
        //clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 257,
              width: 203.h,
              decoration: AppDecoration.cardDecoration,
            ),
          ),
          CustomImageView(
            alignment: Alignment.topCenter,
            imagePath: photographer.photographerImages!.isNotEmpty
                ? photographer.photographerImages![0]
                : ImageAsset.imageNotFound,
            height: 136.v,
            width: 203.h,
            fit: BoxFit.cover,

            radius: BorderRadius.vertical(
              top: Radius.circular(11.h),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 2.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FittedBox(
                                child: Text(
                                  photographer.photographerTitle ?? "",
                                  style: CustomTextStyles.homeCardTitleText,
                                ),
                              ),
                              Text(
                                photographer.photographerDescription !="" ?
                                "${photographer.photographerDescription!.substring(0, 10)}"
                                    :"-",
                                style: CustomTextStyles.homeCardDescriptionText,
                              ),
                            ],
                          ),
                        ),
                        CustomImageView(
                          imagePath: ImageAsset.imgAntDesignHeartOutlined,
                          height: 30.adaptSize,
                          width: 30.adaptSize,
                          margin: EdgeInsets.only(
                            top: 4.v,
                            bottom: 14.v,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 2.h),
                    child: Text(
                      photographer.photographerPrice ?? "0.0",
                      style: CustomTextStyles.homeCardPriceText,

                    ),
                  ),
                  SizedBox(height: 1.v),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Opacity(
                            opacity: 0.8,
                            child: CustomImageView(
                              imagePath: ImageAsset.imgAkarIconsLocation,
                              height: 12.adaptSize,
                              width: 12.adaptSize,
                              margin: EdgeInsets.only(left: 2.v),
                            ),
                          ),
                          Opacity(
                            opacity: 0.8,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 4.h,
                              ),
                              child: Text(
                                photographer.photographerLocation ?? "",
                                style: theme.textTheme.bodySmall,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          CustomImageView(
                            color: Colors.orangeAccent,
                            imagePath: ImageAsset.imgAntDesignStarFilled,
                            height: 20.adaptSize,
                            width: 20.adaptSize,
                            margin: EdgeInsets.only(
                              top: 1.v,
                              bottom: 2.v,
                            ),
                          ),
                          Container(
                            width: 23.h,
                            margin: EdgeInsets.only(left: 3.h),
                            child: Text(
                              photographer.photographerRating ?? "5.0",

                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: CustomTextStyles.smallBodyText1
                                  .copyWith(
                                height: 1.50,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 6.v),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:wahg_v1/features/presentation/ui_models/hp_recommended_im.dart';

import 'package:wahg_v1/theme/theme_helper.dart';
import 'package:wahg_v1/utils/size_utils.dart';
import 'package:wahg_v1/widgets/images/custom_image_view.dart';

/// [IW: Item Widget] [IM: Item Model]
// ignore: must_be_immutable
class HPRecommendedIW extends StatelessWidget {
  HPRecommendedIW(
    this.recommendedIM, {
    Key? key,
  }) : super(
          key: key,
        );

  HPRecommendedIM recommendedIM;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 176.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          CustomImageView(
            imagePath: recommendedIM.image,
            height: 259.v,
            width: 176.h,
            radius: BorderRadius.circular(
              12.h,
            ),
          ),
          SizedBox(height: 10.v),
          Text(
            recommendedIM.text!,
            style: theme.textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}

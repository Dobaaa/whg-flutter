
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wahg_v1/const/app_assete.dart';
import 'package:wahg_v1/features/presentation/pages/3_details_page/bloc/details_bloc.dart';
import 'package:wahg_v1/localization/app_localization.dart';
import 'package:wahg_v1/theme/custom_text_style.dart';
import 'package:wahg_v1/theme/theme_helper.dart';
import 'package:wahg_v1/utils/size_utils.dart';
import 'package:wahg_v1/widgets/app_widgets/buttons/custom_button.dart';
import 'package:wahg_v1/widgets/images/custom_image_view.dart';

class DetailsPageScreen extends StatelessWidget {
  static const String id = 'details_page';

  const DetailsPageScreen({super.key});



  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsBloc, DetailsState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: appTheme.gray200,
            body: Container(
              width: double.maxFinite,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      height: 182.v,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: ColorConstant.blue50,
                        borderRadius: BorderRadius.circular(
                          6.h,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                        top: 24,
                        right: 16,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomImageView(
                            imagePath: ImageAsset.imageNotFound,
                            height: 233.v,
                            width: 290.h,
                            alignment: Alignment.center,
                          ),
                          CustomImageView(
                            imagePath: ImageAsset.imageNotFound,
                            height: 5.v,
                            width: 33.h,
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(
                              top: 24,
                            ),
                          ),
                          Container(
                            width: 316.h,
                            margin: const EdgeInsets.only(
                              top: 27,
                              right: 79,
                            ),
                            child: Text(
                              "msg_sony_cfi_1108a01".tr,
                              maxLines: null,
                              textAlign: TextAlign.left,
                              style: CustomTextStyles.titleLarge22,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                            ),
                            child: Text(
                              "lbl_special_price".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: CustomTextStyles.titleLarge22,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 13,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "lbl_499_99".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: CustomTextStyles.titleLarge22,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 4,
                                    bottom: 6,
                                  ),
                                  child: Text(
                                    "lbl_42_off".tr,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: CustomTextStyles.titleLarge22,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 35,
                            ),
                            child: Text(
                              "lbl_description".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: CustomTextStyles.titleLarge22,
                            ),
                          ),
                          Container(
                            width: 373.h,
                            margin: const EdgeInsets.only(
                              top: 20,
                              right: 22,
                            ),
                            child: Text(
                              "msg_green_apples_have".tr,
                              maxLines: null,
                              textAlign: TextAlign.left,
                              style: CustomTextStyles.bodySmallGreen900,
                            ),
                          ),
                          CustomButton(
                            height: 50.v,
                            text: "lbl_join_waitlist".tr,
                            margin: const EdgeInsets.only(
                              top: 27,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wahg_v1/const/app_assete.dart';
import 'package:wahg_v1/localization/app_localization.dart';
import 'package:wahg_v1/theme/app_decoration.dart';
import 'package:wahg_v1/theme/custom_text_style.dart';
import 'package:wahg_v1/theme/theme_helper.dart';
import 'package:wahg_v1/utils/size_utils.dart';
import 'package:wahg_v1/widgets/app_widgets/buttons/custom_button.dart';
import 'package:wahg_v1/widgets/app_widgets/text_field/custom_text_form_field.dart';
import 'package:wahg_v1/widgets/images/custom_image_view.dart';

import 'bloc/drawer_bloc.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class DrawerMenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //width: 310.h,
      padding: const EdgeInsets.all(24),
      decoration: AppDecoration.fillGoldWhite,
      child: SingleChildScrollView(
        child: SizedBox(
         // height: MediaQuery.of(context).size.height,
          height:11111,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  right: 62,
                ),
                child: Row(
                  children: [
                    CustomImageView(
                      imagePath: ImageAsset.img8148x48,
                      height: 48.adaptSize,
                      width: 48.adaptSize,
                      radius: BorderRadius.circular(
                        24.h,
                      ),
                    ),
                    Container(
                      width: 139.h,
                      margin: const EdgeInsets.only(
                        left: 12,
                        top: 4,
                        bottom: 2,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "lbl_ashfak_sayem".tr,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: CustomTextStyles.homeWelcomeBtnText,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 5,
                            ),
                            child: Text(
                              "msg_ashfaksayem_gmail_com".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: CustomTextStyles.hallsCardListLocationText,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 32,
                ),
                padding: const EdgeInsets.only(
                  left: 12,
                  top: 13,
                  right: 12,
                  bottom: 13,
                ),
                decoration: AppDecoration.fillGoldWhite.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder6,
                ),
                child: Row(
                  children: [
                    CustomImageView(
                      imagePath: ImageAsset.imgCalendar,
                      height: 24.adaptSize,
                      width: 24.adaptSize,
                      color: appTheme.blueGray900,
                      enableColorFilter: true
                      ,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 6,
                        top: 1,
                        bottom: 2,
                      ),
                      child: Text(
                        "lbl_calendar".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: CustomTextStyles.txtGilroySemiBold16Bluegray700,
                      ),
                    ),
                    const Spacer(),

                  ],
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 12,
                    top: 21,
                    right: 12,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomImageView(
                        imagePath: ImageAsset.imgLock24x24,
                        height: 24.adaptSize,
                        width: 24.adaptSize,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 6,
                          top: 1,
                          bottom: 2,
                        ),
                        child: Text(
                          "lbl_rewards".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style:
                              CustomTextStyles.txtGilroySemiBold16Bluegray700,
                        ),
                      ),
                      const Spacer(),

                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 12,
                  top: 34,
                ),
                child: Row(
                  children: [
                    CustomImageView(
                      imagePath: ImageAsset.imgLocation,
                      height: 24.adaptSize,
                      width: 24.adaptSize,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 6,
                        top: 1,
                        bottom: 2,
                      ),
                      child: Text(
                        "lbl_address".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: CustomTextStyles.txtGilroySemiBold16Bluegray700,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 12,
                  top: 34,
                ),
                child: Row(
                  children: [
                    CustomImageView(
                      imagePath: ImageAsset.imgCalendar24x24,
                      height: 24.adaptSize,
                      width: 24.adaptSize,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 6,
                        top: 3,
                      ),
                      child: Text(
                        "msg_payments_methods".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: CustomTextStyles.txtGilroySemiBold16Bluegray700,
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 12,
                    top: 34,
                    right: 12,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomImageView(
                        imagePath: ImageAsset.imgSettings1,
                        height: 24.adaptSize,
                        width: 24.adaptSize,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 6,
                          top: 1,
                          bottom: 2,
                        ),
                        child: Text(
                          "lbl_offers".tr,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style:
                              CustomTextStyles.txtGilroySemiBold16Bluegray700,
                        ),
                      ),
                      const Spacer(),
                     
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 12,
                  top: 34,
                ),
                child: Row(
                  children: [
                    CustomImageView(
                        imagePath: ImageAsset.imgUser24x24,
                        height: 24.adaptSize,
                        width: 24.adaptSize),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 6,
                        top: 1,
                        bottom: 2,
                      ),
                      child: Text(
                        "lbl_refer_a_friend".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: CustomTextStyles.txtGilroySemiBold16Bluegray700,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 12,
                  top: 34,
                ),
                child: Row(
                  children: [
                    CustomImageView(
                      imagePath: ImageAsset.imgCall,
                      height: 24.adaptSize,
                      width: 24.adaptSize,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 6,
                        top: 2,
                        bottom: 1,
                      ),
                      child: Text(
                        "lbl_support".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: CustomTextStyles.txtGilroySemiBold16Bluegray700,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Divider(
                height: 2.v,
                thickness: 2.v,
                color: ColorConstant.blueGray1006c,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 12,
                  top: 13,
                ),
                child: Row(
                  children: [
                    CustomImageView(
                      imagePath: ImageAsset.imgQuestion24x24,
                      height: 24.adaptSize,
                      width: 24.adaptSize,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 6,
                        top: 1,
                        bottom: 2,
                      ),
                      child: Text(
                        "lbl_colour_scheme".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: CustomTextStyles.txtGilroySemiBold16Bluegray700,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 21,
                  bottom: 24,
                ),
                padding: const EdgeInsets.all( 4
                ),
                decoration: AppDecoration.fillGray20001.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder16,
                ),
                child: Row(
                  children: [
                    BlocSelector<DrawerBloc, DrawerState, TextEditingController?>(
                      selector: (state) => state.toggleController,
                      builder: (context, toggleController) {
                        return CustomTextFormField(
                          width: 125.h,
                          focusNode: FocusNode(),
                          controller: toggleController,
                          hintText: "lbl_light".tr,
                          variant: TextFormFieldVariant.OutlineBlack9003f,
                          shape: TextFormFieldShape.CircleBorder16,
                          padding: TextFormFieldPadding.PaddingT6,
                          fontStyle: TextFormFieldFontStyle.GilroySemiBold14,
                          textInputAction: TextInputAction.done,
                          prefix: Container(
                            margin: const EdgeInsets.only(
                              left: 26,
                              top: 4,
                              right: 8,
                              bottom: 4,
                            ),
                            child: CustomImageView(
                              imagePath: ImageAsset.imgBrightness,
                            ),
                          ),
                          prefixConstraints: BoxConstraints(
                            maxHeight: 32.v,
                          ),
                        );
                      },
                    ),
                    CustomImageView(
                      imagePath: ImageAsset.imgUiiconmoonlight,
                      height: 24.adaptSize,
                      width: 24.adaptSize,
                      margin: const EdgeInsets.only(
                        left: 31,
                        top: 4,
                        bottom: 4,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 8,
                        top: 7,
                        right: 35,
                        bottom: 7,
                      ),
                      child: Text(
                        "lbl_dark".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: CustomTextStyles.txtGilroySemiBold14Bluegray700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

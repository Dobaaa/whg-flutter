
import 'package:wahg_v1/const/app_assete.dart';

/// This class is used in the [vendorshortlist_item_widget] screen.
class HPServiceCardIM {
  String? menuImage;
  String? menuText;
  String? subText;
  String? pendingImage;
  String? pendingText;
  String? id;

  HPServiceCardIM({
    this.menuImage,
    this.menuText,
    this.subText,
    this.pendingImage,
    this.pendingText,
    this.id,
  }) {
    menuImage = menuImage ?? ImageAsset.imgRectangle6445;
    menuText = menuText ?? "Item";
    subText = subText ?? "sub text";
    pendingImage = pendingImage ?? ImageAsset.imgVideoCamera;
    pendingText = pendingText ?? "Pending";
    id = id ?? "";
  }


}

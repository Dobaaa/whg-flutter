import 'package:wahg_v1/const/app_assete.dart';


/// This class is used in the [HPRecommendedIW] screen.
class HPRecommendedIM {
  String? image;
  String? text;
  String? id;

  HPRecommendedIM({
    this.image,
    this.text,
    this.id,
  }) {
    image = image ?? ImageAsset.imgImage604;
    text = text ?? "Item";
    id = id ?? "";
  }


}

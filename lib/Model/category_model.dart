import 'package:news_app/utils/app_images.dart';

class CategoryModel {
  String id;
  String title;
  String image;
  CategoryModel({required this.id, required this.title, required this.image});
  // ToDo : provider
  static List<CategoryModel> getCategoryList(bool isDark) {
    return [
      CategoryModel(
        id: "general",
        title: "General",
        image: isDark
            ? AppImages.generalLightImage
            : AppImages.generalDarkImage,
      ),
      CategoryModel(
        id: "business",
        title: "Business",
        image: isDark
            ? AppImages.businessLightImage
            : AppImages.businessDarkImage,
      ),
      CategoryModel(
        id: "sports",
        title: "Sports",
        image: isDark ? AppImages.sportsLightImage : AppImages.sportsDarkImage,
      ),
      CategoryModel(
        id: "technology",
        title: "Technology",
        image: isDark
            ? AppImages.technologyLightImage
            : AppImages.technologyDarkImage,
      ),
      CategoryModel(
        id: "entertainment",
        title: "Entertainment",
        image: isDark
            ? AppImages.entertainmentLightImage
            : AppImages.entertainmentDarkImage,
      ),
      CategoryModel(
        id: "health",
        title: "Health",
        image: isDark ? AppImages.healthLightImage : AppImages.healthDarkImage,
      ),
      CategoryModel(
        id: "science",
        title: "Science",
        image: isDark
            ? AppImages.scienceLightImage
            : AppImages.scienceDarkImage,
      ),
    ];
  }
}

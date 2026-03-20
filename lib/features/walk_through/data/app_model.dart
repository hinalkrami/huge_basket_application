import '../../../core/constant/app_constant.dart';

class PageContent {
  PageContent({
    required this.image,
    required this.title,
    required this.subTitle,
  });
  String image;
  String title;
  String subTitle;
}

List<PageContent> content = [
  PageContent(
    image: AppImage.image1,
    title: AppText.page1Title,
    subTitle: AppText.pageSubtitle,
  ),
  PageContent(
    image: AppImage.image2,
    title: AppText.page2Title,
    subTitle: AppText.pageSubtitle,
  ),
  PageContent(
    image: AppImage.image3,
    title: AppText.page3Title,
    subTitle: AppText.pageSubtitle,
  ),
];

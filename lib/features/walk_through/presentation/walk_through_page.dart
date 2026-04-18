import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_app/core/config/app_route.dart';
import 'package:new_app/features/auth/data/model/user_details_model.dart';
import 'package:new_app/features/local/hive_box.dart';
import 'package:new_app/widget/custom_app_bar.dart';
import 'package:new_app/widget/custom_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../core/constant/app_constant.dart';
import '../../../core/utils/app_text_style.dart';
import '../data/app_model.dart';

@RoutePage()
class WalkThroughPage extends StatefulWidget {
  const WalkThroughPage({super.key});

  @override
  State<WalkThroughPage> createState() => _WalkThroughPageState();
}

class _WalkThroughPageState extends State<WalkThroughPage> {
  PageController pageController = PageController();
  ValueNotifier<int> pageIndex = ValueNotifier(0);
  HiveBox box = HiveBox();
  late ValueChanged<int> skipFunction = (int pageIndex) {
    pageController.jumpToPage(2);
  };

  void onPageChange(int index) {
    pageIndex.value = index;
  }

  @override
  void initState() {
    super.initState();
  }

  void onNextPage(int pageIndex) {
    if (pageIndex != 2) {
      pageController.nextPage(duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
    } else {
      box.appSetting.put('isFirstTime', false);
      context.router.popAndPush(LoginRoute());
    }
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        action: [
          ValueListenableBuilder(
            valueListenable: pageIndex,
            builder: (context, value, child) {
              return TextButton(
                onPressed: () => skipFunction(value),
                child: Text(value != 2 ? AppText.skipText : '', style: AppTextStyle.skip),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 50.h),
        child: Stack(
          alignment: .bottomLeft,
          children: [
            ValueListenableBuilder(
              valueListenable: pageIndex,
              builder: (context, value, child) {
                return PageView.builder(
                  controller: pageController,
                  onPageChanged: onPageChange,
                  itemCount: content.length,
                  itemBuilder: (context, index) {
                    return Column(
                      spacing: 50,
                      children: [
                        Image.asset(content[index].image, height: 1.sh / 2.5),
                        Text(content[index].title, style: AppTextStyle.pageTitle),
                        Text(
                          content[index].subTitle,
                          style: AppTextStyle.pageSubTitle,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                SmoothPageIndicator(
                  controller: pageController,
                  count: 3,
                  effect: ExpandingDotsEffect(
                    activeDotColor: Color(0XFF44B12C),
                    spacing: 10.w,
                    dotColor: Colors.black.withAlpha(80),
                  ),
                ),
                ValueListenableBuilder(
                  valueListenable: pageIndex,
                  builder: (context, value, child) {
                    return CustomButton(
                      onPressed: () {
                        onNextPage(pageIndex.value);
                      },
                      child: Text(pageIndex.value == 2 ? AppText.goText : AppText.nextText),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:my_total_fit/src/common/constents/app_images.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:my_total_fit/src/common/widgets/custom_search_bar.dart';
import 'package:my_total_fit/src/feature/home/model/challenges_model.dart';
import 'package:my_total_fit/src/feature/home/pages/catogery/model/category_model.dart';
import 'package:my_total_fit/src/feature/home/pages/exercise_details.dart/model/exercise_model.dart';
import 'package:my_total_fit/src/feature/home/pages/papuler_traning/widgets/women_streching.dart';
import 'package:my_total_fit/src/feature/home/widgets/custom_container.dart';
import 'package:my_total_fit/src/feature/home/widgets/custom_goal_container.dart';
import 'package:my_total_fit/src/feature/home/widgets/custom_row.dart';
import 'package:my_total_fit/src/route/get_pages.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () => context.pushNamed(AppRoute.profilePage),
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: CircleAvatar(
                radius: 7,
                backgroundImage: AssetImage(AppImages.profilepicture),
              ),
            ),
          ),
          centerTitle: false,
          title: Text("Hello Jack!",
              style: textTheme(context)
                  .headlineMedium!
                  .copyWith(fontWeight: FontWeight.w600)),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 10),
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: colorScheme(context).surface,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 1,
                      spreadRadius: 1,
                    ),
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Badge(
                      backgroundColor: colorScheme(context).primary,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                    width: 20,
                    child: Image(image: AssetImage(AppImages.done)),
                  ),
                ],
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Text(
                  "Get Strong with Comprehensive Exercises",
                  style: textTheme(context).titleSmall,
                ),
                const SizedBox(height: 10),
                CustomSearchBar(controller: searchController),
                const SizedBox(height: 20),
                CustomRow(
                  text1: "Challanges",
                  onTap: () => context.pushNamed(AppRoute.allChallenges),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 155,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: challengList.length,
                    itemBuilder: (context, index) {
                      final challenge = challengList[index];
                      return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: ChallengesContainer(
                          title: challenge.challengestext!,
                          description: challenge.text!,
                          onTap: () {},
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                CustomRow(text1: "Today's Goal", onTap: () {}),
                const SizedBox(height: 20),
                const GoalContainer(),
                const SizedBox(height: 20),
                CustomRow(
                    text1: "Category",
                    onTap: () {
                      context.pushNamed(AppRoute.catogeryScreen);
                    }),
                const SizedBox(height: 20),
                SizedBox(
                  height: 100,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: categoryList.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 10),
                    itemBuilder: (context, index) {
                      final category = categoryList[index];
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 8),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(50)),
                            ),
                            child: Image.asset(
                              category.image!,
                              width: 50,
                              height: 50,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            category.text!,
                            style: textTheme(context).bodyMedium,
                          )
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                CustomRow(
                    text1: "Popular Exercises",
                    onTap: () {
                      context.pushNamed(AppRoute.traning);
                    }),
                const SizedBox(height: 20),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: exerciseList.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 20),
                  itemBuilder: (context, index) {
                    final exercise = exerciseList[index];
                    return InkWell(
                      onTap: () => context.pushNamed(
                        AppRoute.excerciseDetails,
                        extra: exercise,
                      ),
                      child: CustomWomenStreching(
                        image: exercise.image!,
                        title: exercise.title!,
                        level: exercise.level!,
                        time: exercise.time!,
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

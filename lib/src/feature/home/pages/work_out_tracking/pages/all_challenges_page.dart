import 'package:flutter/material.dart';
import 'package:my_total_fit/src/feature/home/model/challenges_model.dart';
import 'package:my_total_fit/src/feature/home/widgets/custom_container.dart';

class AllChallengesPage extends StatelessWidget {
  const AllChallengesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Challenges"),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        shrinkWrap: true,
        itemCount: challengList.length,
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemBuilder: (context, index) {
          final challenge = challengList[index];
          return ChallengesContainer(
            title: challenge.challengestext!,
            description: challenge.text!,
            onTap: () {},
          );
        },
      ),
    );
  }
}

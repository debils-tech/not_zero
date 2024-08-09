import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:not_zero/helpers/not_zero_icons.dart';
import 'package:not_zero/units/home/presentation/bloc/home_score_cubit.dart';

class HomeStatsHeader extends StatelessWidget {
  const HomeStatsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: 150,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            theme.scaffoldBackgroundColor,
            theme.primaryColorDark,
            theme.primaryColor,
          ],
          stops: const [0.0, 0.2, 1.0],
        ),
      ),
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          BlocBuilder<HomeScoreCubit, HomeScoreState>(
            builder: (context, state) {
              if (state.totalPoints != null) {
                return Text(
                  state.totalPoints.toString(),
                  style: const TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w700,
                  ),
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
          const SizedBox(width: 6),
          const Icon(NotZeroIcons.zero),
        ],
      ),
    );
  }
}

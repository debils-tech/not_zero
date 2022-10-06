import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:not_zero/units/home/presentation/bloc/home_score_cubit.dart';
import 'package:not_zero/units/home/presentation/bloc/states/home_score_state.dart';

class HomeStatsHeader extends StatelessWidget {
  const HomeStatsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Theme.of(context).primaryColorDark,
            Theme.of(context).primaryColor
          ],
        ),
      ),
      child: BlocBuilder<HomeScoreCubit, HomeScoreState>(
        builder: (context, state) {
          if (state.totalPoints != null) {
            return Text(
              state.totalPoints.toString(),
              style: const TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.w800,
              ),
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

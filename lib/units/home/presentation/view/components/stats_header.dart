import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:not_zero/units/stats/presentation/bloc/user_total_points_cubit.dart';

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
      child: BlocBuilder<UserTotalPointsCubit, int>(
        builder: (context, state) {
          return Text(
            state.toString(),
            style: const TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.w800,
            ),
          );
        },
      ),
    );
  }
}

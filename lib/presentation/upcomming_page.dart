import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'match/bloc/match_bloc.dart';
import 'widgets/match_cardview.dart';

class UpcommingPage extends StatelessWidget {
  const UpcommingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MatchBloc(),
      child: const UpcommingView(),
    );
  }
}

class UpcommingView extends StatelessWidget {
  const UpcommingView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Upcomming Matches",
          style: TextStyle(
            color: Theme.of(context).indicatorColor,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: BlocBuilder<MatchBloc, MatchState>(
        bloc: context.read<MatchBloc>()..add(GetUpCommingMatchEvent()),
        builder: (context, state) {
          if (state.status == MatchStateEnum.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.separated(
            itemCount: state.upcommingMatchs?.length ?? 0,
            padding: const EdgeInsets.symmetric(vertical: 12),
            itemBuilder: (context, index) {
              final match = state.upcommingMatchs?[index];

              return SizedBox(
                height: 230,
                child: MatchCardView(match: match, type: "Upcomming"),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Container(
                height: 8,
              );
            },
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:livescore/presentation/match/bloc/match_bloc.dart';

import 'widgets/match_cardview.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MatchBloc(),
      child: const ResultView(),
    );
  }
}

class ResultView extends StatelessWidget {
  const ResultView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Result",
          style: TextStyle(
            color: Theme.of(context).indicatorColor,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: BlocBuilder<MatchBloc, MatchState>(
          bloc: context.read<MatchBloc>()..add(GetAllMatchEvent()),
          builder: (context, state) {
            if (state.status == MatchStateEnum.loading) {
              return const Center(child: CircularProgressIndicator());
            }
            return ListView.separated(
              itemCount: state.allMatchs?.length ?? 0,
              itemBuilder: (context, index) {
                final match = state.allMatchs?[index];

                return SizedBox(
                  height: 230,
                  child: MatchCardView(match: match, type: "Finished"),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Container(
                  height: 8,
                );
              },
            );
          }),
    );
  }
}

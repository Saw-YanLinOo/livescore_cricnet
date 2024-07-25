import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:livescore/presentation/match/bloc/match_bloc.dart';

import '../widgets/match_cardview.dart';

class MatchPage extends StatelessWidget {
  const MatchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MatchBloc(),
      child: const MatchView(),
    );
  }
}

class MatchView extends StatefulWidget {
  const MatchView({
    super.key,
  });

  @override
  State<MatchView> createState() => _MatchViewState();
}

class _MatchViewState extends State<MatchView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Live Score",
          style: TextStyle(
            color: Theme.of(context).indicatorColor,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 12,
          ),
          SizedBox(
            height: 270,
            width: double.infinity,
            child: BlocBuilder<MatchBloc, MatchState>(
                bloc: context.read<MatchBloc>()..add(GetLiveMatchEvent()),
                builder: (context, state) {
                  if (state.status == MatchStateEnum.loading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return CarouselSlider(
                    items: state.liveMatchs?.map((i) {
                          return MatchCardView(
                              match: i.toAllMatchVO(), type: "Live");
                        }).toList() ??
                        [],
                    options: CarouselOptions(
                      height: 270,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.9,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.3,
                    ),
                  );
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              width: double.infinity,
              color: Theme.of(context).primaryColor,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  "Overview",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<MatchBloc, MatchState>(
                bloc: context.read<MatchBloc>()..add(GetAllMatchEvent()),
                builder: (context, state) {
                  if (state.status == MatchStateEnum.loading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return ListView.separated(
                    itemCount: state.allMatchs?.length ?? 0,
                    itemBuilder: (context, idx) {
                      final match = state.allMatchs?[idx];

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
          )
        ],
      ),
    );
  }
}

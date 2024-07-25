import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:livescore/domain/model/new_vo.dart';
import 'package:livescore/presentation/new/bloc/new_bloc.dart';

class NewPage extends StatelessWidget {
  const NewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewBloc(),
      child: const NewWidget(),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "New",
          style: TextStyle(
            color: Theme.of(context).indicatorColor,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: BlocBuilder<NewBloc, NewState>(
          bloc: context.read<NewBloc>()..add(GetNewEvent()),
          builder: (context, state) {
            if (state.status == NewStateEnum.loading) {
              return const Center(child: CircularProgressIndicator());
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    "Recent",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                SizedBox(
                  height: 200,
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    itemCount: state.newlist?.length ?? 0,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      var news = state.newlist?[index];

                      return RecentNewWidget(news: news);
                    },
                    separatorBuilder: (context, index) => Container(width: 12),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    "Top Stories",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Expanded(
                  child: ListView.separated(
                    itemCount: state.newlist?.length ?? 0,
                    itemBuilder: (context, index) {
                      var news = state.newlist?[index];

                      return TopStoriesCardView(news: news);
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 8),
                  ),
                )
              ],
            );
          }),
    );
  }
}

class RecentNewWidget extends StatelessWidget {
  const RecentNewWidget({
    super.key,
    this.news,
  });

  final NewVo? news;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      child: Card(
        clipBehavior: Clip.hardEdge,
        child: Stack(
          children: [
            Positioned.fill(
              child: CachedNetworkImage(
                imageUrl: "${news?.urlToImage}",
                fit: BoxFit.cover,
                errorWidget: (context, url, error) => const FlutterLogo(),
              ),
            ),
            Positioned.fill(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Colors.transparent,
                      Colors.transparent,
                      Colors.grey.shade500
                    ])),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Spacer(),
                    Text(
                      "${news?.title ?? ""}",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      "${news?.publishedAt}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TopStoriesCardView extends StatelessWidget {
  const TopStoriesCardView({
    super.key,
    this.news,
  });

  final NewVo? news;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Card(
        clipBehavior: Clip.hardEdge,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                clipBehavior: Clip.hardEdge,
                child: CachedNetworkImage(
                  imageUrl: "${news?.urlToImage}",
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) => const FlutterLogo(),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      news?.title ?? "",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      news?.description ?? "",
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      news?.publishedAt ?? "",
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

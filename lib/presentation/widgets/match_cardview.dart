import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:livescore/domain/model/all_match_vo.dart';

class MatchCardView extends StatelessWidget {
  const MatchCardView({
    super.key,
    this.match,
    this.type,
  });

  final AllMatchVo? match;
  final String? type;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 12,
            ),
            Text(match?.title ?? ""),
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        width: 24,
                        height: 24,
                        child: CachedNetworkImage(
                          imageUrl: "${match?.imageUrl}${match?.teamAImage}",
                          fit: BoxFit.cover,
                          errorWidget: (context, url, error) =>
                              const FlutterLogo(),
                        ),
                        // child: Image.network(
                        //   "${match?.imageUrl}${match?.teamAImage}",
                        //   fit: BoxFit.cover,
                        //   errorBuilder: (context, error, stackTrace) =>
                        //       const FlutterLogo(),
                        // ),
                      ),
                      Text(match?.teamA ?? "")
                    ],
                  ),
                  Container(
                    // width: 32,
                    // height: 32,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Text(
                        "VS",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: 24,
                        height: 24,
                        child: CachedNetworkImage(
                          imageUrl: "${match?.imageUrl}${match?.teamBImage}",
                          fit: BoxFit.cover,
                          errorWidget: (context, url, error) =>
                              const FlutterLogo(),
                        ),
                      ),
                      Text(match?.teamB ?? "")
                    ],
                  ),
                ],
              ),
            ),
            Spacer(),
            Text("${match?.matchtime}"),
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                "${match?.venue}",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                "${match?.result}",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.green,
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Spacer(),
            Container(
              width: 120,
              height: 32,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Center(
                  child: Text(
                    type ?? "",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

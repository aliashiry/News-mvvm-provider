import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news/core/theme/theme.dart';
import 'package:news/model/NewsResponse.dart';

class NewsItem extends StatelessWidget {
  final f = DateFormat.jm();
  News news;

  NewsItem({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                imageUrl: news.urlToImage ?? ' ',
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(
                        child: CircularProgressIndicator(
                            backgroundColor: MyTheme.primaryLightColor,
                            value: downloadProgress.progress)),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              news.author ?? '',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: MyTheme.greyColor,
                  ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(news.title ?? '',
                style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(
              height: 8,
            ),

            //  Text(f.format(new DateTime.fromMillisecondsSinceEpoch((news.publishedAt!*1000) as int))),
            Text(
              f.format(DateTime.parse(news.publishedAt.toString())),
              textAlign: TextAlign.end,
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    // Assuming titleSmall is not available
                    color: MyTheme.greyColor,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:tvseries/domain/entities/episode.dart';
import 'package:flutter/material.dart';

class SeasonEpisodesList extends StatelessWidget {
  const SeasonEpisodesList({
    super.key,
    required this.episodes,
  });

  final List<Episode> episodes;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return const Divider(
            color: Colors.white,
          );
        },
        padding: const EdgeInsets.only(bottom: 2),
        itemCount: episodes.length,
        itemBuilder: (context, index) {
          return Row(
            children: [
              SizedBox(
                width: 20,
                child: Text('${index + 1}.'),
              ),
              Expanded(
                child: Text(
                  episodes[index].name,
                  maxLines: 5,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

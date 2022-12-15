import 'package:tvseries/domain/entities/season_detail.dart';
import 'package:tvseries/presentation/pages/tvseries_detail/widgets/lists/season_episodes_list.dart';
import 'package:flutter/material.dart';

class DetailSeasonContent extends StatelessWidget {
  const DetailSeasonContent({
    super.key,
    required this.seasonDetail,
  });

  final SeasonDetail seasonDetail;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Air Date',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(seasonDetail.airDate),
        const SizedBox(
          height: 12,
        ),
        const Text(
          'Total Episodes',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(seasonDetail.episodes.length.toString()),
        const SizedBox(
          height: 12,
        ),
        const Text(
          'Episodes',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        SeasonEpisodesList(episodes: seasonDetail.episodes),
      ],
    );
  }
}

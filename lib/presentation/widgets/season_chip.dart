import 'package:ditonton_dicoding_flutter/domain/entities/season.dart';
import 'package:ditonton_dicoding_flutter/presentation/pages/tvseries_detail/widgets/dialogs/dialog_season.dart';
import 'package:flutter/material.dart';

class SeasonChip extends StatelessWidget {
  const SeasonChip({
    super.key,
    required this.season,
    required this.tvId,
  });

  final Season season;
  final int tvId;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: Card(
        color: Colors.blue, // Background color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(24),
          splashColor: Colors.black, // Splash color
          onTap: () {
            showSeasonDialog(context, season, tvId);
          },
          child: Ink(
            width: 100,
            height: 100,
            child: Center(
              child: Text(
                season.name,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

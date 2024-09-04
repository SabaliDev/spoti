import 'package:flutter/material.dart';
import 'package:spoti/common/widgets/appbar/app_bar.dart';
import 'package:spoti/core/configs/constants/app_urls.dart';
import 'package:spoti/core/configs/theme/app_colors.dart';
import 'package:spoti/domain/entities/song/song.dart';

class SongPlayerPage extends StatelessWidget {
  final SongEntity songEntity;
  const SongPlayerPage({super.key, required this.songEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        action: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_vert_rounded),
        ),
        title: const Text(
          'Now playing',
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          children: [
            _songCover(context),
            const SizedBox(
              height: 20,
            ),
            _songDetail()
          ],
        ),
      ),
    );
  }

  Widget _songCover(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  '${AppURLs.firestorage}${songEntity.artist} - ${songEntity.title}.jpeg?${AppURLs.mediaAlt}'))),
    );
  }

  Widget _songDetail() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              songEntity.title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              songEntity.artist,
              style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
            ),
          ],
        ),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_outline_outlined,
              size: 35,
              color: AppColors.darkGrey,
            ))
      ],
    );
  }
}

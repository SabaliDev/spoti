import 'package:dartz/dartz.dart';
import 'package:spoti/data/sources/song/song_firebase_service.dart';
import 'package:spoti/domain/repository/song/song.dart';
import 'package:spoti/service_locator.dart';

class SongRepositoryImpl extends SongsRepository {
  @override
  Future<Either> getNewsSongs() async {
    return await sl<SongFirebaseService>().getNewsSongs();
  }

  @override
  Future<Either> getPlayList() async {
    // TODO: implement getPlayList
    return await sl<SongFirebaseService>().getPlayList();
  }
}

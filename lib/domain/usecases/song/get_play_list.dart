import 'package:dartz/dartz.dart';
import 'package:spoti/core/usecase/usecase.dart';
import '../../repository/song/song.dart';
import 'package:spoti/service_locator.dart';

class GetPlayListUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<SongsRepository>().getPlayList();
  }
}

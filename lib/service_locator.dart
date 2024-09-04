import 'package:get_it/get_it.dart';
import 'package:spoti/data/repository/auth/auth_repository_impl.dart.dart';
import 'package:spoti/data/repository/song/song_repository_impl.dart';
import 'package:spoti/data/sources/auth/auth_firebase_service.dart';
import 'package:spoti/data/sources/song/song_firebase_service.dart';
import 'package:spoti/domain/repository/auth/auth.dart';
import 'package:spoti/domain/repository/song/song.dart';
import 'package:spoti/domain/usecases/auth/sign_up.dart';
import 'package:spoti/domain/usecases/auth/signin.dart';
import 'package:spoti/domain/usecases/song/get_news_songs.dart';

import 'domain/usecases/song/get_play_list.dart';

final sl = GetIt.instance;

Future<void> intializeDependencies() async {
  //Auth
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<SignUpUseCase>(SignUpUseCase());
  sl.registerSingleton<SigninUseCase>(SigninUseCase());

//Song service locator
// Song service locator
  sl.registerSingleton<SongFirebaseService>(SongFirebaseServiceImpl());
  sl.registerSingleton<SongsRepository>(SongRepositoryImpl());
  sl.registerSingleton<GetNewsSongsUseCase>(GetNewsSongsUseCase());

  //Playlist service locator
  sl.registerSingleton<GetPlayListUseCase>(GetPlayListUseCase());
}

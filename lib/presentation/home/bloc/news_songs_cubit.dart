import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spoti/domain/usecases/song/get_news_songs.dart';
import 'package:spoti/presentation/home/bloc/news_songs_state.dart';
import 'package:spoti/service_locator.dart';

class NewsSongsCubit extends Cubit<NewsSongsState> {
  NewsSongsCubit() : super(NewsSongsLoading());

  Future<void> getNewsSongs() async {
    var returnedSongs = await sl<GetNewsSongsUseCase>().call();

    returnedSongs.fold(
      (l) {
        // Debugging line
        emit(NewsSongsLoadFailure());
      },
      (data) {
        // Debugging line
        emit(NewsSongsLoaded(songs: data));
      },
    );
  }
}

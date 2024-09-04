import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spoti/presentation/home/bloc/play_list_state.dart';
import 'package:spoti/service_locator.dart';

import '../../../domain/usecases/song/get_play_list.dart';

class PlayListCubit extends Cubit<PlayListState> {
  PlayListCubit() : super(PlayListLoading());

  Future<void> getPlayList() async {
    var returnedSongs = await sl<GetPlayListUseCase>().call();

    returnedSongs.fold(
      (l) {
        // Debugging line
        emit(PlayListLoadFailure());
      },
      (data) {
        // Debugging line
        emit(PlayListLoaded(songs: data));
      },
    );
  }
}

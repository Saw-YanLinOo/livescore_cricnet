import 'package:bloc/bloc.dart';
import 'package:livescore/domain/model/new_vo.dart';
import 'package:livescore/domain/repository/live_score_repo.dart';
import 'package:livescore/domain/repository/live_score_repo_impl.dart';
import 'package:meta/meta.dart';

part 'new_event.dart';
part 'new_state.dart';

class NewBloc extends Bloc<NewEvent, NewState> {
  LiveScoreRepo _lvRepo = LiveScoreRepoImpl();

  NewBloc({LiveScoreRepo? lv}) : super(const NewState()) {
    if (lv != null) {
      _lvRepo = lv;
    }

    on<GetNewEvent>(_getNews);
  }

  _getNews(GetNewEvent event, Emitter<NewState> emit) async {
    emit(state.copyWith(status: NewStateEnum.loading));

    try {
      final list = await _lvRepo.getNews();

      emit(state.copyWith(status: NewStateEnum.error, newlist: list));
    } catch (e, _) {
      emit(state.copyWith(status: NewStateEnum.error, message: "$e"));
    }
  }
}

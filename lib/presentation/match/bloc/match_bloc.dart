import 'package:bloc/bloc.dart';
import 'package:livescore/data/network/request/get_all_match_request.dart';
import 'package:livescore/domain/model/all_match_vo.dart';
import 'package:livescore/domain/model/live_match_vo.dart';
import 'package:livescore/domain/repository/live_score_repo.dart';
import 'package:livescore/domain/repository/live_score_repo_impl.dart';
import 'package:meta/meta.dart';

part 'match_event.dart';
part 'match_state.dart';

class MatchBloc extends Bloc<MatchEvent, MatchState> {
  LiveScoreRepo _lvRepo = LiveScoreRepoImpl();

  MatchBloc({LiveScoreRepo? livesocreRepo}) : super(const MatchState()) {
    if (livesocreRepo != null) {
      _lvRepo = livesocreRepo;
    }
    on<GetAllMatchEvent>(_getAllMatch);
    on<GetLiveMatchEvent>(_getLiveMatch);
    on<GetUpCommingMatchEvent>(_getUpCommingMatch);
  }

  _getAllMatch(GetAllMatchEvent event, Emitter<MatchState> emit) async {
    emit(state.copyWith(status: MatchStateEnum.loading));

    try {
      final request = GetAllMatchRequest(start: 0, end: 10);
      final response = await _lvRepo.getAllMatch(request);

      emit(state.copyWith(
          status: MatchStateEnum.success, allMatchs: response.allMatches));
    } catch (e, _) {
      emit(state.copyWith(status: MatchStateEnum.error, error: "$e"));
    }
  }

  _getLiveMatch(GetLiveMatchEvent event, Emitter<MatchState> emit) async {
    emit(state.copyWith(status: MatchStateEnum.loading));

    try {
      final response = await _lvRepo.getLiveMatch();

      emit(
          state.copyWith(status: MatchStateEnum.success, liveMatchs: response));
    } catch (e, _) {
      emit(state.copyWith(status: MatchStateEnum.error, error: "$e"));
    }
  }

  _getUpCommingMatch(
      GetUpCommingMatchEvent event, Emitter<MatchState> emit) async {
    emit(state.copyWith(status: MatchStateEnum.loading));

    try {
      final request = GetAllMatchRequest(start: 0, end: 10);
      final response = await _lvRepo.getUpCommingMatch(request);

      emit(state.copyWith(
          status: MatchStateEnum.success,
          upcommingMatchs: response.allMatches));
    } catch (e, _) {
      emit(state.copyWith(status: MatchStateEnum.error, error: "$e"));
    }
  }
}

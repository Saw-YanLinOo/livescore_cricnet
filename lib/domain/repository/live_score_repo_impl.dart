import 'package:livescore/data/network/dataagent/data_agent.dart';
import 'package:livescore/data/network/dataagent/retrofit_data_agent.dart';
import 'package:livescore/data/network/request/get_all_match_request.dart';
import 'package:livescore/data/network/response/get_all_match_response.dart';
import 'package:livescore/domain/model/all_match_vo.dart';
import 'package:livescore/domain/repository/live_score_repo.dart';

class LiveScoreRepoImpl extends LiveScoreRepo {
  final DataAgent _dataAgent = RetrofitDataAgentImpl();

  LiveScoreRepoImpl._();
  static final LiveScoreRepoImpl _singleton = LiveScoreRepoImpl._();
  factory LiveScoreRepoImpl() => _singleton;

  @override
  Future<GetAllMatchResponse> getAllMatch(GetAllMatchRequest request) {
    return _dataAgent.getAllMatch(request);
  }

  @override
  Future<GetAllMatchResponse> getUpCommingMatch(GetAllMatchRequest request) {
    return _dataAgent.getUpCommingMatch(request);
  }

  @override
  Future<List<AllMatchVo>> getLiveMatch() {
    return _dataAgent.getLiveMatch();
  }
}

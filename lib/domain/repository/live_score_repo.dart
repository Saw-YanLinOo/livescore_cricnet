import 'package:livescore/data/network/request/get_all_match_request.dart';
import 'package:livescore/data/network/response/get_all_match_response.dart';
import 'package:livescore/domain/model/all_match_vo.dart';
import 'package:livescore/domain/model/live_match_vo.dart';

abstract class LiveScoreRepo {
  Future<GetAllMatchResponse> getAllMatch(GetAllMatchRequest request);
  Future<GetAllMatchResponse> getUpCommingMatch(GetAllMatchRequest request);
  Future<List<LiveMatchVo>> getLiveMatch();
}

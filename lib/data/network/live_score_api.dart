import 'package:dio/dio.dart';
import 'package:livescore/data/network/api_constant.dart';
import 'package:livescore/data/network/request/get_all_match_request.dart';
import 'package:livescore/data/network/response/get_all_match_response.dart';
import 'package:livescore/domain/model/all_match_vo.dart';
import 'package:livescore/domain/model/live_match_vo.dart';
import 'package:retrofit/http.dart';

part 'live_score_api.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class LiveScoreApi {
  factory LiveScoreApi(Dio dio) => _LiveScoreApi(dio);

  @GET(ENDPOINT_GET_ALL_MATCHES)
  Future<GetAllMatchResponse> getAllMatch(
    @Body() GetAllMatchRequest request,
  );
  @GET(ENDPOINT_GET_UPCOMMING_MATCHES)
  Future<GetAllMatchResponse> getUpcommingMatch(
    @Body() GetAllMatchRequest request,
  );
  @GET(ENDPOINT_GET_LIVE_MATCHES)
  Future<List<LiveMatchVo>> getLiveMatch();
}

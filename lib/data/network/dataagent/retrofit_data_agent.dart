import 'package:dio/dio.dart';
import 'package:livescore/data/network/dataagent/data_agent.dart';
import 'package:livescore/data/network/live_score_api.dart';
import 'package:livescore/data/network/request/get_all_match_request.dart';
import 'package:livescore/data/network/response/get_all_match_response.dart';
import 'package:livescore/domain/model/all_match_vo.dart';

import '../custom_interceptor.dart';

class RetrofitDataAgentImpl extends DataAgent {
  late LiveScoreApi _liveScoreApi;

  RetrofitDataAgentImpl._internal() {
    final dio = Dio();
    dio.interceptors.add(
      CustomLogInterceptor(
        requestHeader: true,
        requestBody: true,
        responseHeader: false,
        responseBody: true,
      ),
    );
    _liveScoreApi = LiveScoreApi(dio);
  }

  static final RetrofitDataAgentImpl _singleton =
      RetrofitDataAgentImpl._internal();

  factory RetrofitDataAgentImpl() => _singleton;

  @override
  Future<GetAllMatchResponse> getAllMatch(GetAllMatchRequest request) {
    return _liveScoreApi.getAllMatch(request);
  }

  @override
  Future<GetAllMatchResponse> getUpCommingMatch(GetAllMatchRequest request) {
    return _liveScoreApi.getUpcommingMatch(request);
  }

  @override
  Future<List<AllMatchVo>> getLiveMatch() {
    return _liveScoreApi.getLiveMatch();
  }
}

import 'package:dio/dio.dart';
import 'package:livescore/data/network/api_constant.dart';
import 'package:livescore/data/network/dataagent/data_agent.dart';
import 'package:livescore/data/network/live_score_api.dart';
import 'package:livescore/data/network/new_api.dart';
import 'package:livescore/data/network/request/get_all_match_request.dart';
import 'package:livescore/data/network/response/get_all_match_response.dart';
import 'package:livescore/domain/model/all_match_vo.dart';
import 'package:livescore/domain/model/live_match_vo.dart';
import 'package:livescore/domain/model/new_vo.dart';

import '../custom_interceptor.dart';

class RetrofitDataAgentImpl extends DataAgent {
  late LiveScoreApi _liveScoreApi;
  late NewApi _newApi;

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
    _newApi = NewApi(dio);
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
  Future<List<LiveMatchVo>> getLiveMatch() {
    return _liveScoreApi.getLiveMatch();
  }

  @override
  Future<List<NewVo>?> getNews() {
    return _newApi
        .getNews(KEY_Q, KEY_API)
        .asStream()
        .map((response) => response.allMatches)
        .first;
  }
}

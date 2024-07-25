

import 'package:dio/dio.dart';
import 'package:livescore/data/network/api_constant.dart';
import 'package:livescore/data/network/response/get_new_response.dart';
import 'package:livescore/domain/model/all_match_vo.dart';
import 'package:retrofit/retrofit.dart';

part 'new_api.g.dart';

@RestApi(baseUrl: NEW_BASE_URL)
abstract class NewApi {
  factory NewApi(Dio dio) => _NewApi(dio);

  @GET(ENDPOINT_GET_NEWS)
  Future<GetNewResponse> getNews(
    @Query(PARAM_Q) String q,
    @Query(PARAM_APIKEY) String apiKey,
  );
}

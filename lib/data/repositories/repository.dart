import 'dart:io';

import 'package:news_app/data/helpers/network_cheker.dart';
import 'package:news_app/domain/entities/future_response.dart';
import 'package:news_app/domain/entities/news.dart';
import 'package:news_app/domain/repositories/repository.dart';

// class RepositoryImpl extends Repository{
//   final NetworkChecker checker;
//
//   RepositoryImpl(this.checker);
//
//   @override
//   Future<FutureResponse<NewsResponse>> getEverythingNews() async{
//     try{
//       if (!await checker.hasInternet) throw NO_INTERNET;
//       final params = {
//         'type': placeType.index + 1,
//         'sort': sortType.sortName,
//         'limit': count,
//         'offset': offset,
//       };
//
//       var response = await client.get(
//         PLACE_PATH,
//         queryParameters: params,
//         options: Options(
//           responseType: ResponseType.json,
//           headers: {HttpHeaders.authorizationHeader: 'Token $token'},
//         ),
//       );
//
//       if (response.statusCode != 200) throw '';
//
//       var places = <ClippedVisitPlace>[];
//       response.data['results']
//           .forEach((p) => places.add(ClippedVisitPlace.fromJson(p)));
//       return FutureResponse.success(places);
//
//     } catch(e){
//       return FutureResponse.fail(e.toString());
//     }
//
//   }
//
//   @override
//   Future<NewsResponse> getTopHeadlinesNews() {
//     // TODO: implement getTopHeadlinesNews
//     throw UnimplementedError();
//   }
//
// }
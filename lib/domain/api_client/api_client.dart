import 'dart:convert';
import 'dart:io';

import 'package:movie_app/domain/entity/celebrities/celebrities.dart';
import 'package:movie_app/domain/entity/movies/movie_details.dart';
import 'package:movie_app/domain/entity/movies/popular_movies_response.dart';
import 'package:movie_app/domain/entity/networks/networks_response.dart';
import 'package:movie_app/domain/entity/trailers/trailers.dart';
import 'package:movie_app/domain/entity/trending/trending_all_response.dart';
import 'package:movie_app/domain/entity/tv_show/tv_show_response.dart';

enum ApiClientExceptionType { Network, Auth, Other, SessionExpired }

class ApiClientException implements Exception {
  final ApiClientExceptionType type;
  ApiClientException({required this.type});
}

enum MediaType { Movie, TV }

extension MediaTypeAsString on MediaType {
  String asString() {
    switch (this) {
      case MediaType.Movie:
        return 'movie';
      case MediaType.TV:
        return 'tv';
    }
  }
}

class ApiClient {
  final _client = HttpClient();
  static const _host = 'https://api.themoviedb.org/3';
  static const _imageUrl = 'https://image.tmdb.org/t/p/w500';
  static const _apiKey = 'd4c84e3421bd8f3dbfde9bb34c421c1d';

  static String imageUrl(String path) => _imageUrl + path;

  Future<String> auth({
    required String username,
    required String password,
  }) async {
    final token = await _makeToken();
    final validatedToken = await _validateUser(
      username: username,
      password: password,
      requestToken: token,
    );
    final sessionId = await _makeSession(requestToken: validatedToken);
    return sessionId;
  }

Uri _makeUri(String path, [Map<String, dynamic>? parameters]) {
  final uri = Uri.parse('$_host$path');
  if (parameters != null) {
    final queryParameters = parameters.map((key, value) {
      if (value is int) {
        value = value.toString();
      } else if (value is! String && value is! Iterable) {
        value = value.toString(); 
      }
      return MapEntry(key, value is Iterable ? value.join(',') : value.toString());
    });
    return uri.replace(queryParameters: queryParameters);
  } else {
    return uri;
  }
}

  Future<T> _get<T>(
    String path,
    T Function(dynamic json) parser, [
    Map<String, dynamic>? parameters,
  ]) async {
    final url = _makeUri(path, parameters);
    try {
      final request = await _client.getUrl(url);
      final response = await request.close();

      final responseBody = await response.transform(utf8.decoder).join();
      final dynamic json = jsonDecode(responseBody);

      _validateResponse(response, json);

      final result = parser(json);
      return result;
    } on SocketException {
      throw ApiClientException(type: ApiClientExceptionType.Network);
    } on ApiClientException {
      rethrow;
    } catch (e) {
      throw ApiClientException(type: ApiClientExceptionType.Other);
    }
  }

  Future<T> _post<T>(
    String path,
    T Function(dynamic json) parser,
    Map<String, dynamic> bodyParameters, [
    Map<String, dynamic>? urlParameters,
  ]) async {
    try {
      final url = _makeUri(path, urlParameters);
      final request = await _client.postUrl(url);

      request.headers.contentType = ContentType.json;
      request.write(jsonEncode(bodyParameters));
      final response = await request.close();
      final dynamic json = (await response.jsonDecode());
      _validateResponse(response, json);

      final result = parser(json);
      return result;
    } on SocketException {
      throw ApiClientException(type: ApiClientExceptionType.Network);
    } on ApiClientException {
      rethrow;
    } catch (_) {
      throw ApiClientException(type: ApiClientExceptionType.Other);
    }
  }

  Future<String> _makeToken() async {
    final parser = (dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final token = jsonMap['request_token'] as String;
      return token;
    };
    final result = _get('/authentication/token/new', parser, <String, dynamic>{
      'api_key': _apiKey,
    });
    return result;
  }

  Future<TvShowResponse> popularTvShows(String local, int page) async {
    final parser = (dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = TvShowResponse.fromJson(jsonMap);
      return response;
    };
    final result = _get('/tv/popular', parser, <String, dynamic>{
      'api_key': _apiKey,
      'language': local,
      'page': page.toString(),
    });
    return result;
  }

  Future<TrendingAllResponse> trendingMoviesAndShows(
    String local, {
    required String time_window,
  }) async {
    final parser = (dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = TrendingAllResponse.fromJson(jsonMap);
      return response;
    };
    final result = _get('/trending/all/$time_window', parser, <String, dynamic>{
      'api_key': _apiKey,
      'language': local,
    });
    return result;
  }

  Future<CelebritiesResponse> popularCelebrities(
    String local, {
    required String time_window,
  }) async {
    final parser = (dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = CelebritiesResponse.fromJson(jsonMap);
      return response;
    };
    final result = _get(
      '/trending/person/$time_window',
      parser,
      <String, dynamic>{'api_key': _apiKey, 'language': local},
    );
    return result;
  }

  Future<NetworksResponse> popularNetwork({required int network_id}) async {
    final parser = (dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = NetworksResponse.fromJson(jsonMap);
      return response;
    };
    final result = _get('/network/$network_id', parser, <String, dynamic>{
      'api_key': _apiKey,
    });
    return result;
  }

  Future<TrailersResponse> popularTrailers(String local, int page) async {
    final parser = (dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = TrailersResponse.fromJson(jsonMap);
      return response;
    };
    final result = _get('/movie/upcoming', parser, <String, dynamic>{
      'api_key': _apiKey,
      'language': local,
      'page': page,
    });
    return result;
  }

  Future<int> getAccountInfo(String sessionId) async {
    final parser = (dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final result = jsonMap['id'] as int;
      return result;
    };
    final result = _get('/account', parser, <String, dynamic>{
      'api_key': _apiKey,
      'session_id': sessionId,
    });
    return result;
  }

  Future<PopularMoviesResponse> popularMovies(int page, String local) async {
    final parser = (dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = PopularMoviesResponse.fromJson(jsonMap);
      return response;
    };
    final result = _get('/movie/popular', parser, <String, dynamic>{
      'api_key': _apiKey,
      'language': local,
      'page': page.toString(),
    });
    return result;
  }

  Future<PopularMoviesResponse> searchMovie(
    int page,
    String local,
    String query,
  ) async {
    final parser = (dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = PopularMoviesResponse.fromJson(jsonMap);
      return response;
    };
    final result = _get('/search/movie', parser, <String, dynamic>{
      'api_key': _apiKey,
      'language': local,
      'page': page.toString(),
      'query': query,
      'include_adult': true.toString(),
    });
    return result;
  }

  Future<MovieDetails> movieDetails(int movieId, String local) async {
    final parser = (dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final response = MovieDetails.fromJson(jsonMap);
      return response;
    };
    final result = _get('/movie/$movieId', parser, <String, dynamic>{
      'append_to_response': 'credits,videos',
      'api_key': _apiKey,
      'language': local,
    });
    return result;
  }

  Future<bool> isMovieFavorite(int movieId, String sessionId) async {
    final parser = (dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final result = jsonMap['favorite'] as bool;
      return result;
    };
    final result = _get(
      '/movie/$movieId/account_states',
      parser,
      <String, dynamic>{'api_key': _apiKey, 'session_id': sessionId},
    );
    return result;
  }

  Future<int> markedAsFavorite({
    required int accountId,
    required String sessionId,
    required MediaType mediaType,
    required int mediaId,
    required bool isFavorite,
  }) async {
    final parameters = <String, dynamic>{
      'media_type': mediaType.asString(),
      'media_id': mediaId,
      'favorite': isFavorite,
    };
    parser(dynamic json) {
      return 1;
    }

    final result = _post(
      '/account/$accountId/favorite',
      parser,
      parameters,
      <String, dynamic>{'api_key': _apiKey, 'session_id': sessionId},
    );
    return result;
  }

  Future<String> _validateUser({
    required String username,
    required String password,
    required String requestToken,
  }) async {
    final parser = (dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final token = jsonMap['request_token'] as String;
      return token;
    };
    final parameters = <String, dynamic>{
      'username': username,
      'password': password,
      'request_token': requestToken,
    };
    final result = _post(
      '/authentication/token/validate_with_login',
      parser,
      parameters,
      <String, dynamic>{'api_key': _apiKey},
    );
    return result;
  }

  Future<String> _makeSession({required String requestToken}) async {
    final parser = (dynamic json) {
      final jsonMap = json as Map<String, dynamic>;
      final sessionId = jsonMap['session_id'] as String;
      return sessionId;
    };
    final parameters = <String, dynamic>{'request_token': requestToken};
    final result = _post(
      '/authentication/session/new',
      parser,
      parameters,
      <String, dynamic>{'api_key': _apiKey},
    );
    return result;
  }
}

void _validateResponse(HttpClientResponse response, dynamic json) {
  if (response.statusCode == 401) {
    final status = json['status_code'];
    final code = status is int ? status : 0;
    if (code == 30) {
      throw ApiClientException(type: ApiClientExceptionType.Auth);
    } else if (code == 3) {
      throw ApiClientException(type: ApiClientExceptionType.SessionExpired);
    } else {
      throw ApiClientException(type: ApiClientExceptionType.Other);
    }
  }
}

extension HttpClientResponseJsonDecode on HttpClientResponse {
  Future<dynamic> jsonDecode() async {
    return transform(utf8.decoder)
        .toList()
        .then((value) => value.join())
        .then<dynamic>((v) => json.decode(v));
  }
}

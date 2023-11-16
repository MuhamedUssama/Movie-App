import 'package:movie_app/data/model/base_response.dart';

import 'Genres.dart';

/// genres : [{"id":28,"name":"Action"},{"id":12,"name":"Abenteuer"},{"id":16,"name":"Animation"},{"id":35,"name":"Komödie"},{"id":80,"name":"Krimi"},{"id":99,"name":"Dokumentarfilm"},{"id":18,"name":"Drama"},{"id":10751,"name":"Familie"},{"id":14,"name":"Fantasy"},{"id":36,"name":"Historie"},{"id":27,"name":"Horror"},{"id":10402,"name":"Musik"},{"id":9648,"name":"Mystery"},{"id":10749,"name":"Liebesfilm"},{"id":878,"name":"Science Fiction"},{"id":10770,"name":"TV-Film"},{"id":53,"name":"Thriller"},{"id":10752,"name":"Kriegsfilm"},{"id":37,"name":"Western"}]

class CategoriesResponse extends ErrorResponse{
  CategoriesResponse({
      this.genres,});

  CategoriesResponse.fromJson(dynamic json) {
    message = json["status_message"];
    if (json['genres'] != null) {
      genres = [];
      json['genres'].forEach((v) {
        genres?.add(CategoryGenres.fromJson(v));
      });
    }
  }
  List<CategoryGenres>? genres;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (genres != null) {
      map['genres'] = genres?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}
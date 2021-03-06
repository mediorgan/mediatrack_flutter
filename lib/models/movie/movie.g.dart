// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) {
  return Movie(
    json['adult'] as bool,
    json['backdrop_path'] as String,
    json['belongs_to_collection'] == null
        ? null
        : Collection.fromJson(
            json['belongs_to_collection'] as Map<String, dynamic>),
    json['budget'] as int,
    (json['genres'] as List)
        ?.map((e) =>
            e == null ? null : Genres.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['homepage'] as String,
    json['id'] as int,
    json['imdb_id'] as String,
    json['original_language'] as String,
    json['original_title'] as String,
    json['overview'] as String,
    (json['popularity'] as num)?.toDouble(),
    json['poster_path'] as String,
    (json['production_companies'] as List)
        ?.map((e) => e == null
            ? null
            : ProductionCompanies.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['production_countries'] as List)
        ?.map((e) => e == null
            ? null
            : ProductionCountries.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['release_date'] as String,
    json['revenue'] as int,
    json['runtime'] as int,
    (json['spoken_languages'] as List)
        ?.map((e) => e == null
            ? null
            : SpokenLanguages.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['status'] as String,
    json['tagline'] as String,
    json['title'] as String,
    json['video'] as bool,
    (json['vote_average'] as num)?.toDouble(),
    json['vote_count'] as int,
    json['media_type'] as String,
    json['release_dates'] == null
        ? null
        : ReleaseDatesParent.fromJson(
            json['release_dates'] as Map<String, dynamic>),
    json['similar_movies'] == null
        ? null
        : SimilarMovies.fromJson(
            json['similar_movies'] as Map<String, dynamic>),
    json['recommendations'] == null
        ? null
        : Recommendations.fromJson(
            json['recommendations'] as Map<String, dynamic>),
  )..credits = json['credits'] == null
      ? null
      : Credits.fromJson(json['credits'] as Map<String, dynamic>);
}

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'adult': instance.adult,
      'backdrop_path': instance.backdropPath,
      'belongs_to_collection': instance.belongsToCollection?.toJson(),
      'budget': instance.budget,
      'genres': instance.genres?.map((e) => e?.toJson())?.toList(),
      'homepage': instance.homepage,
      'id': instance.id,
      'imdb_id': instance.imdbId,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'poster_path': instance.posterPath,
      'production_companies':
          instance.productionCompanies?.map((e) => e?.toJson())?.toList(),
      'production_countries':
          instance.productionCountries?.map((e) => e?.toJson())?.toList(),
      'release_date': instance.releaseDate,
      'revenue': instance.revenue,
      'runtime': instance.runtime,
      'spoken_languages':
          instance.spokenLanguages?.map((e) => e?.toJson())?.toList(),
      'status': instance.status,
      'tagline': instance.tagline,
      'title': instance.title,
      'video': instance.video,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'media_type': instance.mediaType,
      'release_dates': instance.releaseDates?.toJson(),
      'similar_movies': instance.similarMovies?.toJson(),
      'recommendations': instance.recommendations?.toJson(),
      'credits': instance.credits?.toJson(),
    };

Genres _$GenresFromJson(Map<String, dynamic> json) {
  return Genres(
    json['id'] as int,
    json['name'] as String,
  );
}

Map<String, dynamic> _$GenresToJson(Genres instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

ProductionCompanies _$ProductionCompaniesFromJson(Map<String, dynamic> json) {
  return ProductionCompanies(
    json['name'] as String,
    json['id'] as int,
    json['logo_path'] as String,
    json['origin_country'] as String,
  );
}

Map<String, dynamic> _$ProductionCompaniesToJson(
        ProductionCompanies instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'logo_path': instance.logoPath,
      'origin_country': instance.originCountry,
    };

ProductionCountries _$ProductionCountriesFromJson(Map<String, dynamic> json) {
  return ProductionCountries(
    json['iso_3166_1'] as String,
    json['name'] as String,
  );
}

Map<String, dynamic> _$ProductionCountriesToJson(
        ProductionCountries instance) =>
    <String, dynamic>{
      'iso_3166_1': instance.iso_3166_1,
      'name': instance.name,
    };

SpokenLanguages _$SpokenLanguagesFromJson(Map<String, dynamic> json) {
  return SpokenLanguages(
    json['iso_639_1'] as String,
    json['name'] as String,
  );
}

Map<String, dynamic> _$SpokenLanguagesToJson(SpokenLanguages instance) =>
    <String, dynamic>{
      'iso_639_1': instance.iso_639_1,
      'name': instance.name,
    };

ReleaseDatesParent _$ReleaseDatesParentFromJson(Map<String, dynamic> json) {
  return ReleaseDatesParent(
    (json['results'] as List)
        ?.map((e) => e == null
            ? null
            : ReleaseDateResults.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ReleaseDatesParentToJson(ReleaseDatesParent instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

ReleaseDateResults _$ReleaseDateResultsFromJson(Map<String, dynamic> json) {
  return ReleaseDateResults(
    json['iso_3166_1'] as String,
    (json['release_dates'] as List)
        ?.map((e) =>
            e == null ? null : ReleaseDates.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ReleaseDateResultsToJson(ReleaseDateResults instance) =>
    <String, dynamic>{
      'iso_3166_1': instance.iso_3166_1,
      'release_dates': instance.releaseDates,
    };

ReleaseDates _$ReleaseDatesFromJson(Map<String, dynamic> json) {
  return ReleaseDates(
    json['certification'] as String,
    json['iso_639_1'] as String,
    json['note'] as String,
    json['release_date'] as String,
    json['type'] as int,
  );
}

Map<String, dynamic> _$ReleaseDatesToJson(ReleaseDates instance) =>
    <String, dynamic>{
      'certification': instance.certification,
      'iso_639_1': instance.iso_639_1,
      'note': instance.note,
      'release_date': instance.releaseDate,
      'type': instance.type,
    };

SimilarMovies _$SimilarMoviesFromJson(Map<String, dynamic> json) {
  return SimilarMovies(
    json['page'] as int,
    (json['results'] as List)
        ?.map(
            (e) => e == null ? null : Movie.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['total_pages'] as int,
    json['total_results'] as int,
  );
}

Map<String, dynamic> _$SimilarMoviesToJson(SimilarMovies instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };

Recommendations _$RecommendationsFromJson(Map<String, dynamic> json) {
  return Recommendations(
    json['page'] as int,
    (json['results'] as List)
        ?.map(
            (e) => e == null ? null : Movie.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['total_pages'] as int,
    json['total_results'] as int,
  );
}

Map<String, dynamic> _$RecommendationsToJson(Recommendations instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };

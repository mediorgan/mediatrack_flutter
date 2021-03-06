// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tvshow.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TVShow _$TVShowFromJson(Map<String, dynamic> json) {
  return TVShow(
    json['backdrop_path'] as String,
    (json['created_by'] as List)
        ?.map((e) =>
            e == null ? null : CreatedBy.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['episode_run_time'] as List)?.map((e) => e as int)?.toList(),
    json['first_air_date'] as String,
    (json['genres'] as List)
        ?.map((e) =>
            e == null ? null : Genres.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['homepage'] as String,
    json['id'] as int,
    json['in_production'] as bool,
    (json['languages'] as List)?.map((e) => e as String)?.toList(),
    json['last_air_date'] as String,
    json['last_episode_to_air'] == null
        ? null
        : Episode.fromJson(json['last_episode_to_air'] as Map<String, dynamic>),
    json['name'] as String,
    json['next_episode_to_air'] == null
        ? null
        : Episode.fromJson(json['next_episode_to_air'] as Map<String, dynamic>),
    (json['networks'] as List)
        ?.map((e) =>
            e == null ? null : Networks.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['number_of_episodes'] as int,
    json['number_of_seasons'] as int,
    json['original_name'] as String,
    (json['origin_country'] as List)?.map((e) => e as String)?.toList(),
    json['original_language'] as String,
    json['overview'] as String,
    (json['popularity'] as num)?.toDouble(),
    json['poster_path'] as String,
    (json['production_companies'] as List)
        ?.map((e) => e == null
            ? null
            : ProductionCompanies.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['seasons'] as List)
        ?.map((e) =>
            e == null ? null : Season.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['status'] as String,
    json['type'] as String,
    (json['vote_average'] as num)?.toDouble(),
    json['vote_count'] as int,
    json['media_type'] as String,
    json['similar'] == null
        ? null
        : SimilarTVShows.fromJson(json['similar'] as Map<String, dynamic>),
    json['recommendations'] == null
        ? null
        : RecommendationsTV.fromJson(
            json['recommendations'] as Map<String, dynamic>),
    json['content_ratings'] == null
        ? null
        : ContentRatings.fromJson(
            json['content_ratings'] as Map<String, dynamic>),
    json['external_ids'] == null
        ? null
        : ExternalIds.fromJson(json['external_ids'] as Map<String, dynamic>),
    json['credits'] == null
        ? null
        : Credits.fromJson(json['credits'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TVShowToJson(TVShow instance) => <String, dynamic>{
      'backdrop_path': instance.backdropPath,
      'created_by': instance.createdBy?.map((e) => e?.toJson())?.toList(),
      'episode_run_time': instance.episodeRunTime,
      'first_air_date': instance.firstAirDate,
      'genres': instance.genres?.map((e) => e?.toJson())?.toList(),
      'homepage': instance.homepage,
      'id': instance.id,
      'in_production': instance.inProduction,
      'languages': instance.languages,
      'last_air_date': instance.lastAirDate,
      'last_episode_to_air': instance.lastEpisodeToAir?.toJson(),
      'name': instance.name,
      'next_episode_to_air': instance.nextEpisodeToAir?.toJson(),
      'networks': instance.networks?.map((e) => e?.toJson())?.toList(),
      'number_of_episodes': instance.numberOfEpisodes,
      'number_of_seasons': instance.numberOfSeasons,
      'origin_country': instance.originCountry,
      'original_language': instance.originalLanguage,
      'original_name': instance.originalName,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'poster_path': instance.posterPath,
      'production_companies':
          instance.productionCompanies?.map((e) => e?.toJson())?.toList(),
      'seasons': instance.seasons?.map((e) => e?.toJson())?.toList(),
      'status': instance.status,
      'type': instance.type,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'media_type': instance.mediaType,
      'similar': instance.similar?.toJson(),
      'recommendations': instance.recommendations?.toJson(),
      'content_ratings': instance.contentRatings?.toJson(),
      'external_ids': instance.externalIds?.toJson(),
      'credits': instance.credits?.toJson(),
    };

CreatedBy _$CreatedByFromJson(Map<String, dynamic> json) {
  return CreatedBy(
    json['name'] as String,
    json['id'] as int,
    json['credit_id'] as String,
    json['gender'] as int,
    json['profile_path'] as String,
  );
}

Map<String, dynamic> _$CreatedByToJson(CreatedBy instance) => <String, dynamic>{
      'id': instance.id,
      'credit_id': instance.creditId,
      'name': instance.name,
      'gender': instance.gender,
      'profile_path': instance.profilePath,
    };

Networks _$NetworksFromJson(Map<String, dynamic> json) {
  return Networks(
    json['name'] as String,
    json['id'] as int,
    json['origin_country'] as String,
    json['logo_path'] as String,
  );
}

Map<String, dynamic> _$NetworksToJson(Networks instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'logo_path': instance.logoPath,
      'origin_country': instance.originCountry,
    };

SimilarTVShows _$SimilarTVShowsFromJson(Map<String, dynamic> json) {
  return SimilarTVShows(
    json['page'] as int,
    (json['results'] as List)
        ?.map((e) =>
            e == null ? null : TVShow.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['total_pages'] as int,
    json['total_results'] as int,
  );
}

Map<String, dynamic> _$SimilarTVShowsToJson(SimilarTVShows instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };

RecommendationsTV _$RecommendationsTVFromJson(Map<String, dynamic> json) {
  return RecommendationsTV(
    json['page'] as int,
    (json['results'] as List)
        ?.map((e) =>
            e == null ? null : TVShow.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['total_pages'] as int,
    json['total_results'] as int,
  );
}

Map<String, dynamic> _$RecommendationsTVToJson(RecommendationsTV instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };

ContentRatings _$ContentRatingsFromJson(Map<String, dynamic> json) {
  return ContentRatings(
    (json['results'] as List)
        ?.map((e) =>
            e == null ? null : Rating.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['id'] as int,
  );
}

Map<String, dynamic> _$ContentRatingsToJson(ContentRatings instance) =>
    <String, dynamic>{
      'results': instance.results,
      'id': instance.id,
    };

Rating _$RatingFromJson(Map<String, dynamic> json) {
  return Rating(
    json['iso_3166_1'] as String,
    json['rating'] as String,
  );
}

Map<String, dynamic> _$RatingToJson(Rating instance) => <String, dynamic>{
      'iso_3166_1': instance.iso_3166_1,
      'rating': instance.rating,
    };

ExternalIds _$ExternalIdsFromJson(Map<String, dynamic> json) {
  return ExternalIds(
    json['imdb_id'] as String,
    json['freebase_mid'] as String,
    json['freebase_id'] as String,
    json['tvdb_id'] as int,
    json['tvrage_id'] as int,
    json['facebook_id'] as String,
    json['instagram_id'] as String,
    json['twitter_id'] as String,
    json['id'] as int,
  );
}

Map<String, dynamic> _$ExternalIdsToJson(ExternalIds instance) =>
    <String, dynamic>{
      'imdb_id': instance.imdbId,
      'freebase_mid': instance.freebaseMid,
      'freebase_id': instance.freebaseId,
      'tvdb_id': instance.tvdbId,
      'tvrage_id': instance.tvrageId,
      'facebook_id': instance.facebookId,
      'instagram_id': instance.instagramId,
      'twitter_id': instance.twitterId,
      'id': instance.id,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Show _$ShowFromJson(Map<String, dynamic> json) {
  return Show(
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
        : LastEpisodeToAir.fromJson(
            json['last_episode_to_air'] as Map<String, dynamic>),
    json['name'] as String,
    json['next_episode_to_air'] as String,
    (json['networks'] as List)
        ?.map((e) =>
            e == null ? null : Networks.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['number_of_episodes'] as int,
    json['number_of_seasons'] as int,
    json['original_name'] as String,
    (json['origin_country'] as List)?.map((e) => e as String)?.toList(),
    json['origin_language'] as String,
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
            e == null ? null : Seasons.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['status'] as String,
    json['type'] as String,
    (json['vote_average'] as num)?.toDouble(),
    json['vote_count'] as int,
    json['media_type'] as String,
  );
}

Map<String, dynamic> _$ShowToJson(Show instance) => <String, dynamic>{
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
      'next_episode_to_air': instance.nextEpisodeToAir,
      'networks': instance.networks?.map((e) => e?.toJson())?.toList(),
      'number_of_episodes': instance.numberOfEpisodes,
      'number_of_seasons': instance.numberOfSeasons,
      'origin_country': instance.originCountry,
      'origin_language': instance.originLanguage,
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

LastEpisodeToAir _$LastEpisodeToAirFromJson(Map<String, dynamic> json) {
  return LastEpisodeToAir(
    json['id'] as int,
    json['name'] as String,
    json['vote_count'] as int,
    (json['vote_average'] as num)?.toDouble(),
    json['overview'] as String,
    json['air_date'] as String,
    json['episode_number'] as int,
    json['production_code'] as String,
    json['season_number'] as int,
    json['show_id'] as int,
    json['still_path'] as String,
  );
}

Map<String, dynamic> _$LastEpisodeToAirToJson(LastEpisodeToAir instance) =>
    <String, dynamic>{
      'air_date': instance.airDate,
      'episode_number': instance.episodeNumber,
      'id': instance.id,
      'name': instance.name,
      'overview': instance.overview,
      'production_code': instance.productionCode,
      'season_number': instance.seasonNumber,
      'show_id': instance.showId,
      'still_path': instance.stillPath,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
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

Seasons _$SeasonsFromJson(Map<String, dynamic> json) {
  return Seasons(
    json['air_date'] as String,
    json['episode_count'] as int,
    json['id'] as int,
    json['name'] as String,
    json['overview'] as String,
    json['poster_path'] as String,
    json['season_number'] as int,
  );
}

Map<String, dynamic> _$SeasonsToJson(Seasons instance) => <String, dynamic>{
      'air_date': instance.airDate,
      'episode_count': instance.episodeCount,
      'id': instance.id,
      'name': instance.name,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
      'season_number': instance.seasonNumber,
    };
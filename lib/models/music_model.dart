class MusicModel {
  final String trackId;
  final String lyrics;
  final String name;
  final String rating;
  final String instrumental;
  final String explicit;
  final String hasLyrcis;
  final String hasSubs;
  final String hasSync;
  final String favs;
  final String albumId;
  final String albumName;
  final String artistId;
  final String artistName;
  final String url;
  final String lyricUrl;
  final String time;

  MusicModel(
      {this.trackId,
      this.lyrics,
      this.name,
      this.rating,
      this.instrumental,
      this.explicit,
      this.hasLyrcis,
      this.hasSubs,
      this.hasSync,
      this.favs,
      this.albumId,
      this.albumName,
      this.artistId,
      this.artistName,
      this.url,
      this.lyricUrl,
      this.time});

  factory MusicModel.fromJson(Map<String, dynamic> json) {
    return MusicModel(
      trackId: json['track_id']??'demons',
      name: json['track_name']??'demons',
      rating: json['track_rating'],
      instrumental: json['instrumental'],
      explicit: json['explicit'],
      hasLyrcis: json['has_lyrics'],
      hasSubs: json['has_subtitles'],
      hasSync: json['has_richsync'],
      favs: json['nam_favourite'],
      albumId: json['album_id'],
      albumName: json['album_name'],
      url: json['track_share_url'],
      lyricUrl: json['track_edit_url']
    );
  }
}

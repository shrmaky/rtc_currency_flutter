class PexelClass {
  int page;
  int perPage;
  int totalResults;
  String url;
  String nextPage;
  List<Photos> photos;

  PexelClass(
      {this.page,
      this.perPage,
      this.totalResults,
      this.url,
      this.nextPage,
      this.photos});

  PexelClass.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    perPage = json['per_page'];
    totalResults = json['total_results'];
    url = json['url'];
    nextPage = json['next_page'];
    if (json['photos'] != null) {
      photos = new List<Photos>();
      json['photos'].forEach((v) {
        photos.add(new Photos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['per_page'] = this.perPage;
    data['total_results'] = this.totalResults;
    data['url'] = this.url;
    data['next_page'] = this.nextPage;
    if (this.photos != null) {
      data['photos'] = this.photos.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Photos {
  int width;
  int height;
  String url;
  String photographer;
  Src src;

  Photos({this.width, this.height, this.url, this.photographer, this.src});

  Photos.fromJson(Map<String, dynamic> json) {
    width = json['width'];
    height = json['height'];
    url = json['url'];
    photographer = json['photographer'];
    src = json['src'] != null ? new Src.fromJson(json['src']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['width'] = this.width;
    data['height'] = this.height;
    data['url'] = this.url;
    data['photographer'] = this.photographer;
    if (this.src != null) {
      data['src'] = this.src.toJson();
    }
    return data;
  }
}

class Src {
  String original;
  String large;
  String large2x;
  String medium;
  String small;
  String portrait;
  String landscape;
  String tiny;

  Src(
      {this.original,
      this.large,
      this.large2x,
      this.medium,
      this.small,
      this.portrait,
      this.landscape,
      this.tiny});

  Src.fromJson(Map<String, dynamic> json) {
    original = json['original'];
    large = json['large'];
    large2x = json['large2x'];
    medium = json['medium'];
    small = json['small'];
    portrait = json['portrait'];
    landscape = json['landscape'];
    tiny = json['tiny'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['original'] = this.original;
    data['large'] = this.large;
    data['large2x'] = this.large2x;
    data['medium'] = this.medium;
    data['small'] = this.small;
    data['portrait'] = this.portrait;
    data['landscape'] = this.landscape;
    data['tiny'] = this.tiny;
    return data;
  }
}
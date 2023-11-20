class Wallpaper_model {
  late String photographer;
  late int photographer_id;
  late String photographer_url;
  late Srcmodel src;

  Wallpaper_model(
      {required this.photographer,
      required this.photographer_id,
      required this.photographer_url,
      required this.src});

  factory Wallpaper_model.fromMap(Map<String, dynamic> jsonData) {
    return Wallpaper_model(
      photographer: jsonData["photographer"] ?? "",
      photographer_id: jsonData["photographer_id"] ?? 0,
      photographer_url: jsonData["photographer_url"] ?? "",
      src: Srcmodel.fromMap(jsonData["src"] ?? {}),
    );
  }
}

class Srcmodel {
  late String original;
  late String portraite;
  late String small;

  Srcmodel(
      {required this.original, required this.portraite, required this.small});

  factory Srcmodel.fromMap(Map<String, dynamic> jsonData) {
    return Srcmodel(
      original: jsonData["original"] ?? "",
      portraite: jsonData["portraite"] ?? "",
      small: jsonData["small"] ?? "",
    );
  }
}

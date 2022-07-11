class DogImage {
  int? fileSizeBytes;
  String? url;

  DogImage({
    this.fileSizeBytes,
    this.url,
  });

  factory DogImage.fromMap(Map<String, dynamic> json) => DogImage(
        fileSizeBytes: json["fileSizeBytes"],
        url: json["url"],
      );

  Map<String, dynamic> toMap() {
    return {
      "fileSizeBytes": fileSizeBytes,
      "url": url,
    };
  }
}

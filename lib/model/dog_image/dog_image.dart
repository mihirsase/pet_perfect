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
}

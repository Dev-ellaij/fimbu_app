// ignore: unused_import
import 'package:timbu_app/model/photo_model.dart';

class Photo {
  Photo({
    required this.modelName,
    required this.modelId,
    required this.organizationId,
    required this.filename,
    required this.url,
  });

  final String? modelName;
  final String? modelId;
  final String? organizationId;
  final String? filename;
  final String url;

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      modelName: json["model_name"],
      modelId: json["model_id"],
      organizationId: json["organization_id"],
      filename: json["filename"],
      url: json["url"],
    );
  }

  Map<String, dynamic> toJson() => {
        "model_name": modelName,
        "model_id": modelId,
        "organization_id": organizationId,
        "filename": filename,
        "url": url,
      };
}

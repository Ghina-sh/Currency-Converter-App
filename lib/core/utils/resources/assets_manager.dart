// ignore_for_file: constant_identifier_names

const String IMAGE_PATH = "assets/images";
const String JSON_PATH = "assets/json";
const String ICON_PATH = "assets/icons";
const String FILE_PATH = "assets/file";

class ImageAssets {
  static const String logo = "$IMAGE_PATH/logo.png";

  static String countryImage(String countryCodes) =>
      "https://flagcdn.com/20x15/$countryCodes.png";
}

class IconAssets {}

class JsonAssets {}

class FileAssets {}

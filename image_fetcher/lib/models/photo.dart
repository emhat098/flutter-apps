// ignore_for_file: file_names

/// Photo class for define the stucture of photo model.
///
/// Example
/// ```json
/// "id": "2",
/// "author": "Alejandro Escamilla",
/// "width": 5000,
/// "height": 3333,
/// "url": "https://unsplash.com/photos/N7XodRrbzS0",
/// "download_url": "https://picsum.photos/id/2/5000/3333"
/// ```
class Photo {
  String id;
  String author;
  double width;
  double height;
  String url;
  String downloadUrl;
  Photo(this.id, this.author, this.width, this.height, this.url, this.downloadUrl);
}
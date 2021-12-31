import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/cast_info_model.dart';
import '../models/error_model.dart';
import '../models/book_model.dart';
import '../models/tv_model.dart';

class FetchCastInfoById {
  Future<List<dynamic>> getCastDetails(String id) async {
    CastPersonalInfo prinfo;
    SocialMediaInfo socialMedia;
    ImageBackdropList backdrops;
    BookModelList books;
    TvModelList tv;
    var response = await http.get(Uri.parse('base_url/person/$id'));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      prinfo = CastPersonalInfo.fromJson(data['data']);
      socialMedia = SocialMediaInfo.fromJson(data['socialmedia']);
      backdrops = ImageBackdropList.fromJson(data['images']['profiles']);

      // books = BookModelList.fromJson(data['books']['cast']);
      tv = TvModelList.fromJson(data['tv']['cast']);

      return [
        prinfo,
        socialMedia,
        backdrops.backdrops,
        [],
        [],
      ];
    } else {
      throw FetchDataError('Failure to fetch data');
    }
  }
}

import 'package:news_app/core/config.dart';
import 'package:news_app/data/api/core_api_client.dart';

class RemoteResource {
  Future getPostsFromApi() async {
    return await CoreApiClient().getData(endpoint: Config.posts);
  }
}

import 'package:elastic_client/elastic_client.dart';
import 'package:flutter_food_delivery_v1/model/foodmodel.dart';

class ElasticService {
  late Client client;
  // final transport = HttpTransport(
  //     url: 'https://restaurant.es.asia-southeast1.gcp.elastic-cloud.com:9243/',
  //     authorization: basicAuthorization(
  //         dotenv.env["ELASTICUSERNAME"].toString(),
  //         dotenv.env["ELASTICPASSWORD"].toString()));
  final transport = HttpTransport(url: 'http://10.0.2.2:9292/');

  Future<void> updateDocument(List<FoodModel> food) async {
    client = Client(transport);
    for (var item in food) {
      Map<String, dynamic> map = item.toMap();
      map.removeWhere((key, value) => key == "_id");
      await client.updateDoc(
          index: "foods", type: '_doc', id: item.foodID, doc: map);
    }
  }

  Future<SearchResult> getRecord(String query) async {
    client = Client(transport);
    final rs = await client.search(
        index: "foods",
        query: {
          'match_phrase_prefix': {
            "FoodName": {
              'query': query,
            }
          },
        },
        source: true);
    return rs;
  }
}

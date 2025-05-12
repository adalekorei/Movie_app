import 'package:flutter/material.dart';
import 'package:movie_app/domain/api_client/api_client.dart';
import 'package:movie_app/domain/entity/networks/networks_response.dart';

class NetworksModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final _networks = <NetworksResponse>[];
  List<NetworksResponse> get networks => List.unmodifiable(_networks);

  // List of networks is not possible to get from this API, so cycle below is forced action.
  Future<void> loadNetworks() async {
    _networks.clear();
    for (var i = 1; i <= 20; i++) {
      try {
        final network = await _apiClient.popularNetwork(network_id: i);
        _networks.add(network);
      } catch (e) {
        debugPrint('Network $i not found: $e');
      }
    }
    notifyListeners();
  }

}

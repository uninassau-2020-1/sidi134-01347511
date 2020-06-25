import 'package:mobx/mobx.dart';
import 'package:cep/store/http_repository.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'map_store.g.dart';

class MapStore = _MapStoreBase with _$MapStore;
final MapStore mapStore = MapStore();

abstract class _MapStoreBase extends HttpRepository with Store {
  @observable
  LatLng posicao;
  @observable
  String cep;

  @action
  Future<LatLng> buscarCepMap(String cep) async {
    final response = await super.get(
        path:
            "https://maps.googleapis.com/maps/api/geocode/json?address=$cep&key=XXXXXXXKEY_API_GOOGLEXXXXXXXX",
        passToken: true);
    double lat = response["results"][0]["geometry"]["location"]["lat"];
    double lng = response["results"][0]["geometry"]["location"]["lng"];
    posicao = LatLng(lat, lng);
    return posicao;
  }
}

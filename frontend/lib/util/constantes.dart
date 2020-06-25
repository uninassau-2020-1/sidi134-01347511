import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

const AssetImage imagemBackground =
    AssetImage("imagens/background.jpg");

const devConfig = {
  'apiUrl': 'http://192.168.0.74:8097',
 // 'apiUrl': 'https://arvore.core.staging.orubetecnologia.com.br',
};

const productionConfig = {
  'apiUrl': 'http://192.168.0.74:8097',
 // 'apiUrl': 'https://arvore.core.staging.orubetecnologia.com.br',
};

final environment = kReleaseMode ? productionConfig : devConfig;

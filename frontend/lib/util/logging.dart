import 'package:colorize/colorize.dart';

class Logger {
  static request(String mensagem) {
    color(
      mensagem,
      front: Styles.LIGHT_BLUE,
      isBold: true,
      isItalic: true,
    );
  }

  static sucess(String mensagem) {
    color(
      mensagem,
      front: Styles.LIGHT_GREEN,
      isBold: true,
      isItalic: true,
    );
  }

  static info(String mensagem) {
    color(
      mensagem,
      front: Styles.WHITE,
      back: Styles.BG_DARK_GRAY,
      isBold: true,
      isItalic: true,
    );
  }

  static error(String mensagem) {
    color(
      mensagem,
      front: Styles.WHITE,
      back: Styles.BG_RED,
      isBold: true,
      isItalic: true,
    );
  }

  static event(String mensagem) {
    color(
      mensagem,
      front: Styles.LIGHT_GRAY,
      isBold: true,
      isItalic: true,
    );
  }
}

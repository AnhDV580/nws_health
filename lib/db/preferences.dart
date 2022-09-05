import 'package:hive/hive.dart';

class Preferences {
  static const _preferencesBox = '_preferencesBox';

  static const _token = '_token';
  static const _nobiToken = '_nobiToken';
  static const _accessToken = '_accessToken';
  static const _openOtsukaImmediately = '_openOtsukaImmediately';
  static const _openProductList = '_open_openProductList';
  static const _openDialogVideoAlert = '_openDialogVideoAlert';
  static const _openStatusProductListAlert = '_openStatusProductListAlert';
  static const isAsyncDevice = 'isAsyncDevice';
  static const mailAsync = 'mailAsync';

  static const _user = '_user';

  final Box<dynamic> _box;
  Preferences._(this._box);

  static Future<Preferences> getInstance() async {
    final box = await Hive.openBox<dynamic>(_preferencesBox);
    return Preferences._(box);
  }
}

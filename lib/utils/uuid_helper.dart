import 'package:uuid/uuid.dart';

/// Wrapper around the uuid package so you can mock it in tests.
class UuidHelper {
  static final _uuid = const Uuid();
  static String v4() => _uuid.v4();
}

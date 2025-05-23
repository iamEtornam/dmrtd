// Created by Crt Vavros, copyright © 2022 ZeroPass. All rights reserved.
import 'dart:math';
import 'dart:typed_data';

class Utils {
  static const bool isProfileMode = bool.fromEnvironment('dart.vm.profile', defaultValue: false);
  static const bool isReleaseMode = bool.fromEnvironment('dart.vm.product', defaultValue: false);
  static const bool isDebugMode   = !isReleaseMode && !isProfileMode;

  /// Returns number of bits to represent integer [n].
  /// [n] must be positive integer number.
  static int bitCount(final int n) {
    if(n < 0) {
      throw ArgumentError.value(n, null, "n is negative");
    }

    // calculates floor(log(2)) + 1
    // log should be log at base e (ln)
    return n == 0 ? 0 : (log(n) / log(2)).floor() + 1;
  }

  /// Returns number of bytes to represent integer [n].
  /// [n] must be positive integer number.
  static int byteCount(final int n) {
    return (bitCount(n) / 8).ceil();
  }

  /// Returns serialized [n] in big endian byte order and shrunk to the first set byte or [minLen].
  /// If [minLen] is 0 and [n] is 0, empty [Uint8List] will be returned.
  static Uint8List intToBin(int n, {int minLen = 1}) {
    assert(minLen >= 0);
    final raw = Uint8List(8);
    ByteData.view(raw.buffer).setUint64(0, n, Endian.big);

    // get first set byte
    int i = 0;
    for(; i < raw.length; i++) {
      if(raw[i] != 0x00 ) {
        break;
      }
    }
    return raw.sublist( raw.length - i >= minLen ? i : raw.length  - minLen);
  }

  static Uint8List bigIntToUint8List({required BigInt bigInt}) =>
      bigIntToByteData(bigInt).buffer.asUint8List();

  static ByteData bigIntToByteData(BigInt bigInt) {
    final data = ByteData((bigInt.bitLength / 8).ceil());
    var bigInt0 = bigInt;

    for (var i = 1; i <= data.lengthInBytes; i++) {
      data.setUint8(data.lengthInBytes - i, bigInt0.toUnsigned(8).toInt());
      bigInt0 = bigInt0 >> 8;
    }

    return data;
  }

  static BigInt uint8ListToBigInt(Uint8List bytes, {bool isLittleEndian = false}) {
    BigInt result = BigInt.zero;
    for (int i = 0; i < bytes.length; i++) {
      int power = isLittleEndian ? i : (bytes.length - i - 1);
      result += BigInt.from(bytes[i]) << (8 * power);
    }
    return result;
  }
}

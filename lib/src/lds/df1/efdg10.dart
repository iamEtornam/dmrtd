// Created by Crt Vavros, copyright © 2022 ZeroPass. All rights reserved.
// ignore_for_file: constant_identifier_names

import 'dg.dart';

class EfDG10 extends DataGroup {
  static const FID = 0x010A;
  static const SFI = 0x0A;
  static const TAG = DgTag(0x6A);

  EfDG10.fromBytes(super.data) : super.fromBytes();

  @override
  int get fid => FID;

  @override
  int get sfi => SFI;

  @override
  int get tag => TAG.value;
}

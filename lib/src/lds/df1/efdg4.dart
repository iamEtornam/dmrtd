// Created by Crt Vavros, copyright © 2022 ZeroPass. All rights reserved.
// ignore_for_file: constant_identifier_names

import 'dg.dart';

class EfDG4 extends DataGroup {
  static const FID = 0x0104;
  static const SFI = 0x04;
  static const TAG = DgTag(0x76);

  EfDG4.fromBytes(super.data) : super.fromBytes();

  @override
  int get fid => FID;

  @override
  int get sfi => SFI;

  @override
  int get tag => TAG.value;
}
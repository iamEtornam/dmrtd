// Created by Crt Vavros, copyright © 2022 ZeroPass. All rights reserved.
// ignore_for_file: constant_identifier_names

import 'dg.dart';

class EfDG8 extends DataGroup {
  static const FID = 0x0108;
  static const SFI = 0x08;
  static const TAG = DgTag(0x68);

  EfDG8.fromBytes(super.data) : super.fromBytes();

  @override
  int get fid => FID;

  @override
  int get sfi => SFI;

  @override
  int get tag => TAG.value;
}
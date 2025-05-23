// Created by Crt Vavros, copyright © 2022 ZeroPass. All rights reserved.
// ignore_for_file: constant_identifier_names

import 'dg.dart';

class EfDG9 extends DataGroup {
  static const FID = 0x0109;
  static const SFI = 0x09;
  static const TAG = DgTag(0x69);

  EfDG9.fromBytes(super.data) : super.fromBytes();

  @override
  int get fid => FID;

  @override
  int get sfi => SFI;

  @override
  int get tag => TAG.value;
}
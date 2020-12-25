// Copyright (c) 2018-2020 HERE Global B.V. and its affiliate(s).
// All rights reserved.
//
// This software and other materials contain proprietary information
// controlled by HERE and are protected by applicable copyright legislation.
// Any use and utilization of this software and other materials and
// disclosure to any third parties is conditional upon having a separate
// agreement with HERE for the access, use, utilization or disclosure of this
// software. In the absence of such agreement, the use of the software is not
// allowed.
//


import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// Specifies how isoline calculation is optimized.
enum IsolineCalculationMode {
    /// Calculation of isoline focuses on quality, that is, the graph used for
    /// isoline calculation has higher granularity generating an isoline that is
    /// more precise.
    quality,
    /// Calculation of isoline is performance-centric, quality of isoline is
    /// reduced to provide better performance.
    performance,
    /// Calculation of isoline takes a balanced approach averaging between
    /// quality and performance.
    balanced
}

// IsolineCalculationMode "private" section, not exported.

int sdk_routing_IsolineCalculationMode_toFfi(IsolineCalculationMode value) {
  switch (value) {
  case IsolineCalculationMode.quality:
    return 0;
  break;
  case IsolineCalculationMode.performance:
    return 1;
  break;
  case IsolineCalculationMode.balanced:
    return 2;
  break;
  default:
    throw StateError("Invalid enum value $value for IsolineCalculationMode enum.");
  }
}

IsolineCalculationMode sdk_routing_IsolineCalculationMode_fromFfi(int handle) {
  switch (handle) {
  case 0:
    return IsolineCalculationMode.quality;
  break;
  case 1:
    return IsolineCalculationMode.performance;
  break;
  case 2:
    return IsolineCalculationMode.balanced;
  break;
  default:
    throw StateError("Invalid numeric value $handle for IsolineCalculationMode enum.");
  }
}

void sdk_routing_IsolineCalculationMode_releaseFfiHandle(int handle) {}

final _sdk_routing_IsolineCalculationMode_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_routing_IsolineCalculationMode_create_handle_nullable'));
final _sdk_routing_IsolineCalculationMode_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IsolineCalculationMode_release_handle_nullable'));
final _sdk_routing_IsolineCalculationMode_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_IsolineCalculationMode_get_value_nullable'));

Pointer<Void> sdk_routing_IsolineCalculationMode_toFfi_nullable(IsolineCalculationMode value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_routing_IsolineCalculationMode_toFfi(value);
  final result = _sdk_routing_IsolineCalculationMode_create_handle_nullable(_handle);
  sdk_routing_IsolineCalculationMode_releaseFfiHandle(_handle);
  return result;
}

IsolineCalculationMode sdk_routing_IsolineCalculationMode_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_routing_IsolineCalculationMode_get_value_nullable(handle);
  final result = sdk_routing_IsolineCalculationMode_fromFfi(_handle);
  sdk_routing_IsolineCalculationMode_releaseFfiHandle(_handle);
  return result;
}

void sdk_routing_IsolineCalculationMode_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_routing_IsolineCalculationMode_release_handle_nullable(handle);

// End of IsolineCalculationMode "private" section.


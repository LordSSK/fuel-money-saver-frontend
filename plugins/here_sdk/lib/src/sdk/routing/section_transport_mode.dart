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

/// Specifies the [Section] mode of transport.
///
/// A [Section] may have a different
/// transport mode than the one specified for route calculation. For example, a car route may have a
/// section having ferry transport mode.
enum SectionTransportMode {
    /// Car mode of transport.
    car,
    /// Truck mode of transport.
    truck,
    /// Pedestrian mode of transport.
    pedestrian,
    /// Ferry mode of transport.
    ferry,
    /// Transit car, shuttle or train mode of transport.
    carShuttleTrain,
    /// Scooter mode of transport.
    scooter
}

// SectionTransportMode "private" section, not exported.

int sdk_routing_SectionTransportMode_toFfi(SectionTransportMode value) {
  switch (value) {
  case SectionTransportMode.car:
    return 0;
  break;
  case SectionTransportMode.truck:
    return 1;
  break;
  case SectionTransportMode.pedestrian:
    return 2;
  break;
  case SectionTransportMode.ferry:
    return 3;
  break;
  case SectionTransportMode.carShuttleTrain:
    return 4;
  break;
  case SectionTransportMode.scooter:
    return 5;
  break;
  default:
    throw StateError("Invalid enum value $value for SectionTransportMode enum.");
  }
}

SectionTransportMode sdk_routing_SectionTransportMode_fromFfi(int handle) {
  switch (handle) {
  case 0:
    return SectionTransportMode.car;
  break;
  case 1:
    return SectionTransportMode.truck;
  break;
  case 2:
    return SectionTransportMode.pedestrian;
  break;
  case 3:
    return SectionTransportMode.ferry;
  break;
  case 4:
    return SectionTransportMode.carShuttleTrain;
  break;
  case 5:
    return SectionTransportMode.scooter;
  break;
  default:
    throw StateError("Invalid numeric value $handle for SectionTransportMode enum.");
  }
}

void sdk_routing_SectionTransportMode_releaseFfiHandle(int handle) {}

final _sdk_routing_SectionTransportMode_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_routing_SectionTransportMode_create_handle_nullable'));
final _sdk_routing_SectionTransportMode_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_SectionTransportMode_release_handle_nullable'));
final _sdk_routing_SectionTransportMode_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_SectionTransportMode_get_value_nullable'));

Pointer<Void> sdk_routing_SectionTransportMode_toFfi_nullable(SectionTransportMode value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_routing_SectionTransportMode_toFfi(value);
  final result = _sdk_routing_SectionTransportMode_create_handle_nullable(_handle);
  sdk_routing_SectionTransportMode_releaseFfiHandle(_handle);
  return result;
}

SectionTransportMode sdk_routing_SectionTransportMode_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_routing_SectionTransportMode_get_value_nullable(handle);
  final result = sdk_routing_SectionTransportMode_fromFfi(_handle);
  sdk_routing_SectionTransportMode_releaseFfiHandle(_handle);
  return result;
}

void sdk_routing_SectionTransportMode_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_routing_SectionTransportMode_release_handle_nullable(handle);

// End of SectionTransportMode "private" section.


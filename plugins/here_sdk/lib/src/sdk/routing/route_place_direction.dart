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

/// @nodoc
enum RoutePlaceDirection {
    departure,
    arrival
}

// RoutePlaceDirection "private" section, not exported.

int sdk_routing_RoutePlaceDirection_toFfi(RoutePlaceDirection value) {
  switch (value) {
  case RoutePlaceDirection.departure:
    return 0;
  break;
  case RoutePlaceDirection.arrival:
    return 1;
  break;
  default:
    throw StateError("Invalid enum value $value for RoutePlaceDirection enum.");
  }
}

RoutePlaceDirection sdk_routing_RoutePlaceDirection_fromFfi(int handle) {
  switch (handle) {
  case 0:
    return RoutePlaceDirection.departure;
  break;
  case 1:
    return RoutePlaceDirection.arrival;
  break;
  default:
    throw StateError("Invalid numeric value $handle for RoutePlaceDirection enum.");
  }
}

void sdk_routing_RoutePlaceDirection_releaseFfiHandle(int handle) {}

final _sdk_routing_RoutePlaceDirection_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_routing_RoutePlaceDirection_create_handle_nullable'));
final _sdk_routing_RoutePlaceDirection_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RoutePlaceDirection_release_handle_nullable'));
final _sdk_routing_RoutePlaceDirection_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RoutePlaceDirection_get_value_nullable'));

Pointer<Void> sdk_routing_RoutePlaceDirection_toFfi_nullable(RoutePlaceDirection value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_routing_RoutePlaceDirection_toFfi(value);
  final result = _sdk_routing_RoutePlaceDirection_create_handle_nullable(_handle);
  sdk_routing_RoutePlaceDirection_releaseFfiHandle(_handle);
  return result;
}

RoutePlaceDirection sdk_routing_RoutePlaceDirection_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_routing_RoutePlaceDirection_get_value_nullable(handle);
  final result = sdk_routing_RoutePlaceDirection_fromFfi(_handle);
  sdk_routing_RoutePlaceDirection_releaseFfiHandle(_handle);
  return result;
}

void sdk_routing_RoutePlaceDirection_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_routing_RoutePlaceDirection_release_handle_nullable(handle);

// End of RoutePlaceDirection "private" section.


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

import 'dart:collection';
import 'package:collection/collection.dart';
import 'package:here_sdk/src/builtin_types__conversion.dart';
import 'package:here_sdk/src/sdk/routing/route_options.dart';
import 'package:here_sdk/src/sdk/routing/route_text_options.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// All the options to specify how a pedestrian route should be calculated.

class PedestrianOptions {
  /// Specifies the common route calculation options.
  RouteOptions routeOptions;

  /// Customize textual content returned from the route calculation, such
  /// as localization, format, and unit system.
  RouteTextOptions textOptions;

  /// Specifies the speed that will be used by the service as the walking speed
  /// for pedestrian routing in meters per second. It influences the duration of
  /// walking segments along the route. The provided value must be in the range
  /// \[0.5, 2.0\]. When the value is outside this range, an invalid parameter
  /// error is raised. Refer to [RoutingError] for details. The default
  /// speed is 1 meter per second.
  /// Note: This feature is in BETA state and thus there can be bugs and unexpected behavior.
  /// Related APIs may change for new releases without a deprecation process.
  double walkSpeedInMetersPerSecond;


  PedestrianOptions(this.routeOptions, this.textOptions, this.walkSpeedInMetersPerSecond);

  PedestrianOptions.withDefaults()
    : routeOptions = RouteOptions.withDefaults(), textOptions = RouteTextOptions.withDefaults(), walkSpeedInMetersPerSecond = 1.0;

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! PedestrianOptions) return false;
    PedestrianOptions _other = other;
    return routeOptions == _other.routeOptions &&
        textOptions == _other.textOptions &&
        walkSpeedInMetersPerSecond == _other.walkSpeedInMetersPerSecond;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + routeOptions.hashCode;
    result = 31 * result + textOptions.hashCode;
    result = 31 * result + walkSpeedInMetersPerSecond.hashCode;
    return result;
  }
}


// PedestrianOptions "private" section, not exported.

final _sdk_routing_PedestrianOptions_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Double),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, double)
  >('here_sdk_sdk_routing_PedestrianOptions_create_handle'));
final _sdk_routing_PedestrianOptions_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_PedestrianOptions_release_handle'));
final _sdk_routing_PedestrianOptions_get_field_routeOptions = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_PedestrianOptions_get_field_routeOptions'));
final _sdk_routing_PedestrianOptions_get_field_textOptions = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_PedestrianOptions_get_field_textOptions'));
final _sdk_routing_PedestrianOptions_get_field_walkSpeedInMetersPerSecond = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Double Function(Pointer<Void>),
    double Function(Pointer<Void>)
  >('here_sdk_sdk_routing_PedestrianOptions_get_field_walkSpeedInMetersPerSecond'));

Pointer<Void> sdk_routing_PedestrianOptions_toFfi(PedestrianOptions value) {
  final _routeOptions_handle = sdk_routing_RouteOptions_toFfi(value.routeOptions);
  final _textOptions_handle = sdk_routing_RouteTextOptions_toFfi(value.textOptions);
  final _walkSpeedInMetersPerSecond_handle = (value.walkSpeedInMetersPerSecond);
  final _result = _sdk_routing_PedestrianOptions_create_handle(_routeOptions_handle, _textOptions_handle, _walkSpeedInMetersPerSecond_handle);
  sdk_routing_RouteOptions_releaseFfiHandle(_routeOptions_handle);
  sdk_routing_RouteTextOptions_releaseFfiHandle(_textOptions_handle);
  (_walkSpeedInMetersPerSecond_handle);
  return _result;
}

PedestrianOptions sdk_routing_PedestrianOptions_fromFfi(Pointer<Void> handle) {
  final _routeOptions_handle = _sdk_routing_PedestrianOptions_get_field_routeOptions(handle);
  final _textOptions_handle = _sdk_routing_PedestrianOptions_get_field_textOptions(handle);
  final _walkSpeedInMetersPerSecond_handle = _sdk_routing_PedestrianOptions_get_field_walkSpeedInMetersPerSecond(handle);
  try {
    return PedestrianOptions(
      sdk_routing_RouteOptions_fromFfi(_routeOptions_handle), 
    
      sdk_routing_RouteTextOptions_fromFfi(_textOptions_handle), 
    
      (_walkSpeedInMetersPerSecond_handle)
    );
  } finally {
    sdk_routing_RouteOptions_releaseFfiHandle(_routeOptions_handle);
    sdk_routing_RouteTextOptions_releaseFfiHandle(_textOptions_handle);
    (_walkSpeedInMetersPerSecond_handle);
  }
}

void sdk_routing_PedestrianOptions_releaseFfiHandle(Pointer<Void> handle) => _sdk_routing_PedestrianOptions_release_handle(handle);

// Nullable PedestrianOptions

final _sdk_routing_PedestrianOptions_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_PedestrianOptions_create_handle_nullable'));
final _sdk_routing_PedestrianOptions_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_PedestrianOptions_release_handle_nullable'));
final _sdk_routing_PedestrianOptions_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_PedestrianOptions_get_value_nullable'));

Pointer<Void> sdk_routing_PedestrianOptions_toFfi_nullable(PedestrianOptions value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_routing_PedestrianOptions_toFfi(value);
  final result = _sdk_routing_PedestrianOptions_create_handle_nullable(_handle);
  sdk_routing_PedestrianOptions_releaseFfiHandle(_handle);
  return result;
}

PedestrianOptions sdk_routing_PedestrianOptions_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_routing_PedestrianOptions_get_value_nullable(handle);
  final result = sdk_routing_PedestrianOptions_fromFfi(_handle);
  sdk_routing_PedestrianOptions_releaseFfiHandle(_handle);
  return result;
}

void sdk_routing_PedestrianOptions_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_routing_PedestrianOptions_release_handle_nullable(handle);

// End of PedestrianOptions "private" section.


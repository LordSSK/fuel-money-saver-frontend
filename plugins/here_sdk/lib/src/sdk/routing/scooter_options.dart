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
import 'package:here_sdk/src/sdk/routing/avoidance_options.dart';
import 'package:here_sdk/src/sdk/routing/route_options.dart';
import 'package:here_sdk/src/sdk/routing/route_text_options.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// All the options to specify how a scooter route should be calculated.

class ScooterOptions {
  /// Specifies the common route calculation options.
  RouteOptions routeOptions;

  /// Customize textual content returned from the route calculation, such
  /// as localization, format, and unit system.
  RouteTextOptions textOptions;

  /// Options to specify restrictions for route calculations. By default
  /// no restrictions are applied.
  AvoidanceOptions avoidanceOptions;

  /// Specifies whether scooter is allowed on highway or not. True means scooter is
  /// allowed to use highways and false means otherwise. By default it is set to false.
  /// Note that there is a similar parameter in [AvoidanceOptions], to
  /// disallow highway usage, see [RoadFeatures.controlledAccessHighway].
  /// As the avoidance options takes precedence, if this parameter is also used, then
  /// scooters are not allowed to use highways even if `allowHighway` is set to true.
  /// However, if no alternative route is possible, the calculated route may use highways.
  /// In such a case, a [Notice] will be provided in the related [Section]
  /// to indicate that the highway usage restriction is violated on this route.
  bool allowHighway;


  ScooterOptions(this.routeOptions, this.textOptions, this.avoidanceOptions, this.allowHighway);

  ScooterOptions.withDefaults()
    : routeOptions = RouteOptions.withDefaults(), textOptions = RouteTextOptions.withDefaults(), avoidanceOptions = AvoidanceOptions.withDefaults(), allowHighway = false;

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! ScooterOptions) return false;
    ScooterOptions _other = other;
    return routeOptions == _other.routeOptions &&
        textOptions == _other.textOptions &&
        avoidanceOptions == _other.avoidanceOptions &&
        allowHighway == _other.allowHighway;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + routeOptions.hashCode;
    result = 31 * result + textOptions.hashCode;
    result = 31 * result + avoidanceOptions.hashCode;
    result = 31 * result + allowHighway.hashCode;
    return result;
  }
}


// ScooterOptions "private" section, not exported.

final _sdk_routing_ScooterOptions_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Uint8),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, int)
  >('here_sdk_sdk_routing_ScooterOptions_create_handle'));
final _sdk_routing_ScooterOptions_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ScooterOptions_release_handle'));
final _sdk_routing_ScooterOptions_get_field_routeOptions = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ScooterOptions_get_field_routeOptions'));
final _sdk_routing_ScooterOptions_get_field_textOptions = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ScooterOptions_get_field_textOptions'));
final _sdk_routing_ScooterOptions_get_field_avoidanceOptions = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ScooterOptions_get_field_avoidanceOptions'));
final _sdk_routing_ScooterOptions_get_field_allowHighway = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint8 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ScooterOptions_get_field_allowHighway'));

Pointer<Void> sdk_routing_ScooterOptions_toFfi(ScooterOptions value) {
  final _routeOptions_handle = sdk_routing_RouteOptions_toFfi(value.routeOptions);
  final _textOptions_handle = sdk_routing_RouteTextOptions_toFfi(value.textOptions);
  final _avoidanceOptions_handle = sdk_routing_AvoidanceOptions_toFfi(value.avoidanceOptions);
  final _allowHighway_handle = Boolean_toFfi(value.allowHighway);
  final _result = _sdk_routing_ScooterOptions_create_handle(_routeOptions_handle, _textOptions_handle, _avoidanceOptions_handle, _allowHighway_handle);
  sdk_routing_RouteOptions_releaseFfiHandle(_routeOptions_handle);
  sdk_routing_RouteTextOptions_releaseFfiHandle(_textOptions_handle);
  sdk_routing_AvoidanceOptions_releaseFfiHandle(_avoidanceOptions_handle);
  Boolean_releaseFfiHandle(_allowHighway_handle);
  return _result;
}

ScooterOptions sdk_routing_ScooterOptions_fromFfi(Pointer<Void> handle) {
  final _routeOptions_handle = _sdk_routing_ScooterOptions_get_field_routeOptions(handle);
  final _textOptions_handle = _sdk_routing_ScooterOptions_get_field_textOptions(handle);
  final _avoidanceOptions_handle = _sdk_routing_ScooterOptions_get_field_avoidanceOptions(handle);
  final _allowHighway_handle = _sdk_routing_ScooterOptions_get_field_allowHighway(handle);
  try {
    return ScooterOptions(
      sdk_routing_RouteOptions_fromFfi(_routeOptions_handle), 
    
      sdk_routing_RouteTextOptions_fromFfi(_textOptions_handle), 
    
      sdk_routing_AvoidanceOptions_fromFfi(_avoidanceOptions_handle), 
    
      Boolean_fromFfi(_allowHighway_handle)
    );
  } finally {
    sdk_routing_RouteOptions_releaseFfiHandle(_routeOptions_handle);
    sdk_routing_RouteTextOptions_releaseFfiHandle(_textOptions_handle);
    sdk_routing_AvoidanceOptions_releaseFfiHandle(_avoidanceOptions_handle);
    Boolean_releaseFfiHandle(_allowHighway_handle);
  }
}

void sdk_routing_ScooterOptions_releaseFfiHandle(Pointer<Void> handle) => _sdk_routing_ScooterOptions_release_handle(handle);

// Nullable ScooterOptions

final _sdk_routing_ScooterOptions_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ScooterOptions_create_handle_nullable'));
final _sdk_routing_ScooterOptions_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ScooterOptions_release_handle_nullable'));
final _sdk_routing_ScooterOptions_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_ScooterOptions_get_value_nullable'));

Pointer<Void> sdk_routing_ScooterOptions_toFfi_nullable(ScooterOptions value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_routing_ScooterOptions_toFfi(value);
  final result = _sdk_routing_ScooterOptions_create_handle_nullable(_handle);
  sdk_routing_ScooterOptions_releaseFfiHandle(_handle);
  return result;
}

ScooterOptions sdk_routing_ScooterOptions_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_routing_ScooterOptions_get_value_nullable(handle);
  final result = sdk_routing_ScooterOptions_fromFfi(_handle);
  sdk_routing_ScooterOptions_releaseFfiHandle(_handle);
  return result;
}

void sdk_routing_ScooterOptions_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_routing_ScooterOptions_release_handle_nullable(handle);

// End of ScooterOptions "private" section.


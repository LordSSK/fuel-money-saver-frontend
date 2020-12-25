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

import 'package:here_sdk/src/sdk/core/localized_texts.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// Textual attributes of road.

class RoadTexts {
  /// Road names in available languages.
  /// Empty for unnamed roads.
  LocalizedTexts names;

  /// Road numbers in available languages.
  /// Empty if the road has no numbers assigned.
  LocalizedTexts numbers;


  RoadTexts(this.names, this.numbers);

}


// RoadTexts "private" section, not exported.

final _sdk_routing_RoadTexts_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_routing_RoadTexts_create_handle'));
final _sdk_routing_RoadTexts_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RoadTexts_release_handle'));
final _sdk_routing_RoadTexts_get_field_names = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RoadTexts_get_field_names'));
final _sdk_routing_RoadTexts_get_field_numbers = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RoadTexts_get_field_numbers'));

Pointer<Void> sdk_routing_RoadTexts_toFfi(RoadTexts value) {
  final _names_handle = sdk_core_LocalizedTexts_toFfi(value.names);
  final _numbers_handle = sdk_core_LocalizedTexts_toFfi(value.numbers);
  final _result = _sdk_routing_RoadTexts_create_handle(_names_handle, _numbers_handle);
  sdk_core_LocalizedTexts_releaseFfiHandle(_names_handle);
  sdk_core_LocalizedTexts_releaseFfiHandle(_numbers_handle);
  return _result;
}

RoadTexts sdk_routing_RoadTexts_fromFfi(Pointer<Void> handle) {
  final _names_handle = _sdk_routing_RoadTexts_get_field_names(handle);
  final _numbers_handle = _sdk_routing_RoadTexts_get_field_numbers(handle);
  try {
    return RoadTexts(
      sdk_core_LocalizedTexts_fromFfi(_names_handle), 
    
      sdk_core_LocalizedTexts_fromFfi(_numbers_handle)
    );
  } finally {
    sdk_core_LocalizedTexts_releaseFfiHandle(_names_handle);
    sdk_core_LocalizedTexts_releaseFfiHandle(_numbers_handle);
  }
}

void sdk_routing_RoadTexts_releaseFfiHandle(Pointer<Void> handle) => _sdk_routing_RoadTexts_release_handle(handle);

// Nullable RoadTexts

final _sdk_routing_RoadTexts_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RoadTexts_create_handle_nullable'));
final _sdk_routing_RoadTexts_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RoadTexts_release_handle_nullable'));
final _sdk_routing_RoadTexts_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_RoadTexts_get_value_nullable'));

Pointer<Void> sdk_routing_RoadTexts_toFfi_nullable(RoadTexts value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_routing_RoadTexts_toFfi(value);
  final result = _sdk_routing_RoadTexts_create_handle_nullable(_handle);
  sdk_routing_RoadTexts_releaseFfiHandle(_handle);
  return result;
}

RoadTexts sdk_routing_RoadTexts_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_routing_RoadTexts_get_value_nullable(handle);
  final result = sdk_routing_RoadTexts_fromFfi(_handle);
  sdk_routing_RoadTexts_releaseFfiHandle(_handle);
  return result;
}

void sdk_routing_RoadTexts_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_routing_RoadTexts_release_handle_nullable(handle);

// End of RoadTexts "private" section.


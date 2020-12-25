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
import 'package:here_sdk/src/sdk/routing/notice_code.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// A notice explains an issue encountered during processing of a route calculation request.

class Notice {
  /// The notice code.
  NoticeCode code;


  Notice(this.code);

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! Notice) return false;
    Notice _other = other;
    return code == _other.code;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + code.hashCode;
    return result;
  }
}


// Notice "private" section, not exported.

final _sdk_routing_Notice_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_routing_Notice_create_handle'));
final _sdk_routing_Notice_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Notice_release_handle'));
final _sdk_routing_Notice_get_field_code = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Notice_get_field_code'));

Pointer<Void> sdk_routing_Notice_toFfi(Notice value) {
  final _code_handle = sdk_routing_NoticeCode_toFfi(value.code);
  final _result = _sdk_routing_Notice_create_handle(_code_handle);
  sdk_routing_NoticeCode_releaseFfiHandle(_code_handle);
  return _result;
}

Notice sdk_routing_Notice_fromFfi(Pointer<Void> handle) {
  final _code_handle = _sdk_routing_Notice_get_field_code(handle);
  try {
    return Notice(
      sdk_routing_NoticeCode_fromFfi(_code_handle)
    );
  } finally {
    sdk_routing_NoticeCode_releaseFfiHandle(_code_handle);
  }
}

void sdk_routing_Notice_releaseFfiHandle(Pointer<Void> handle) => _sdk_routing_Notice_release_handle(handle);

// Nullable Notice

final _sdk_routing_Notice_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Notice_create_handle_nullable'));
final _sdk_routing_Notice_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Notice_release_handle_nullable'));
final _sdk_routing_Notice_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_routing_Notice_get_value_nullable'));

Pointer<Void> sdk_routing_Notice_toFfi_nullable(Notice value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_routing_Notice_toFfi(value);
  final result = _sdk_routing_Notice_create_handle_nullable(_handle);
  sdk_routing_Notice_releaseFfiHandle(_handle);
  return result;
}

Notice sdk_routing_Notice_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_routing_Notice_get_value_nullable(handle);
  final result = sdk_routing_Notice_fromFfi(_handle);
  sdk_routing_Notice_releaseFfiHandle(_handle);
  return result;
}

void sdk_routing_Notice_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_routing_Notice_release_handle_nullable(handle);

// End of Notice "private" section.


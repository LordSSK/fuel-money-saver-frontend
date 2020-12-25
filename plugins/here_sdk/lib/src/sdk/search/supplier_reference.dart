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

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// Identifier of the place as provided by the supplier
@immutable
class SupplierReference {
  /// Information about the supplier of this reference.
  final String supplier;

  /// Identifier of the place as provided by the supplier.
  final String id;


  const SupplierReference(this.supplier, this.id);

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! SupplierReference) return false;
    SupplierReference _other = other;
    return supplier == _other.supplier &&
        id == _other.id;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + supplier.hashCode;
    result = 31 * result + id.hashCode;
    return result;
  }
}


// SupplierReference "private" section, not exported.

final _sdk_search_SupplierReference_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_search_SupplierReference_create_handle'));
final _sdk_search_SupplierReference_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_SupplierReference_release_handle'));
final _sdk_search_SupplierReference_get_field_supplier = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_SupplierReference_get_field_supplier'));
final _sdk_search_SupplierReference_get_field_id = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_SupplierReference_get_field_id'));

Pointer<Void> sdk_search_SupplierReference_toFfi(SupplierReference value) {
  final _supplier_handle = String_toFfi(value.supplier);
  final _id_handle = String_toFfi(value.id);
  final _result = _sdk_search_SupplierReference_create_handle(_supplier_handle, _id_handle);
  String_releaseFfiHandle(_supplier_handle);
  String_releaseFfiHandle(_id_handle);
  return _result;
}

SupplierReference sdk_search_SupplierReference_fromFfi(Pointer<Void> handle) {
  final _supplier_handle = _sdk_search_SupplierReference_get_field_supplier(handle);
  final _id_handle = _sdk_search_SupplierReference_get_field_id(handle);
  try {
    return SupplierReference(
      String_fromFfi(_supplier_handle), 
    
      String_fromFfi(_id_handle)
    );
  } finally {
    String_releaseFfiHandle(_supplier_handle);
    String_releaseFfiHandle(_id_handle);
  }
}

void sdk_search_SupplierReference_releaseFfiHandle(Pointer<Void> handle) => _sdk_search_SupplierReference_release_handle(handle);

// Nullable SupplierReference

final _sdk_search_SupplierReference_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_SupplierReference_create_handle_nullable'));
final _sdk_search_SupplierReference_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_SupplierReference_release_handle_nullable'));
final _sdk_search_SupplierReference_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_SupplierReference_get_value_nullable'));

Pointer<Void> sdk_search_SupplierReference_toFfi_nullable(SupplierReference value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_search_SupplierReference_toFfi(value);
  final result = _sdk_search_SupplierReference_create_handle_nullable(_handle);
  sdk_search_SupplierReference_releaseFfiHandle(_handle);
  return result;
}

SupplierReference sdk_search_SupplierReference_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_search_SupplierReference_get_value_nullable(handle);
  final result = sdk_search_SupplierReference_fromFfi(_handle);
  sdk_search_SupplierReference_releaseFfiHandle(_handle);
  return result;
}

void sdk_search_SupplierReference_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_search_SupplierReference_release_handle_nullable(handle);

// End of SupplierReference "private" section.


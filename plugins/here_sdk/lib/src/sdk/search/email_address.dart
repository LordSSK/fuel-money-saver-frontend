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
import 'package:here_sdk/src/generic_types__conversion.dart';
import 'package:here_sdk/src/sdk/search/place_category.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// Represents data related to specific email address.
@immutable
class EmailAddress {
  /// The email address.
  final String address;

  /// Categories associated with email address.
  final List<PlaceCategory> categories;


  const EmailAddress(this.address, this.categories);

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! EmailAddress) return false;
    EmailAddress _other = other;
    return address == _other.address &&
        DeepCollectionEquality().equals(categories, _other.categories);
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + address.hashCode;
    result = 31 * result + DeepCollectionEquality().hash(categories);
    return result;
  }
}


// EmailAddress "private" section, not exported.

final _sdk_search_EmailAddress_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>)
  >('here_sdk_sdk_search_EmailAddress_create_handle'));
final _sdk_search_EmailAddress_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_EmailAddress_release_handle'));
final _sdk_search_EmailAddress_get_field_address = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_EmailAddress_get_field_address'));
final _sdk_search_EmailAddress_get_field_categories = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_EmailAddress_get_field_categories'));

Pointer<Void> sdk_search_EmailAddress_toFfi(EmailAddress value) {
  final _address_handle = String_toFfi(value.address);
  final _categories_handle = heresdk_search_common_bindings_ListOf_sdk_search_PlaceCategory_toFfi(value.categories);
  final _result = _sdk_search_EmailAddress_create_handle(_address_handle, _categories_handle);
  String_releaseFfiHandle(_address_handle);
  heresdk_search_common_bindings_ListOf_sdk_search_PlaceCategory_releaseFfiHandle(_categories_handle);
  return _result;
}

EmailAddress sdk_search_EmailAddress_fromFfi(Pointer<Void> handle) {
  final _address_handle = _sdk_search_EmailAddress_get_field_address(handle);
  final _categories_handle = _sdk_search_EmailAddress_get_field_categories(handle);
  try {
    return EmailAddress(
      String_fromFfi(_address_handle), 
    
      heresdk_search_common_bindings_ListOf_sdk_search_PlaceCategory_fromFfi(_categories_handle)
    );
  } finally {
    String_releaseFfiHandle(_address_handle);
    heresdk_search_common_bindings_ListOf_sdk_search_PlaceCategory_releaseFfiHandle(_categories_handle);
  }
}

void sdk_search_EmailAddress_releaseFfiHandle(Pointer<Void> handle) => _sdk_search_EmailAddress_release_handle(handle);

// Nullable EmailAddress

final _sdk_search_EmailAddress_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_EmailAddress_create_handle_nullable'));
final _sdk_search_EmailAddress_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_search_EmailAddress_release_handle_nullable'));
final _sdk_search_EmailAddress_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_search_EmailAddress_get_value_nullable'));

Pointer<Void> sdk_search_EmailAddress_toFfi_nullable(EmailAddress value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_search_EmailAddress_toFfi(value);
  final result = _sdk_search_EmailAddress_create_handle_nullable(_handle);
  sdk_search_EmailAddress_releaseFfiHandle(_handle);
  return result;
}

EmailAddress sdk_search_EmailAddress_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_search_EmailAddress_get_value_nullable(handle);
  final result = sdk_search_EmailAddress_fromFfi(_handle);
  sdk_search_EmailAddress_releaseFfiHandle(_handle);
  return result;
}

void sdk_search_EmailAddress_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_search_EmailAddress_release_handle_nullable(handle);

// End of EmailAddress "private" section.


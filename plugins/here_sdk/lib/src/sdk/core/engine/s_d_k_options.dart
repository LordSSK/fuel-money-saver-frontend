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
import 'package:here_sdk/src/sdk/core/engine/authentication_preferences.dart';

import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;






/// Configuration of the SDK.
///
/// SDKOptions provide an alternative way to set or update the HERE SDK credentials at runtime to
/// initialize the [SDKNativeEngine].
/// [SDKOptions] fields can also be set via application .

class SDKOptions {
  /// Key used for authentication.
  String accessKeyId;

  /// Secret used for authentication.
  String accessKeySecret;

  /// Path to be used for caching purposes. If it is not set,
  ///
  /// is set by default.
  String cachePath;

  /// Desired upper bound of application size in bytes. When cached data exceeds cache_size, least recently used data will be removed.
  /// Default value 256MB
  int cacheSizeInBytes;

  /// Path to store persistent map.  If it is not set,
  ///
  /// is set by default.
  String persistentMapStoragePath;

  /// Sets authentication preferences for advantage usage.
  @Deprecated("Will be removed in v4.8.0. System time will be always used for authentication and in case of failure, current time will be read from the server's response.")
  AuthenticationPreferences authenticationPreferences;


  SDKOptions._(this.accessKeyId, this.accessKeySecret, this.cachePath, this.cacheSizeInBytes, this.persistentMapStoragePath, this.authenticationPreferences);
  SDKOptions._copy(SDKOptions _other) : this._(_other.accessKeyId, _other.accessKeySecret, _other.cachePath, _other.cacheSizeInBytes, _other.persistentMapStoragePath, _other.authenticationPreferences);

  /// Constructs a SDKOptions from access key id.
  ///
  /// Other fields are filled with default values.
  /// [accessKeyId] Key used for authentication.
  SDKOptions.make(String accessKeyId) : this._copy(_make(accessKeyId));

  /// Constructs a SDKOptions from access key id and secret.
  ///
  /// Other fields are filled with default values.
  /// [accessKeyId] Key used for authentication.
  /// [accessKeySecret] Secret used for authentication.
  SDKOptions.withAccessKeySecret(String accessKeyId, String accessKeySecret) : this._copy(_withAccessKeySecret(accessKeyId, accessKeySecret));

  /// Constructs a SDKOptions from access key id, access key secret and cache_path.
  /// [accessKeyId] Key used for authentication.
  /// [accessKeySecret] Secret used for authentication.
  /// [cachePath] Path to be used for caching purposes. If it is not set,
  ///
  /// is set by default.
  SDKOptions.withAccessKeySecretAndCachePath(String accessKeyId, String accessKeySecret, String cachePath) : this._copy(_withAccessKeySecretAndCachePath(accessKeyId, accessKeySecret, cachePath));

  /// Constructs a SDKOptions from access key id, access key secret, cache_path and cache_size.
  /// [accessKeyId] Key used for authentication.
  /// [accessKeySecret] Secret used for authentication.
  /// [cachePath] Path to be used for caching purposes. If it is not set,
  ///
  /// is set by default.
  /// [cacheSizeInBytes] Desired upper bound of application size in bytes.
  /// When cached data exceeds cache_size, least recently used data will be removed. Default value 256MB.
  SDKOptions.withAccessKeySecretAndCachePathCacheSize(String accessKeyId, String accessKeySecret, String cachePath, int cacheSizeInBytes) : this._copy(_withAccessKeySecretAndCachePathCacheSize(accessKeyId, accessKeySecret, cachePath, cacheSizeInBytes));

  /// Constructs a SDKOptions from access key id, access key secret, cache_path, cache_size and persistent_map_storage_path.
  /// [accessKeyId] Key used for authentication.
  /// [accessKeySecret] Secret used for authentication.
  /// [cachePath] Path to be used for caching purposes. If it is not set,
  ///
  /// is set by default.
  /// [cacheSizeInBytes] Desired upper bound of application size in bytes.
  /// When cached data exceeds cache_size, least recently used data will be removed. Default value 256MB
  /// [persistentMapStoragePath] Path to store persistent map downloaded by MapDownloader. If it is not set,
  /// is set by default.
  /// Note: The MapDownloader is not available for the Lite and Explore Edition. For these two editions, this property has no effect and can be ignored.
  SDKOptions.withAccessKeySecretAndCachePathCacheSizeAndPersistentMapPath(String accessKeyId, String accessKeySecret, String cachePath, int cacheSizeInBytes, String persistentMapStoragePath) : this._copy(_withAccessKeySecretAndCachePathCacheSizeAndPersistentMapPath(accessKeyId, accessKeySecret, cachePath, cacheSizeInBytes, persistentMapStoragePath));

  /// Constructs a SDKOptions from access key id.
  ///
  /// Other fields are filled with default values.
  /// [accessKeyId] Key used for authentication.
  static SDKOptions _make(String accessKeyId) {
    final _make_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>)>('here_sdk_sdk_core_engine_SDKOptions_make__String'));
    final _accessKeyId_handle = String_toFfi(accessKeyId);
    final __result_handle = _make_ffi(__lib.LibraryContext.isolateId, _accessKeyId_handle);
    String_releaseFfiHandle(_accessKeyId_handle);
    try {
      return sdk_core_engine_SDKOptions_fromFfi(__result_handle);
    } finally {
      sdk_core_engine_SDKOptions_releaseFfiHandle(__result_handle);
    }
  }

  /// Constructs a SDKOptions from access key id and secret.
  ///
  /// Other fields are filled with default values.
  /// [accessKeyId] Key used for authentication.
  /// [accessKeySecret] Secret used for authentication.
  static SDKOptions _withAccessKeySecret(String accessKeyId, String accessKeySecret) {
    final _withAccessKeySecret_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_core_engine_SDKOptions_make__String_String'));
    final _accessKeyId_handle = String_toFfi(accessKeyId);
    final _accessKeySecret_handle = String_toFfi(accessKeySecret);
    final __result_handle = _withAccessKeySecret_ffi(__lib.LibraryContext.isolateId, _accessKeyId_handle, _accessKeySecret_handle);
    String_releaseFfiHandle(_accessKeyId_handle);
    String_releaseFfiHandle(_accessKeySecret_handle);
    try {
      return sdk_core_engine_SDKOptions_fromFfi(__result_handle);
    } finally {
      sdk_core_engine_SDKOptions_releaseFfiHandle(__result_handle);
    }
  }

  /// Constructs a SDKOptions from access key id, access key secret and cache_path.
  /// [accessKeyId] Key used for authentication.
  /// [accessKeySecret] Secret used for authentication.
  /// [cachePath] Path to be used for caching purposes. If it is not set,
  ///
  /// is set by default.
  static SDKOptions _withAccessKeySecretAndCachePath(String accessKeyId, String accessKeySecret, String cachePath) {
    final _withAccessKeySecretAndCachePath_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>)>('here_sdk_sdk_core_engine_SDKOptions_make__String_String_String'));
    final _accessKeyId_handle = String_toFfi(accessKeyId);
    final _accessKeySecret_handle = String_toFfi(accessKeySecret);
    final _cachePath_handle = String_toFfi(cachePath);
    final __result_handle = _withAccessKeySecretAndCachePath_ffi(__lib.LibraryContext.isolateId, _accessKeyId_handle, _accessKeySecret_handle, _cachePath_handle);
    String_releaseFfiHandle(_accessKeyId_handle);
    String_releaseFfiHandle(_accessKeySecret_handle);
    String_releaseFfiHandle(_cachePath_handle);
    try {
      return sdk_core_engine_SDKOptions_fromFfi(__result_handle);
    } finally {
      sdk_core_engine_SDKOptions_releaseFfiHandle(__result_handle);
    }
  }

  /// Constructs a SDKOptions from access key id, access key secret, cache_path and cache_size.
  /// [accessKeyId] Key used for authentication.
  /// [accessKeySecret] Secret used for authentication.
  /// [cachePath] Path to be used for caching purposes. If it is not set,
  ///
  /// is set by default.
  /// [cacheSizeInBytes] Desired upper bound of application size in bytes.
  /// When cached data exceeds cache_size, least recently used data will be removed. Default value 256MB.
  static SDKOptions _withAccessKeySecretAndCachePathCacheSize(String accessKeyId, String accessKeySecret, String cachePath, int cacheSizeInBytes) {
    final _withAccessKeySecretAndCachePathCacheSize_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>, Int64), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>, int)>('here_sdk_sdk_core_engine_SDKOptions_make__String_String_String_Long'));
    final _accessKeyId_handle = String_toFfi(accessKeyId);
    final _accessKeySecret_handle = String_toFfi(accessKeySecret);
    final _cachePath_handle = String_toFfi(cachePath);
    final _cacheSizeInBytes_handle = (cacheSizeInBytes);
    final __result_handle = _withAccessKeySecretAndCachePathCacheSize_ffi(__lib.LibraryContext.isolateId, _accessKeyId_handle, _accessKeySecret_handle, _cachePath_handle, _cacheSizeInBytes_handle);
    String_releaseFfiHandle(_accessKeyId_handle);
    String_releaseFfiHandle(_accessKeySecret_handle);
    String_releaseFfiHandle(_cachePath_handle);
    (_cacheSizeInBytes_handle);
    try {
      return sdk_core_engine_SDKOptions_fromFfi(__result_handle);
    } finally {
      sdk_core_engine_SDKOptions_releaseFfiHandle(__result_handle);
    }
  }

  /// Constructs a SDKOptions from access key id, access key secret, cache_path, cache_size and persistent_map_storage_path.
  /// [accessKeyId] Key used for authentication.
  /// [accessKeySecret] Secret used for authentication.
  /// [cachePath] Path to be used for caching purposes. If it is not set,
  ///
  /// is set by default.
  /// [cacheSizeInBytes] Desired upper bound of application size in bytes.
  /// When cached data exceeds cache_size, least recently used data will be removed. Default value 256MB
  /// [persistentMapStoragePath] Path to store persistent map downloaded by MapDownloader. If it is not set,
  /// is set by default.
  /// Note: The MapDownloader is not available for the Lite and Explore Edition. For these two editions, this property has no effect and can be ignored.
  static SDKOptions _withAccessKeySecretAndCachePathCacheSizeAndPersistentMapPath(String accessKeyId, String accessKeySecret, String cachePath, int cacheSizeInBytes, String persistentMapStoragePath) {
    final _withAccessKeySecretAndCachePathCacheSizeAndPersistentMapPath_ffi = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<Pointer<Void> Function(Int32, Pointer<Void>, Pointer<Void>, Pointer<Void>, Int64, Pointer<Void>), Pointer<Void> Function(int, Pointer<Void>, Pointer<Void>, Pointer<Void>, int, Pointer<Void>)>('here_sdk_sdk_core_engine_SDKOptions_make__String_String_String_Long_String'));
    final _accessKeyId_handle = String_toFfi(accessKeyId);
    final _accessKeySecret_handle = String_toFfi(accessKeySecret);
    final _cachePath_handle = String_toFfi(cachePath);
    final _cacheSizeInBytes_handle = (cacheSizeInBytes);
    final _persistentMapStoragePath_handle = String_toFfi(persistentMapStoragePath);
    final __result_handle = _withAccessKeySecretAndCachePathCacheSizeAndPersistentMapPath_ffi(__lib.LibraryContext.isolateId, _accessKeyId_handle, _accessKeySecret_handle, _cachePath_handle, _cacheSizeInBytes_handle, _persistentMapStoragePath_handle);
    String_releaseFfiHandle(_accessKeyId_handle);
    String_releaseFfiHandle(_accessKeySecret_handle);
    String_releaseFfiHandle(_cachePath_handle);
    (_cacheSizeInBytes_handle);
    String_releaseFfiHandle(_persistentMapStoragePath_handle);
    try {
      return sdk_core_engine_SDKOptions_fromFfi(__result_handle);
    } finally {
      sdk_core_engine_SDKOptions_releaseFfiHandle(__result_handle);
    }
  }

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other is! SDKOptions) return false;
    SDKOptions _other = other;
    return accessKeyId == _other.accessKeyId &&
        accessKeySecret == _other.accessKeySecret &&
        cachePath == _other.cachePath &&
        cacheSizeInBytes == _other.cacheSizeInBytes &&
        persistentMapStoragePath == _other.persistentMapStoragePath &&
        authenticationPreferences == _other.authenticationPreferences;
  }

  @override
  int get hashCode {
    int result = 7;
    result = 31 * result + accessKeyId.hashCode;
    result = 31 * result + accessKeySecret.hashCode;
    result = 31 * result + cachePath.hashCode;
    result = 31 * result + cacheSizeInBytes.hashCode;
    result = 31 * result + persistentMapStoragePath.hashCode;
    result = 31 * result + authenticationPreferences.hashCode;
    return result;
  }
}


// SDKOptions "private" section, not exported.

final _sdk_core_engine_SDKOptions_create_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, Int64, Pointer<Void>, Uint32),
    Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<Void>, int, Pointer<Void>, int)
  >('here_sdk_sdk_core_engine_SDKOptions_create_handle'));
final _sdk_core_engine_SDKOptions_release_handle = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKOptions_release_handle'));
final _sdk_core_engine_SDKOptions_get_field_accessKeyId = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKOptions_get_field_accessKeyId'));
final _sdk_core_engine_SDKOptions_get_field_accessKeySecret = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKOptions_get_field_accessKeySecret'));
final _sdk_core_engine_SDKOptions_get_field_cachePath = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKOptions_get_field_cachePath'));
final _sdk_core_engine_SDKOptions_get_field_cacheSizeInBytes = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Int64 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKOptions_get_field_cacheSizeInBytes'));
final _sdk_core_engine_SDKOptions_get_field_persistentMapStoragePath = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKOptions_get_field_persistentMapStoragePath'));
final _sdk_core_engine_SDKOptions_get_field_authenticationPreferences = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKOptions_get_field_authenticationPreferences'));

Pointer<Void> sdk_core_engine_SDKOptions_toFfi(SDKOptions value) {
  final _accessKeyId_handle = String_toFfi(value.accessKeyId);
  final _accessKeySecret_handle = String_toFfi(value.accessKeySecret);
  final _cachePath_handle = String_toFfi(value.cachePath);
  final _cacheSizeInBytes_handle = (value.cacheSizeInBytes);
  final _persistentMapStoragePath_handle = String_toFfi(value.persistentMapStoragePath);
  final _authenticationPreferences_handle = sdk_core_engine_AuthenticationPreferences_toFfi(value.authenticationPreferences);
  final _result = _sdk_core_engine_SDKOptions_create_handle(_accessKeyId_handle, _accessKeySecret_handle, _cachePath_handle, _cacheSizeInBytes_handle, _persistentMapStoragePath_handle, _authenticationPreferences_handle);
  String_releaseFfiHandle(_accessKeyId_handle);
  String_releaseFfiHandle(_accessKeySecret_handle);
  String_releaseFfiHandle(_cachePath_handle);
  (_cacheSizeInBytes_handle);
  String_releaseFfiHandle(_persistentMapStoragePath_handle);
  sdk_core_engine_AuthenticationPreferences_releaseFfiHandle(_authenticationPreferences_handle);
  return _result;
}

SDKOptions sdk_core_engine_SDKOptions_fromFfi(Pointer<Void> handle) {
  final _accessKeyId_handle = _sdk_core_engine_SDKOptions_get_field_accessKeyId(handle);
  final _accessKeySecret_handle = _sdk_core_engine_SDKOptions_get_field_accessKeySecret(handle);
  final _cachePath_handle = _sdk_core_engine_SDKOptions_get_field_cachePath(handle);
  final _cacheSizeInBytes_handle = _sdk_core_engine_SDKOptions_get_field_cacheSizeInBytes(handle);
  final _persistentMapStoragePath_handle = _sdk_core_engine_SDKOptions_get_field_persistentMapStoragePath(handle);
  final _authenticationPreferences_handle = _sdk_core_engine_SDKOptions_get_field_authenticationPreferences(handle);
  try {
    return SDKOptions._(
      String_fromFfi(_accessKeyId_handle), 
    
      String_fromFfi(_accessKeySecret_handle), 
    
      String_fromFfi(_cachePath_handle), 
    
      (_cacheSizeInBytes_handle), 
    
      String_fromFfi(_persistentMapStoragePath_handle), 
    
      sdk_core_engine_AuthenticationPreferences_fromFfi(_authenticationPreferences_handle)
    );
  } finally {
    String_releaseFfiHandle(_accessKeyId_handle);
    String_releaseFfiHandle(_accessKeySecret_handle);
    String_releaseFfiHandle(_cachePath_handle);
    (_cacheSizeInBytes_handle);
    String_releaseFfiHandle(_persistentMapStoragePath_handle);
    sdk_core_engine_AuthenticationPreferences_releaseFfiHandle(_authenticationPreferences_handle);
  }
}

void sdk_core_engine_SDKOptions_releaseFfiHandle(Pointer<Void> handle) => _sdk_core_engine_SDKOptions_release_handle(handle);

// Nullable SDKOptions

final _sdk_core_engine_SDKOptions_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKOptions_create_handle_nullable'));
final _sdk_core_engine_SDKOptions_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKOptions_release_handle_nullable'));
final _sdk_core_engine_SDKOptions_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Pointer<Void>),
    Pointer<Void> Function(Pointer<Void>)
  >('here_sdk_sdk_core_engine_SDKOptions_get_value_nullable'));

Pointer<Void> sdk_core_engine_SDKOptions_toFfi_nullable(SDKOptions value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_core_engine_SDKOptions_toFfi(value);
  final result = _sdk_core_engine_SDKOptions_create_handle_nullable(_handle);
  sdk_core_engine_SDKOptions_releaseFfiHandle(_handle);
  return result;
}

SDKOptions sdk_core_engine_SDKOptions_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_core_engine_SDKOptions_get_value_nullable(handle);
  final result = sdk_core_engine_SDKOptions_fromFfi(_handle);
  sdk_core_engine_SDKOptions_releaseFfiHandle(_handle);
  return result;
}

void sdk_core_engine_SDKOptions_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_core_engine_SDKOptions_release_handle_nullable(handle);

// End of SDKOptions "private" section.


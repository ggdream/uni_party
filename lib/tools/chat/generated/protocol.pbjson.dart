///
//  Generated code. Do not modify.
//  source: lib/tools/chat/generated/protocol.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use pingMessageDescriptor instead')
const PingMessage$json = const {
  '1': 'PingMessage',
};

/// Descriptor for `PingMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pingMessageDescriptor = $convert.base64Decode('CgtQaW5nTWVzc2FnZQ==');
@$core.Deprecated('Use ackMessageDescriptor instead')
const AckMessage$json = const {
  '1': 'AckMessage',
};

/// Descriptor for `AckMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ackMessageDescriptor = $convert.base64Decode('CgpBY2tNZXNzYWdl');
@$core.Deprecated('Use retMessageDescriptor instead')
const RetMessage$json = const {
  '1': 'RetMessage',
};

/// Descriptor for `RetMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List retMessageDescriptor = $convert.base64Decode('CgpSZXRNZXNzYWdl');
@$core.Deprecated('Use textMessageDescriptor instead')
const TextMessage$json = const {
  '1': 'TextMessage',
  '2': const [
    const {'1': 'data', '3': 1, '4': 1, '5': 9, '10': 'data'},
  ],
};

/// Descriptor for `TextMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List textMessageDescriptor = $convert.base64Decode('CgtUZXh0TWVzc2FnZRISCgRkYXRhGAEgASgJUgRkYXRh');
@$core.Deprecated('Use binaryMessageDescriptor instead')
const BinaryMessage$json = const {
  '1': 'BinaryMessage',
  '2': const [
    const {'1': 'sign', '3': 1, '4': 1, '5': 9, '10': 'sign'},
  ],
};

/// Descriptor for `BinaryMessage`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List binaryMessageDescriptor = $convert.base64Decode('Cg1CaW5hcnlNZXNzYWdlEhIKBHNpZ24YASABKAlSBHNpZ24=');

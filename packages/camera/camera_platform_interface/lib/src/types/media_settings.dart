// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: avoid_equals_and_hash_code_on_mutable_classes

import 'resolution_preset.dart';

/// The camera settings for preview and recording.
class MediaSettings {
  /// Creates a new instance of [MediaSettings].
  ///
  /// - [resolutionPreset] affects the quality of video recording and image capture.
  /// - [previewResolutionPreset] affects the quality of camera preview. If not specified,
  ///   it will use [ResolutionPreset.medium].
  /// - [enableAudio] controls audio presence in recorded video.
  /// - [fps] controls rate at which frames should be captured by the camera in frames per second.
  /// - [videoBitrate] controls the video encoding bit rate for recording.
  /// - [audioBitrate] controls the audio encoding bit rate for recording.
  MediaSettings({
    this.resolutionPreset,
    this.previewResolutionPreset,
    bool enableAudio = true,
    this.fps,
    this.videoBitrate,
    this.audioBitrate,
  })  : assert(fps == null || fps > 0, 'fps must be null or greater than zero'),
        assert(videoBitrate == null || videoBitrate > 0,
            'videoBitrate must be null or greater than zero'),
        assert(audioBitrate == null || audioBitrate > 0,
            'audioBitrate must be null or greater than zero'),
        _enableAudio = enableAudio;

  /// The resolution preset for video recording and image capture.
  final ResolutionPreset? resolutionPreset;

  /// The resolution preset for camera preview only.
  /// If not specified, it will use [ResolutionPreset.medium].
  final ResolutionPreset? previewResolutionPreset;

  /// Rate at which frames should be captured by the camera in frames per second.
  final int? fps;

  /// The target video encoding bit rate in bits per second.
  final int? videoBitrate;

  /// The target audio encoding bit rate in bits per second.
  final int? audioBitrate;

  final bool _enableAudio;

  /// Whether to include audio when recording video.
  bool get enableAudio => _enableAudio;

  /// Creates a copy of this [MediaSettings] with the given fields replaced with new values.
  MediaSettings copyWith({
    ResolutionPreset? resolutionPreset,
    ResolutionPreset? previewResolutionPreset,
    bool? enableAudio,
    int? fps,
    int? videoBitrate,
    int? audioBitrate,
  }) {
    return MediaSettings(
      resolutionPreset: resolutionPreset ?? this.resolutionPreset,
      previewResolutionPreset: previewResolutionPreset ?? this.previewResolutionPreset ?? ResolutionPreset.medium,
      enableAudio: enableAudio ?? this.enableAudio,
      fps: fps ?? this.fps,
      videoBitrate: videoBitrate ?? this.videoBitrate,
      audioBitrate: audioBitrate ?? this.audioBitrate,
    );
  }

  /// Converts the instance to a JSON compatible map.
  Map<String, dynamic> toJson() => <String, dynamic>{
        'resolutionPreset': resolutionPreset?.toString(),
        'previewResolutionPreset': previewResolutionPreset?.toString(),
        'enableAudio': enableAudio,
        if (fps != null) 'fps': fps,
        if (videoBitrate != null) 'videoBitrate': videoBitrate,
        if (audioBitrate != null) 'audioBitrate': audioBitrate,
      };

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is MediaSettings &&
        other.resolutionPreset == resolutionPreset &&
        other.previewResolutionPreset == previewResolutionPreset &&
        other.enableAudio == enableAudio &&
        other.fps == fps &&
        other.videoBitrate == videoBitrate &&
        other.audioBitrate == audioBitrate;
  }

  @override
  int get hashCode => Object.hash(
        resolutionPreset,
        previewResolutionPreset,
        enableAudio,
        fps,
        videoBitrate,
        audioBitrate,
      );

  @override
  String toString() {
    return 'MediaSettings{'
        'resolutionPreset: $resolutionPreset, '
        'previewResolutionPreset: $previewResolutionPreset, '
        'fps: $fps, '
        'videoBitrate: $videoBitrate, '
        'audioBitrate: $audioBitrate, '
        'enableAudio: $enableAudio}';
  }
}

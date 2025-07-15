import 'package:flutter/material.dart';

class Sound {
  final String id;
  final String title;
  final String? mood;
  final String? artist;
  final String duration;
  final IconData? iconData;
  final Color? iconBackgroundColor;
  final bool isFavorite;

  Sound({
    required this.id,
    required this.title,
    this.mood,
    this.artist,
    required this.duration,
    this.iconData,
    this.iconBackgroundColor,
    this.isFavorite = false,
  });

  Sound copyWith({
    String? id,
    String? title,
    String? mood,
    String? artist,
    String? duration,
    IconData? iconData,
    Color? iconBackgroundColor,
    bool? isFavorite,
  }) {
    return Sound(
      id: id ?? this.id,
      title: title ?? this.title,
      mood: mood ?? this.mood,
      artist: artist ?? this.artist,
      duration: duration ?? this.duration,
      iconData: iconData ?? this.iconData,
      iconBackgroundColor: iconBackgroundColor ?? this.iconBackgroundColor,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}

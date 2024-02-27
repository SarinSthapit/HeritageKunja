import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Events {
  final String eventId;
  final String username;
  final String datePublished;
  final String title;
  final String eventDate;
  final String eventTime;
  final String eventLocation;
  final String eventImage;
  final List participants;
  final bool isGoing;

  const Events(
      {required this.eventId,
      required this.username,
      required this.datePublished,
      required this.title,
      required this.eventDate,
      required this.eventTime,
      required this.eventLocation,
      required this.eventImage,
      required this.participants,
      required this.isGoing});

  Map<String, dynamic> toJson() => {
        "eventId": eventId,
        "username": username,
        "datePublished": datePublished,
        "title": title,
        "eventDate": eventDate,
        "eventTime": eventTime,
        "eventLocation": eventLocation,
        "eventImage": eventImage,
        "participants": participants,
        "isGoing": isGoing,
      };

  static Events fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Events(
      eventId: snapshot['eventId'],
      username: snapshot['username'],
      datePublished: snapshot['datePublished'],
      title: snapshot['title'],
      eventDate: snapshot['eventDate'],
      eventTime: snapshot['eventTime'],
      eventLocation: snapshot['eventLocation'],
      eventImage: snapshot['eventImage'],
      participants: snapshot['participants'],
      isGoing: snapshot['isGoing'],
    );
  }
}

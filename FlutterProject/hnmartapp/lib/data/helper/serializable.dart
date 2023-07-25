class Serializable {
  static Object? asNull(_) => null;

  static EventType fromEvent(v) {
    if (v is int) {
      switch (v) {
        case 0:
          return EventType.normal;
        case 1:
          return EventType.normal;
        case 2:
          return EventType.giveaway;
        case 3:
          return EventType.stamp;
      }
    }

    return EventType.normal;
  }
}

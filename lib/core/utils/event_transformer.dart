import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_transform/stream_transform.dart';

EventTransformer<E> throttleDroppable<E>() {
  return (events, mapper) {
    return droppable<E>()
        .call(events.throttle(const Duration(milliseconds: 100)), mapper);
  };
}

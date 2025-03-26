// class SuggestedExerciseModel {
//   final String imageUrl;
//   final String title;
//   final String description;
//   SuggestedExerciseModel({
//     required this.imageUrl,
//     required this.title,
//     required this.description,
//   });
// }


class SuggestedExerciseModel {
  final int id;
  final String phase;
  final String description;
  final int sequenceLength;
  final List<Sequence> sequences;
  final double duration;
  final Props props;

  SuggestedExerciseModel({
    required this.id,
    required this.phase,
    required this.description,
    required this.sequenceLength,
    required this.sequences,
    required this.duration,
    required this.props,
  });

  factory SuggestedExerciseModel.fromJson(Map<String, dynamic> json) {
    var sequenceList = json['sequences'] as List;
    List<Sequence> sequences = sequenceList.map((i) => Sequence.fromJson(i)).toList();

    return SuggestedExerciseModel(
      id: json['id'],
      phase: json['phase']??'',
      description: json['description']??'',
      sequenceLength: json['sequence_length']??[],
      sequences: sequences,
      duration: json['duration']??'',
      props: Props.fromJson(json['props']),
    );
  }
}

class Sequence {
  final int id;
  final int order;
  final String videoId;
  final String title;
  final double duration;
  final String? thumbnail;
  final String video;
  final List<dynamic> interactives;

  Sequence({
    required this.id,
    required this.order,
    required this.videoId,
    required this.title,
    required this.duration,
    this.thumbnail,
    required this.video,
    required this.interactives,
  });

  factory Sequence.fromJson(Map<String, dynamic> json) {
    return Sequence(
      id: json['id'],
      order: json['order']??'',
      videoId: json['video_id']??'',
      title: json['title']??'',
      duration: json['duration']??'',
      thumbnail: json['thumbnail']??'',
      video: json['video']??'',
      interactives: json['interactives']??'',
    );
  }
}

class Props {
  final bool propsWall;
  final bool propsBlanket;
  final bool propsBolster;
  final bool propsBelt;
  final bool propsBlocks;

  Props({
    required this.propsWall,
    required this.propsBlanket,
    required this.propsBolster,
    required this.propsBelt,
    required this.propsBlocks,
  });

  factory Props.fromJson(Map<String, dynamic> json) {
    return Props(
      propsWall: json['props_wall']??'',
      propsBlanket: json['props_blanket']??'',
      propsBolster: json['props_bolster']??'',
      propsBelt: json['props_belt']??'',
      propsBlocks: json['props_blocks']??'',
    );
  }
}

import 'package:equatable/equatable.dart';

/// "extends [Equatable]" to make it easier to compare objects.
/// it is a base class that facilitates operator == and hashCode overrides.

class Quote extends Equatable {
  final String author;
  final int id;
  final String content;
  final String permalink;

  const Quote(
      {required this.author,
      required this.id,
      required this.content,
      required this.permalink});

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

/*
    {
    "author": "Unknown",
    "id": 21,
    "quote": "XML is like violence – if it doesn’t solve your problems, you are not using enough of it.",
    "permalink": "http://quotes.stormconsultancy.co.uk/quotes/21"
    }
 */

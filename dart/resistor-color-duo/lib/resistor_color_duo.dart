class ResistorColorDuo {
  var color_map = {
    'black':  '0',
    'brown':  '1',
    'red':    '2',
    'orange': '3',
    'yellow': '4',
    'green':  '5',
    'blue':   '6',
    'violet': '7',
    'grey':   '8',
    'white':  '9',
  };

  int value(List<String> colors) {
    var s = "";
    for (final color in colors) {
      if (color_map[color] != null) {
        s += color_map[color] as String;
      }
    }
    return int.parse(s);
  }
}

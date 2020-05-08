class BPMCounterBrain {
  DateTime _firstTap;
  DateTime _lastTap;
  int _numberOfTaps = 0;
  double _rawBpm = 110.0;
  int _bpm = 110;

  int getBpm() => _bpm;
  double getRawBpm() => _rawBpm;
  int getNumberOfTaps() => _numberOfTaps;

  void calculateBpm() {
    _numberOfTaps++;
    if (_firstTap == null) {
      _firstTap = DateTime.now();
      _lastTap = _firstTap;
    } else {
      // It is important to calculate deltaTime before updating lastTap variable
      Duration deltaTime = DateTime.now().difference(_lastTap);
      _lastTap = DateTime.now();
      // Check if there is more than two seconds since last tap
      if (deltaTime.inMilliseconds >= 2000) {
        _firstTap = null;
        _lastTap = null;
        _numberOfTaps = 0;
        _bpm = 0;
      } else {
        Duration totalTime = _lastTap.difference(_firstTap);
        _rawBpm = ((_numberOfTaps - 1) * 60000) / totalTime.inMilliseconds;
        _bpm = _rawBpm.round();
        print('_bpm: $_bpm');
      }
    }
  }
}

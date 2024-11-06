/// MAKES THE FUNCTION SLEEP FOR DEFINED MILLISECONDS
Future sleepForMilliseconds(int milliseconds) async {
  return Future.delayed(Duration(milliseconds: milliseconds));
}

extension NumExtension on num{
  String convertToPercentage(){
    return '${((this)*10).toDouble().toStringAsPrecision(2)} %';
  }
}
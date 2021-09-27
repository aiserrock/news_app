extension PowerString on String {
  String first() {
    int startIndex = 0, indexOfSpace;
    indexOfSpace = this.indexOf(' ', startIndex);
    if (indexOfSpace == -1) {
      //-1 is when character is not found
      return this;
    }
    var result = this.substring(0, indexOfSpace);
    return result.toUpperCase() + ' - ';
  }
  // special method to remove [..]
  String removeLast() {
    var indexOfSpace = this.lastIndexOf('[');
    if (indexOfSpace == -1) {
      //-1 is when character is not found
      return this;
    }
    return this.substring(0, indexOfSpace);
  }
  String removeFirst() {
    int startIndex = 0, indexOfSpace;
    indexOfSpace = this.indexOf(' ', startIndex);
    if (indexOfSpace == -1) {
      //-1 is when character is not found
      return this;
    }
    return this.substring(indexOfSpace,this.length-1);
  }
}

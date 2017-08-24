var Pangram = function(txt){
  this.ALPHABET = 'abcdefghijklmnopqrstuvwxyz';
  this.text = txt.toLowerCase();
}

Pangram.prototype.isPangram = function(){
  if('undefined' === typeof this.text) {
    return false;
  }
  var result = true;
  for(var i=0; i<this.ALPHABET.length; i++){
    result = result && (this.text.indexOf(this.ALPHABET[i])>=0);
    if(!result){
      return result;
    }
  }
  return result != null;
}

module.exports = Pangram;

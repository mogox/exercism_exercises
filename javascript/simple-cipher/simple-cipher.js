var Cipher = function(key_value){
  if(key_value !== undefined){
    if(key_value.length === 0 || !key_value.match(/[a-z]+/)) {
      throw new Error('Bad key');
    }
    this.key = key_value;
  } else {
     this.key = 'aaaaaaaaaaaaaaaaaa';
  }

  this.MAX_CHAR_VAL = 'z'.charCodeAt(0);
  this.WRAP = 'z'.charCodeAt(0) - 'a'.charCodeAt(0) + 1;
}

Cipher.prototype.keyShiftAt = function(index){
  return this.key.charCodeAt(index) - 'a'.charCodeAt(0);
}

Cipher.prototype.wrap = function(char){
  if(char > this.MAX_CHAR_VAL){
    return char - this.WRAP;
  }
  return char;
}

Cipher.prototype.encode =  function(message) {
  var result = [];
  var char;
  for(var i=0; i < message.length; i++){
    var char = message.charCodeAt(i) + this.keyShiftAt(i);
    result.push(this.wrap(char));
  }
  return String.fromCharCode(...result);
}

Cipher.prototype.decode = function(message) {
  var result = [];
  for(var i=0; i < message.length; i++){
    var char = message.charCodeAt(i) - this.keyShiftAt(i);
    result.push(this.wrap(char));
  }
  return String.fromCharCode(...result);
}

module.exports = Cipher;

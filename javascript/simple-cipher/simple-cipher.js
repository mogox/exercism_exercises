var Cipher = function(key_value){
  this.MIN_CHAR_VAL = 'a'.charCodeAt(0);
  this.MAX_CHAR_VAL = 'z'.charCodeAt(0);
  this.WRAP = this.MAX_CHAR_VAL - this.MIN_CHAR_VAL + 1;

  if(key_value !== undefined){
    if(key_value.length === 0 || !key_value.match(/[a-z]+/)) {
      throw new Error('Bad key');
    }
    this.key = key_value;
  } else {
    this.key = this.randomKey();
  }
}

Cipher.prototype.randomInt = function () {
  var min = Math.ceil(this.MIN_CHAR_VAL);
  var max = Math.floor(this.MAX_CHAR_VAL);
  //The maximum is exclusive and the minimum is inclusive
  return Math.floor(Math.random() * (max - min)) + min;
}

Cipher.prototype.randomKey = function() {
  var newKey = [];
  for(var i=0;i<100;i++){
    newKey.push(this.randomInt());
  }
  return String.fromCharCode(...newKey);
}

Cipher.prototype.keyShiftAt = function(index){
  return this.key.charCodeAt(index) - this.MIN_CHAR_VAL;
}

Cipher.prototype.wrap = function(char){
  if(char > this.MAX_CHAR_VAL){
    return char - this.WRAP;
  }else if(char < this.MIN_CHAR_VAL) {
    return char + this.WRAP
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

function codeEvalExecute(line) {
  var ary = line.split(" ");
  var out = [ary[0]];
  
  var i;
  for(i = 1; i < ary.length; i++) {
    var j = ary[i];
    if(out.indexOf(j) === -1) {
      out.push(j);
    }
    else {
      var f = [];
      var k;
      for(k = out.indexOf(j); k < out.length; k++) {
        f.push(out[k]);
      }
      return(f.join(" "));  
    }
  }
  
  return null;
}

console.log(codeEvalExecute("1 2 3 4 5"));
console.log(codeEvalExecute("2 0 6 3 1 6 3 1 6 3 1"));

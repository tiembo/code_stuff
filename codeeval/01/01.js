function codeEvalExecute(line) {
  var ary = line.split(" ");
  var fizz = ary[0];
  var buzz = ary[1];
  
  var output = [];
  
  var i;
  for(i = 1; i <= ary[2]; i++) {
    if((i % (fizz * buzz)) === 0) {
      output.push("FB");
    }
    else if((i % fizz) === 0) {
      output.push("F");
    }
    else if((i % buzz) === 0) {
      output.push("B");
    }
    else {
      output.push(i);
    }
  }
  return output.join(" ");
}

//console.log(codeEvalExecute("3 5 10"));
//console.log(codeEvalExecute("2 7 15"));
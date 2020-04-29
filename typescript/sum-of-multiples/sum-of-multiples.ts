function SumOfMultiples(multiples: Array<Number>) {

  return { to: function(sumTo: Number) {
    var sum = 0;
    for(var i = 1; i< sumTo; i++) {
      let counted = false;
      multiples.forEach(function(multiple) {
        if (Number(i) % Number(multiple) == 0 && counted == false) {
          sum = Number(sum) + Number(i);
          counted = true
        }
      })
    }
    return sum;
  }}
}

export default SumOfMultiples
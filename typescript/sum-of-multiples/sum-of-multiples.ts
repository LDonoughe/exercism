function SumOfMultiples(multiples: Array<Number>) {

  return { to: function(sumTo: Number) {
    var sum = 0;
    // console.log(sum)
    // console.log(sumTo)
    // console.log(Array(sumTo))
    for(var i = 1; i< sumTo; i++) {
      // console.log(i)
      // let counted = false;
      // return multiples
      multiples.forEach(function(multiple) {
        // debugger;
        // console.log(multiple)
        if (Number(i) % Number(multiple) == 0 && true) {
          sum = Number(sum) + Number(multiple);
          // console.log(sum)
          // counted = true
        }
      })
    }
    // console.log(sum)
    return sum;
  }}
}

export default SumOfMultiples
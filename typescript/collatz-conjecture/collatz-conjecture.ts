class CollatzConjecture {
    static steps(number: number) {
      return CollatzConjecture.collatzHelp(number, 0);
    }

    static collatzHelp: (number: number, count: number) => number = 
      function(number, count) {
      if (number < 1) {
        throw 'Only positive numbers are allowed';
      }
      if (number === 1) {
        return count;
      }
      count = count + 1
      if (number % 2 === 0) {
        return CollatzConjecture.collatzHelp(number/2, count)
      } else {
        return CollatzConjecture.collatzHelp(number*3 + 1, count)
      }
    }
}

export default CollatzConjecture
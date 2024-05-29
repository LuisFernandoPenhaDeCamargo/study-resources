const handler = {
    log: function(element) {
      console.log(element);
    }
  };
  
  const numbers = [1, 2, 3, 4, 5];
  numbers.forEach(function(number) {
    this.log(number);
  }, handler);  
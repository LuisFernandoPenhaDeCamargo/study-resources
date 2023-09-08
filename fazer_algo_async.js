function fazerAlgoAsync(callback) {
    setTimeout(function () {
      console.log("A operação assíncrona está concluída.");
      callback(); //Chamando a função de callback após a conclusão da operação.
    }, 2000);     //Espera 2 segundos antes de executar.
  }
  
  function minhaCallback() {
    console.log("A callback foi acionada.");
  }
  
  fazerAlgoAsync(minhaCallback);
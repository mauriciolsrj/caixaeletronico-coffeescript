class CaixaEletronico
  pretendido = 0
  segue = true
  cedulas = { 
    cem: { valor: 100, notas: 0},
    cinquenta: { valor: 50, notas: 0},
    vinte: { valor: 20, notas: 0},
    cinco: { valor: 5, notas: 0},
    dois: { valor: 2, notas: 0},
  }

  sacar: (valor) -> 
    console.info "Iniciando operação de saque para R$ " + valor
    pretendido = valor

    moedas = for moeda, item of cedulas
      if segue
        resolver(item)
        deveProsseguir(item)

    if pretendido > 0
      console.info "Impossível sacar esse valor"
    else
      moedas = for moeda, item of cedulas
       console.info item.notas + " notas de " + moeda
       item.notas = 0

    segue = true
    pretendido = 0

  resolver = (moeda) -> 
    resto = pretendido % moeda.valor
    notas = Math.floor(pretendido / moeda.valor)
    pretendido = pretendido - notas * moeda.valor
    moeda.notas = notas

  deveProsseguir = (moeda) -> 
    segue = (pretendido % moeda.valor >= 0) 

caixa = new CaixaEletronico

caixa.sacar 29899
caixa.sacar 200
algoritmo "semnome"
// Fun??o :
// Autor :
// Data : 19/10/2018
// Se??o de Declara??es
var
nomeUsuario: literal
loginUsuario: literal
senhaUsuario: literal
saldoUsuario: real
saldoInicial: real
opcaoInicial: inteiro
opcaoEscolhida: inteiro
ehLogadoComSucesso: logico
ehOpcaoEscolhidaInvalida: logico
loginDigitado: literal
senhaDigitada: literal

//valorDeposito: real
valorSaque: real
ehSair: logico
inicio
// Se??o de Comandos

procedimento exibirCabecalho()
inicio
escreval("----------------- BANCO DE VIACREDI -----------------")
escreval("---------- Bem vindo ", nomeusuario, "------------")
fimprocedimento

procedimento pedirValorDeposito()
var
LValorDeposito: real
inicio
escreval("Qual valor voc? deseja depositar?")
leia(LValorDeposito)
depositar(LValorDeposito)
fimprocedimento

procedimento depositar(ParametroValorDeposito: real)
inicio
se ParametroValorDeposito > 0 entao
   saldoUsuario:= saldoUsuario + ParametroValorDeposito
senao
   escreval("Valor do dep?sito inv?lido, favor confira os dados informados")
fimse
fimprocedimento

funcao validarLogin(PLogin: literal; PSenha: literal): logico
var
ehLoginValido: logico
inicio
se (PLogin = "a") e (PSenha = "a") entao
   ehLoginValido := verdadeiro
senao
   ehLoginValido := falso
fimse
 retorne ehLoginValido
fimfuncao


//Criando usu?rio ficticio
nomeUsuario:= "Marcio Michelluzzi"
loginUsuario:= "a"
senhaUsuario:= "a"
saldoInicial:= 1000
saldoUsuario:= 1000
ehSair:= falso


escreval("----------------- BANCO DE VOC?S -----------------")

escreval("Escolha uma das op??es")
escreval("1 - Cadastrar")
escreval("2 - Acessar")

leia(opcaoInicial)

limpatela

escolha opcaoInicial
caso 1 //Cadastro de usuario
   //Cadastro do usuario
   escreval("----------------- BANCO DE VOC?S -----------------")
   escreval("--------------- Cadastro de usu?rio --------------")
   escreval("Informe seu nome:")
   leia(nomeUsuario)
   escreval("Informe um login:")
   leia(loginUsuario)
   escreval("Informe uma senha:")
   leia(senhaUsuario)
   escreval("Informe o valor do dep?sito inicial:")
   leia(saldoInicial)
   EhLogadoComSucesso := verdadeiro
   //Fim do cadastro do usuario
caso 2 //Login de usuario
   escreval("----------------- BANCO DE VOC?S -----------------")
   escreval("----------------- Acesso a conta -----------------")
   escreval("Digite seu login: ")
   leia(loginDigitado)

   escreval("Digite seu senha: ")
   leia(senhaDigitada)

   ehLogadoComSucesso:= validarLogin(loginDigitado, senhaDigitada)
outrocaso
   escreval("Op??o inv?lida")
fimescolha

limpatela

//Se o usu?rio estiver logado com sucesso
se EhLogadoComSucesso entao
   //Resto do codigo da conta

   enquanto ehSair = falso faca
      exibirCabecalho()

      ehOpcaoEscolhidaInvalida:= verdadeiro
      enquanto EhOpcaoEscolhidaInvalida = verdadeiro faca

         escreval("Qual opera??o voc? deseja realizar")
         escreval("1 - Saque")
         escreval("2 - Dep?sito")
         escreval("3 - Extrato")
         escreval("4 - Pagamento")
         escreval("5 - Sair")
         leia(opcaoEscolhida)

         limpatela()

         se (opcaoEscolhida < 1) ou (opcaoEscolhida > 5) entao
            ehOpcaoEscolhidaInvalida:= verdadeiro
         senao
            ehOpcaoEscolhidaInvalida:= falso
         fimse
      fimenquanto

      escolha opcaoEscolhida

      caso 1
         //Saque
         exibirCabecalho()
         escreval("Qual valor voc? deseja sacar?")
         leia(valorSaque)

         se (valorSaque > 0) e (valorSaque <= saldoUsuario) entao
            saldoUsuario:= saldoUsuario - valorSaque
         senao
            escreval("Valor do saque inv?lido, favor confira os dados informados")
         fimse
      caso 2
         //Dep?sito
         exibirCabecalho()
         PedirValorDeposito()
      caso 3
         //Extrato
         exibirCabecalho()
         escreval("Cliente: ", nomeUsuario)
         escreval("Saldo em conta: ", saldoUsuario)
      caso 4
         //Pagamento
         exibirCabecalho()
         escreval("Qual valor voc? deseja pagar?")
         leia(valorSaque)

         se (valorSaque > 0) e (valorSaque <= saldoUsuario) entao
            saldoUsuario:= saldoUsuario - valorSaque
         senao
            escreval("Valor do pagamento inv?lido, favor confira os dados informados")
         fimse
      caso 5
         //sair
         ehSair:= verdadeiro
      outrocaso
         escreval("Op??o inv?lida")
      fimescolha
   fimenquanto
senao
   escreval("Falha realizar login")
fimse

fimalgoritmo

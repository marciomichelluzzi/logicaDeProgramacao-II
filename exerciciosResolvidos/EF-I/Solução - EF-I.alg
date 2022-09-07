algoritmo "semnome"
// Função :
// Autor :
// Data : 19/10/2018
// Seção de Declarações
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
// Seção de Comandos

procedimento exibirCabecalho()
inicio
escreval("----------------- BANCO DE VIACREDI -----------------")
escreval("---------- Bem vindo ", nomeusuario, "------------")
fimprocedimento

procedimento pedirValorDeposito()
var
LValorDeposito: real
inicio
escreval("Qual valor você deseja depositar?")
leia(LValorDeposito)
depositar(LValorDeposito)
fimprocedimento

procedimento depositar(ParametroValorDeposito: real)
inicio
se ParametroValorDeposito > 0 entao
   saldoUsuario:= saldoUsuario + ParametroValorDeposito
senao
   escreval("Valor do depósito inválido, favor confira os dados informados")
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


//Criando usuário ficticio
nomeUsuario:= "Marcio Michelluzzi"
loginUsuario:= "a"
senhaUsuario:= "a"
saldoInicial:= 1000
saldoUsuario:= 1000
ehSair:= falso


escreval("----------------- BANCO DE VOCÊS -----------------")

escreval("Escolha uma das opções")
escreval("1 - Cadastrar")
escreval("2 - Acessar")

leia(opcaoInicial)

limpatela

escolha opcaoInicial
caso 1 //Cadastro de usuario
   //Cadastro do usuario
   escreval("----------------- BANCO DE VOCÊS -----------------")
   escreval("--------------- Cadastro de usuário --------------")
   escreval("Informe seu nome:")
   leia(nomeUsuario)
   escreval("Informe um login:")
   leia(loginUsuario)
   escreval("Informe uma senha:")
   leia(senhaUsuario)
   escreval("Informe o valor do depósito inicial:")
   leia(saldoInicial)
   EhLogadoComSucesso := verdadeiro
   //Fim do cadastro do usuario
caso 2 //Login de usuario
   escreval("----------------- BANCO DE VOCÊS -----------------")
   escreval("----------------- Acesso a conta -----------------")
   escreval("Digite seu login: ")
   leia(loginDigitado)

   escreval("Digite seu senha: ")
   leia(senhaDigitada)

   ehLogadoComSucesso:= validarLogin(loginDigitado, senhaDigitada)
outrocaso
   escreval("Opção inválida")
fimescolha

limpatela

//Se o usuário estiver logado com sucesso
se EhLogadoComSucesso entao
   //Resto do codigo da conta

   enquanto ehSair = falso faca
      exibirCabecalho()

      ehOpcaoEscolhidaInvalida:= verdadeiro
      enquanto EhOpcaoEscolhidaInvalida = verdadeiro faca

         escreval("Qual operação você deseja realizar")
         escreval("1 - Saque")
         escreval("2 - Depósito")
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
         escreval("Qual valor você deseja sacar?")
         leia(valorSaque)

         se (valorSaque > 0) e (valorSaque <= saldoUsuario) entao
            saldoUsuario:= saldoUsuario - valorSaque
         senao
            escreval("Valor do saque inválido, favor confira os dados informados")
         fimse
      caso 2
         //Depósito
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
         escreval("Qual valor você deseja pagar?")
         leia(valorSaque)

         se (valorSaque > 0) e (valorSaque <= saldoUsuario) entao
            saldoUsuario:= saldoUsuario - valorSaque
         senao
            escreval("Valor do pagamento inválido, favor confira os dados informados")
         fimse
      caso 5
         //sair
         ehSair:= verdadeiro
      outrocaso
         escreval("Opção inválida")
      fimescolha
   fimenquanto
senao
   escreval("Falha realizar login")
fimse

fimalgoritmo

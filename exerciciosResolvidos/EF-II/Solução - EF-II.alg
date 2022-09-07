Algoritmo "semnome"
Var
   // Seção de Declarações das variáveis
   produtos: vetor[1..11] de caractere
   precos: vetor[1..11] de real
   mesas: vetor[1..11] de caractere
   clientes: vetor[1..11] de caractere
   comandas: vetor[1..11] de real

   executaSistema: logico
   opcaoEscolhida: inteiro

   //CONSTANTES
   STATUS_OCUPADO: caractere
   STATUS_LIVRE: caractere
   PRIMEIRA_MESA: inteiro
   ULTIMA_MESA: inteiro
   PRIMEIRO_PRODUTO: inteiro
   ULTIMO_PRODUTO: inteiro
Inicio
   // Seção de Comandos, procedimento, funções, operadores, etc...

   STATUS_OCUPADO := "Ocupado"
   STATUS_LIVRE := "Livre"
   PRIMEIRA_MESA:= 1
   ULTIMA_MESA:= 11
   PRIMEIRO_PRODUTO:= 1
   ULTIMO_PRODUTO:= 11

   //##############################################################################
   //################################### VALIDAÇÕES ###############################
   //Validar o numero do produto
funcao ehProdutoValido(numeroProduto: inteiro): logico
var
   resultado: logico
inicio
   resultado := verdadeiro
   se (numeroProduto < PRIMEIRO_PRODUTO) ou (numeroProduto > ULTIMO_PRODUTO) entao
      resultado:= falso
   fimse
   retorne resultado
fimfuncao

//Validar o numero da mesa
funcao ehMesaValida(numeroMesa: inteiro): logico
var
   resultado: logico
inicio
   resultado := verdadeiro
   se (numeroMesa < PRIMEIRA_MESA) ou (numeroMesa > ULTIMA_MESA) entao
      resultado:= falso
   fimse
   retorne resultado
fimfuncao

//##############################################################################
//##############################################################################


//##############################################################################
//########################### CARREGAR DADOS DO SISTEMA ########################

procedimento carregarDadosSistema()
inicio
   inicializarMesas()
   inicializarProdutos()
fimprocedimento

procedimento inicializarMesas()
var
   indice: inteiro
inicio
   //Inicializar as informções das mesas
   para indice de PRIMEIRA_MESA ate ULTIMA_MESA faca
      mesas[indice]:= "Livre"
   fimpara
fimprocedimento

procedimento inicializarProdutos()
inicio
   produtos[1]  := "X-Salada"
   produtos[2]  := "X-Bacon"
   produtos[3]  := "Salada Vegetariana"
   produtos[4]  := "Salada Vegana"
   produtos[5]  := "Cerveja"
   produtos[6]  := "Refrigerante 600ml"
   produtos[7]  := "Refrigerante 2L"
   produtos[8]  := "Cachorro Quente"
   produtos[9]  := "Pastel"
   produtos[10] := "Caldo de Cana"
   produtos[11] := "X-Infarto"

   precos[1]   := 22.90
   precos[2]   := 25.90
   precos[3]   := 19.90
   precos[4]   := 26.90
   precos[5]   := 22.90
   precos[6]   := 6.90
   precos[7]   := 4.90
   precos[8]   := 8.90
   precos[9]   := 9.90
   precos[10]  := 5.90
   precos[11]  := 29.90
fimprocedimento

//##############################################################################
//##############################################################################


//##############################################################################
//############################### EXIBIR INFORMAÇÕES ###########################

//Mostra o menu do sistema e le a opção escolhida
funcao exibirOpcoesMenu(): inteiro
var
   opcaoMenu: inteiro
inicio
   escreval("================= MEU RESTAURANTE ================")
   escreval("Menu")
   escreval("1 - Cadastrar Cliente")
   escreval("2 - Mostrar Mesas Disponíveis")
   escreval("3 - Anotar pedido")
   escreval("4 - Exibir valor da comanda")
   escreval("5 - Exibir total todas comandas")
   escreval("6 - Sair")
   leia(opcaoMenu)
   retorne opcaoMenu
fimfuncao

//Mostra o cardapio e retorna a opção escolhida
funcao exibirCardapio(): inteiro
var
   indice: inteiro
   numeroProduto: inteiro
inicio
   escreval("Cardápio")
   para indice de PRIMEIRO_PRODUTO ate ULTIMO_PRODUTO faca
      escreval(indice, " - ", produtos[indice], " - ", precos[indice], " R$")
   fimpara
   escreval("Qual produto você deseja anotar na comanda ???")
   leia(numeroProduto)
   retorne numeroProduto
fimfuncao

//Mostra a disponibilidade das mesas
procedimento exibirDisponibilidadeMesas()
var
   indice: inteiro
inicio
   para indice de PRIMEIRA_MESA ate ULTIMA_MESA faca
      escreval("Mesa ", indice, " - ", mesas[indice], " --- Cliente: ", clientes[indice])
   fimpara
fimprocedimento

//Mostrar a comanda do usuário
procedimento exibirComandaUsuario()
var
   mesaCliente: inteiro
   ehMesaValida: logico
inicio
   escreval("Digite a mesa da qual você deseja ver a comanda")
   leia(mesaCliente)

   se ehMesaValida(mesaCliente) entao
      escreval("O valor da comanda do cliente da mesa ", mesaCliente, " é de ", comandas[mesaCliente], " R$")
   senao
      escreval("ERRO - Mesa inexistente, escolha uma mesa válida")
   fimse
fimprocedimento

//##############################################################################
//##############################################################################


//##############################################################################
//#################### FUNÇÕES PRINCIPAIS DO SISTEMA ###########################

//Cadastrar o cliente e reservar uma mesa
procedimento cadastrarCliente()
var
   mesaEscolhida: inteiro
   nomeCliente: caractere
inicio
   escreval("A qual mesa (número) você deseja encaminhar o cliente?")
   leia(mesaEscolhida)

   se ehMesaValida(mesaEscolhida) entao
      se mesas[mesaEscolhida] = STATUS_LIVRE entao
         escreval("Qual o nome do cliente?")
         leia(nomeCliente)
         mesas[mesaEscolhida]:= STATUS_OCUPADO
         clientes[mesaEscolhida]:= nomeCliente
         escreval("Mesa reservada com sucesso, leve o cliente até a mesa")
      senao
         escreval("ERRO - Mesa já está ocupada, escolha uma mesa livre")
      fimse
   senao
      escreval("ERRO - Mesa inexistente, escolha uma mesa válida")
   fimse
fimprocedimento

//Calcular o total de todas as comandas
funcao calcularTotalTodasComandas(): real
var
   indice: inteiro
inicio
   para indice de PRIMEIRA_MESA ate ULTIMA_MESA faca
      totalComandas:= totalComandas + comandas[indice]
   fimpara
   retorne totalComandas
fimfuncao

//Anotar o pedido
procedimento anotarPedido()
var
   mesaEscolhida: inteiro
   produtoEscolhido: inteiro
inicio
   escreval("Digite a mesa da qual você deseja anotar o pedido")
   leia(mesaEscolhida)

   se ehMesaValida(mesaEscolhida) entao

      se mesas[mesaEscolhida] = STATUS_OCUPADO entao
         produtoEscolhido:= exibirCardapio()

         se ehProdutoValido(produtoEscolhido) entao
            comandas[mesaEscolhida]:= comandas[mesaEscolhida] + precos[produtoEscolhido]
            escreval("Produto anotado para a mesa ", mesaEscolhida)
         senao
            escreval("Produto inválido, selecione outro produto")
         fimse
      senao
           escreval("Você não pode anotar um pedido para uma mesa que não possui clientes")
      fimse


   senao
      escreval("ERRO - Mesa inexistente, escolha uma mesa válida")
   fimse
fimprocedimento
//##############################################################################
//##############################################################################


//##############################################################################
//#################### INICIO DA EXECUÇÃO DO SISTEMA ###########################

carregarDadosSistema()

executaSistema:= verdadeiro
//Inicio da exibição do meu sistema
enquanto executaSistema = verdadeiro faca

   escreva("")

   escolha  exibirOpcoesMenu()
   caso 1
      cadastrarCliente()
   caso 2
      exibirDisponibilidadeMesas()
   caso 3
      anotarPedido()
   caso 4
      exibirComandaUsuario()
   caso 5
      escreval("Total de todas as comandas = ", calcularTotalTodasComandas())
   caso 6
      limpatela
      executaSistema := falso
   outrocaso
      escreval("Opção inválida")
   fimescolha
fimenquanto

//##############################################################################
//##############################################################################


Fimalgoritmo
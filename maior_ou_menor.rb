def da_boas_vindas
  puts
  puts "        P  /_\  P                              "
  puts "       /_\_|_|_/_\                             "
  puts "   n_n | ||. .|| | n_n         Bem vindo ao    "
  puts "   |_|_|nnnn nnnn|_|_|     Jogo de Adivinhação!"
  puts "  |' '  |  |_|  |'  ' |                        "
  puts "  |_____| ' _ ' |_____|                        " 
  puts "        \__|_|__/                              "
  puts
  puts "Qual é o seu nome?" 
  nome = gets.strip # Método que limpa o começo e o fim da string
  puts "\n\n\n\n\n\n"
  puts "Começaremos o jogo para você, #{nome}"
  nome
end

def pede_dificuldade
  puts "Qual o nível de dificuldade?"
  puts "(1) Muito fácil (2) Fácil (3) Normal (4) Difícil (5) Impossível"
  puts "Escolha: "
  dificuldade = gets.to_i # Guarda o valor a ser digitado pelo usuario dentro da variavel 'dificuldade' (e converte pra inteiro) que vai ser verificada no método abaixo.
end

def sorteia_numero_secreto(dificuldade) # Verifica o valor da variável 'dificuldade' e assim atribui o valor da variável 'maximo'
	case dificuldade 
	when 1
		maximo = 30
	when 2
		maximo = 60
	when 3
		maximo = 100
	when 4
		maximo = 150
	else
		maximo = 200
	end
	puts "Escolhendo um número secreto entre 1 e #{maximo}..."
	sorteado = rand(maximo) + 1 # O rand vai escolher um valor randomico, vai variar de acordo com o valor da variável 'maximo' que foi determinado no método acima.
	puts "Escolhido... que tal adivinhar hoje nosso número secreto?"
	return sorteado # Retorna o valor escolhido randomicamente através do 'rand' (eu nao preciso usar o return, estou usando para ficar mais legivel)
end

def pede_um_numero(chutes, tentativa, limite_de_tentativas) # Recebe 3 argumentos que serão passados na hora que chama o método.
	puts "\n\n\n\n"
	puts "Tentativa #{tentativa} de #{limite_de_tentativas}"
	puts "Chutes até agora: #{chutes}"
	puts "Entre com o número"
	chute = gets.strip # Armazena o palpite do usuario 
	puts "Será que acertou? Você chutou #{chute}"
	return chute.to_i # No fim ela devolve (retorna) o chute, ja convertido em número através do método .to_i
end

def ganhou
  puts
  puts "             OOOOOOOOOOO               "
  puts "         OOOOOOOOOOOOOOOOOOO           "
  puts "      OOOOOO  OOOOOOOOO  OOOOOO        "
  puts "    OOOOOO      OOOOO      OOOOOO      "
  puts "  OOOOOOOO  #   OOOOO  #   OOOOOOOO    "
  puts " OOOOOOOOOO    OOOOOOO    OOOOOOOOOO   "
  puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  "
  puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  "
  puts "OOOO  OOOOOOOOOOOOOOOOOOOOOOOOO  OOOO  "
  puts " OOOO  OOOOOOOOOOOOOOOOOOOOOOO  OOOO   "
  puts "  OOOO   OOOOOOOOOOOOOOOOOOOO  OOOO    "
  puts "    OOOOO   OOOOOOOOOOOOOOO   OOOO     "
  puts "      OOOOOO   OOOOOOOOO   OOOOOO      "
  puts "         OOOOOO         OOOOOO         "
  puts "             OOOOOOOOOOOO              "
  puts
  puts "               Acertou!                "
  puts
end

def verifica_se_acertou(numero_secreto, chute)
	acertou = numero_secreto == chute # Ele compara se o numero secreto é igual ao palpite do usuario e armazena em 'acertou'
	if acertou # se acertou é true (numero_secreto == chute) entao ele chama o método 'acertou' que esta logo acima
		ganhou
		return true
	end
	maior = numero_secreto > chute # defini a variável 'maior' que no caso é quando o numero secreto é maior que o palpite e faz a comparação abaixo
	if maior
		puts "O número secreto é maior!"
	else
		puts "O número secreto é menor!"
	end
	return false # Mais uma vez eu nao preciso usar o return, estou usando somente para fixar
end

def joga(nome, dificuldade)
	numero_secreto = sorteia_numero_secreto dificuldade # Chama o método sorteia_numero_secreto sendo 'dificuldade' o unico parametro, linha 25

	limite_de_tentativas = 5 # Determina o valor da variável
	chutes = [] # Cria um array vazio
	pontos_ate_agora = 1000 # Determina o valor da variável

	for tentativa in 1..limite_de_tentativas # faz o for para percorrer 'tentativa'
		chute = pede_um_numero chutes, tentativa, limite_de_tentativas # Passando parametros sem os parenteses
		chutes << chute # inclui os palpites dentro do array

		if nome == "Guilherme"
			ganhou
			break
		end

		pontos_a_perder = (chute - numero_secreto).abs / 2.0
		pontos_ate_agora = pontos_ate_agora - pontos_a_perder 
		if verifica_se_acertou numero_secreto, chute
			break
		end
	end

	puts "Você ganhou #{pontos_ate_agora} pontos."
end

def nao_quer_jogar? 
	puts "Deseja jogar novamente? (S/N)"
	quero_jogar = gets.strip 
	nao_quero_jogar = quero_jogar.upcase == "N" # Se 'quero_jogar' for igual a 'N' então ela é armazenada em 'nao_quero_jogar'
end

nome = da_boas_vindas # chama os métodos nome e da_boas_vindas
dificuldade = pede_dificuldade

loop do
	joga nome, dificuldade
	break if nao_quer_jogar? # Ele faz o loop chamando os métodos joga, nome e dificuldade e só para quando nao_quer_jogar é True. (para isso quero_jogar tem que ser igual a N, linha 120)
end
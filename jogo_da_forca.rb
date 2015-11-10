def boas_vindas
	puts "Bem vindo a jogo da forca!"
	puts "Qual o seu nome?"
	nome = gets.strip
	puts "\n\n\""
	puts "Começaremos o jogo pra voce, #{nome}"
	nome
end

def sorteia_palavra_secreta
	puts "Escolhendo uma palavra..."
	puts "Escolhendo uma palavra..."
	palavra_secreta = "programador"
	puts "Escolhida uma palavra com #{palavra_secreta.size} letras... boa sorte!"
	palavra_secreta
end

def nao_quer_jogar?
	puts "Deseja jogar novamente? (S/N)"
	quero_jogar = gets.strip
	nao_quero_jogar = quero_jogar.upcase == "N" # se 'quero_jogar' é igual a 'N' é porque a pessoa NAO quer jogar.
end

nome = boas_vindas

def joga(nome)
	palavra_secreta = sorteia_palavra_secreta
	erros = 0
	chutes = []
	pontos_ate_agora = 0
	while erros < 5
		chute = pede_um_chute chutes, erros
		chutes << chute
	end
	puts "Voce ganhou #{pontos_ate_agora} pontos"
end

def pede_um_chute(chutes, erros)
	puts "Erros até agora: #{erros}"
	puts "Chutes até agora: #{chutes}"
	puts "Entre com a letra ou a palavra"
	chute = gets.strip
	puts "Sera que voce acertou? Voce chutou #{chute}"
	chute
end

chutou_uma_unica_letra = chute.size == 1
	if chutou_uma_unica_letra
	else
		acertou = chute == palavra_secreta
	if acertou
		puts "Parabéns! Acertou!"
		pontos_ate_agora += 100
	break
	else
	end
end

loop do
	joga nome 
	break if nao_quer_jogar?
end


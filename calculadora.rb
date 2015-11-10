# Implemente uma calculadora. O programa deve pedir 3 números ao usuário, a, b e operacao. Se operacao for igual 1, você deverá imprimir a soma de a + b. Se ela for 2, a subtração. Se for 3, a multiplicação. Se for 4, a divisão.

puts "Qual o primeiro valor?"
a = gets.chomp

puts "Qual o segundo valor?"
b = gets.chomp

soma = a.to_i + b.to_i
subtracao = a.to_i - b.to_i
multiplicacao = a.to_i * b.to_i
divisao = a.to_i / b.to_i

puts "Que tipo de operação voce deseja realizar?"
puts "Para ADIÇÃO, use (1)"
puts "Para SUBTRAÇÃO, use (2)"
puts "Para MULTIPLICAÇÃO, use (3)"
puts "Para DIVISÃO, use (4)"

operacao = gets.chomp

case operacao
	when '1' then puts "O resultado da soma entre #{a} + #{b} é: #{soma}"
	when '2' then puts "O resultado da subtração de #{a} - #{b} é: #{subtracao}" 
  when '3' then puts "O resultado da multiplicação de #{a} * #{b} é: #{multiplicacao}" 
	when '4' then puts "O resultado da divisão de #{a} / #{b} é: #{divisao}" 
	else puts "Opção não encontrada!"
end



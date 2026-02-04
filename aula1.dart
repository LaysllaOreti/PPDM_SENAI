// importa a biblioteca dart:io
// ela é necessária para usar entrada (stdin) e saída (stdout) de dados
import "dart:io";

// função principal do programa
// todo código Dart começa a execução pelo main()
void main() {

  // print pula linha automaticamente após mostrar o texto
  print("Olá");
  print("DS18!");

  // stdout.write NÃO pula linha
  // o próximo texto continua na mesma linha
  stdout.write("Olá ");
  stdout.write("DS18!");

  // print vazio apenas quebra a linha
  print("");

  // solicita que o usuário digite o nome
  print("Insira o seu nome completo: ");

  // lê o que o usuário digitou no teclado
  // readLineSync() retorna uma String ou null
  // por isso usamos String? (null safety)
  String? nome = stdin.readLineSync();

  // exibe o nome digitado usando interpolação de string
  print("Olá ser chamado(a): $nome");

  // solicita um número ao usuário
  stdout.write("Escreva um número aleatório: ");

  // lê o valor digitado como String
  // pode ser null se o usuário não digitar nada
  String? numeroAleatorio = stdin.readLineSync();

  // tenta converter a String para inteiro
  // tryParse retorna:
  // - um int se a conversão funcionar
  // - null se o usuário digitar letras ou algo inválido
  int? idade = int.tryParse(numeroAleatorio ?? "");

  // verifica se a conversão falhou
  if (idade == null) {
    // mensagem de erro caso não seja um número válido
    print("Valor inválido. Digite apenas números");

    // encerra o programa
    return;
  }

  // se chegou até aqui, significa que a conversão deu certo
  // exibe o número digitado
  print("Número digitado: $idade");
}

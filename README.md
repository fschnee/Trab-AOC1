[//]: # (usei o plugin `markdown-pdf` do atom para gerar o `.pdf`)
[//]: # (para instalar é só usar `apm install markdown-pdf`)

# Trabalho Prático Final
Esse repositório contém o [TPF][1] desenvolvido na disciplina de AOC1 no
semestre 2019-1 pela dupla Frederico Bueno Da Silva Schaun (M1) e Cesar Augusto
Vitoria Martins Junior (M1), que tem como objetivo implementar o [jogo da vida
de John Conway][2].

O jogo é um automato celular definido por um campo que pode conter uma
quantidade qualquer de células. Essas células podem assumir dois estados:
Viva/Populada ou Morta/Despopulada.

Sabendo disso, o jogo considera quatro regras básicas:
- Para qualquer celula viva
  - Se tem menos de dois vizinhos vivos morre (de solidão).
  - Se mais de três vizinhos vivos morre (de superpopulação).
  - Se tem dois ou três vizinhos vivos continua no mesmo estado para a próxima
  geração.
- Para qualquer celula morta
  - Se tem exatamente três vizinhos vivos torna-se uma célula viva.

[1]: resource/TrabalhoPratico_Final_2019-1.pdf
[2]: https://pt.wikipedia.org/wiki/Jogo_da_vida
---

### Implementação
Primeiramente, para o jogo funcionar corretamente devem estar habilitadas as
seguintes configurações no *MARS* (e as demais desabilitadas): `Settings >
Assemble all files in directory`, `Settings > Initialize Program Counter to
global 'main' if defined` e  `Settings > Permit extended (pseudo) instructions
and formats`.
Além disso, na nossa implementação o campo é representado pela ferramenta
`BitmapDisplay` do *MARS* e cada célula é representada por um pixel, sendo o
seu estado uma cor (Preto = Morta, Com cor = Viva) e, portanto, deve estar
habilitada também em `Tools > Bitmap Display` e devidamente configurada de
acordo com os campos definidos na parte de dados do [`Main.asm`][]
(Certifique-se que está conectada ao Mars).

[`Main.asm`]: src/Main.asm
---

### Execução
Para executar o trabalho basta carregar o qualquer arquivo de código do projeto
no simulador *MARS* configurado conforme especificado no tópico *Implementação*,
fazer *assemble* e rodar o programa

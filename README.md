# Framework de log para desenvolvimento em TL++.

Este framework adiciona algumas classes de log no repositório de objetos que podem ser invocadas de dentro do seu programa em TL++. Baseado no SLF4J, Logback e outros frameworks de mercado, este framework se destaca das funções padrões de Log da TOTVS por tratar níveis de log, formatos de exibição e estratégias de gravação.

## Como usar?

Clone este repositório ou faça download e então compile todos os arquivos. Exemplo de uso:

```
User Function LogExample
    Local oLogger := Log():New("My custom log name")

    oLogger:Debug("This is a debug message")
    oLogger:Info("This is a info message")
    oLogger:Error("This is a error message")
Return
```

O nível do log pode ser definido no parâmetro MV_LOGLEVE. Valores válidos são:
* ALL

* TRACE

* DEBUG

* INFO

* WARN

* ERROR

* FATAL

Se o parâmetro não existir, o valor padrão será INFO.

Caso não passe o nome do log no construtor da classe então o sistema usa a função ProcName para identificar o nome da classe/função de origem.

Parâmetros podem ser passados para o log sem se preocupar com o tipo da variável:
```
oLogger:Info("My name is {} and I will be {} years old at {}.", {"Josh", 42, dDatabase})
```
Output:
```
[20/09/2019][22:26:06.913]   [INFO]   My custom log name - My name is Josh and I will be 42 years old at 20/09/2019.
```
Você pode alterar este layout de saída criando um novo formatter com o layout da sua empresa ou do seu cliente.
## Contribuição

Este projeto é livre. Usem à vontade. Se encontrar algum bug reporte aqui no GitHub e se fizer alguma melhoria no código, contribua com um pull request :blush:

# Framework de log para desenvolvimento em AdvPL/TL++.

Este framework adiciona algumas classes de log no repositório de objetos que podem ser invocadas de dentro do seu programa TOTVS. Baseado no SLF4J, Logback e outros frameworks de mercado, este framework se destaca das funções padrões de Log da TOTVS por tratar níveis de log, formatos de exibição e estratégias de gravação.

## Como usar?

Clone este repositório ou faça download e então compile todos os arquivos. Exemplo de uso:

```
User Function LogTest
    Local oLogger
    Local oCustomLogger

    If !TCIsConnected()
		If !RpcSetEnv(COMPANY_CODE, BRANCH_CODE,,,, ProcName())
			ConOut("It was not possible to login in Protheus.")
			Return
		EndIf
	EndIf

    oLogger := Log():New()
    oCustomLogger := Log():New("My custom log")

    oLogger:All("This will be displayed always")
    oLogger:Trace("This is a trace message")
    oLogger:Debug("This is a debug message")
    oLogger:Info("This is an info message")
    oLogger:Warn("This is a warning message")
    oLogger:Error("This is an error message")
    oLogger:Fatal("This is a fatal message")

    oCustomLogger:Info("User {} had a bad experience creating the product {}.", "João", "001")
    oCustomLogger:Info("Bool {}, Integer {}, Char {}, Date {}", .T., 42, "Test", Date())
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
oLogger:Info("My name is {} and I will be {} years old at {}.", "Josh", 42, dDatabase)
```
Output:
```
[20/09/2019][22:26:06.913]   [INFO]   My custom log name - My name is Josh and I will be 42 years old at 20/09/2019.
```

## Formatters

Você pode alterar o layout de saída criando um novo formatter com o layout da sua empresa ou do seu cliente. O parâmetro MV_LOGFORM controla
qual implementação de formatter usar, caso não exista, o formatter padrão será o ```DEFAULT```.

## Appenders

Um appender define como seu log será impresso. Neste repositório atualmente existem dois appenders: ```CONSOLE``` e ```FILE``` para impressão no console do AppServer e impressão em arquivo de texto respectivamente. O Appender ativo é controlado pelo parâmetro MV_LOGAPP, caso não exista o valor padrão será CONSOLE.

Para o FILE appender, o parâmetro MV_LOGPATH controla a pasta ondes os arquivos de logs são gerados. Caso não exista, os logs serão gerados na pasta Protheus_Data\logs.

Implemente novos appenders conforme sua necessidade.

## Contribuição

Este projeto é livre. Use à vontade. Se encontrar algum bug reporte aqui no GitHub e se fizer alguma melhoria no código, contribua com um pull request :blush:

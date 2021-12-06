#include "protheus.ch"

#define COMPANY_CODE "01"
#define BRANCH_CODE "01"

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

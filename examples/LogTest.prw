#include "protheus.ch"

User Function LogTest
    Local oLogger := Log():New()
    Local oCustomLogger := Log():New("My custom log")

    oLogger:All("This will be displayed always")
    oLogger:Trace("This is a trace message")
    oLogger:Debug("This is a debug message")
    oLogger:Info("This is an info message")
    oLogger:Warn("This is a warning message")
    oLogger:Error("This is an error message")
    oLogger:Fatal("This is a fatal message")

    oCustomLogger:Info("User {} had a bad experience creating the product {}.", {"João", "001"})
    oCustomLogger:Info("Bool {}, Integer {}, Char {}, Date {}", {.T., 42, "Test", Date()})
Return
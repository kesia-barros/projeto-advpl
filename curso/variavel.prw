#INCLUDE 'TOTVS.CH'

/**

    TIPOS DE DADOS

NUMERICOS: 3 / 21.000 / 0.4 / 2000000
LOGICO: .T. / .F.
CARACTERE: "D" / "C"
DATA: DATE()
ARRAY: ("valor1", "valor2", "valor3")
BLOCO DE CODIGO: {|| VALOR := 1, MsgAlert ("Valor e igual a "+cValToChar(VALOR))}

**/
/*/{Protheus.doc} VARIAVEL
TIPOS DE VARIAVEIS
@type function
@author Administrador
@since 06/10/2021
/*/
user function VARIAVEL()
    Local nNum := 66
    Local lLogic := .T.
    Local cCarac := "String"
    Local dData := DATE()
    Local aArray := {"João", "Maria", "Jose"}
    Local bBloco := {|| nValor := 2, MsgAlert("O numero e: "+ CValToChar(nValor))}

    Alert(nNum)
    Alert(lLogic)
    Alert(CValToChar(cCarac))
    Alert(dData)
    Alert(aArray[1])
    Eval(bBloco)

Return 

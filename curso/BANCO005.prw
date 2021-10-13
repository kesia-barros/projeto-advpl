#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} BANCO005
BANCO005
@type function 
@author Administrador
@since 07/10/2021
/*/
user function BANCO005()
    Local aArea := SB1->(GetArea())
    Local aDados := {}
    Private LMSErroAuto := .F.

    //Adicionando dados bo vetor para teste de inclus�o na tabela SB1
    aDados := {;
                {"B1_COD", "111111",         Nil},;
                {"B1_DESC", "PRODUTO TESTE", Nil},;
                {"B1_TIPO", "GG",            Nil},;
                {"B1_UM", "PC",              Nil},;
                {"B1_LOCPAD", "01",          Nil},;
                {"B1_PICM", 0,               Nil},;
                {"B1_IPI", 0,                Nil},;
                {"B1_CONTRAT", "N",          Nil},;
                {"B1_LOCALIZ", "N",          Nil};
            } // Nil = N�o especificado.

    //chama cadastro de produto
    MSExecAuto({|x,y|MATA010(x,y)},aDados, 3) //numero da opera��o: 3 - opera��o de inclus�o, 4 - altera��o, 5 - exclus�o
    //caso ocorra um erro
    if LMSErroAuto
        Alert("Ocorreram erros durante a opera��o!")
        MostraErro()

    else
        MsgInfo("Opera��o finalizada!", "Aviso")
    ENDIF
    RestArea(aArea)

return

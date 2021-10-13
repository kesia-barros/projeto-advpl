#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} BANCO004
BANCO004
@type function
@author Administrador
@since 07/10/2021
/*/
user function BANCO004()
    Local aArea := SB1->(GetArea())
    Local cAltera := ""

    DbSelectArea('SB1')//seleciona a tabela
    SB1->(DbSetOrder(1))// indice 1
    SB1->(DbGoTop())// topo da tabela

    //iniciar a transação
    MsgInfo("A descrição do produto sera alterada!", "Atenção")

    if SB1->(dbSeek(FWxFilial('SB1')+ '01'))
        cAltera := replace(SB1->B1_DESC, "DOCE DE LEITE", "DOCE DE CAJU")
        RecLock('SB1', .F.) // .T. = incluir / .F. = Alterar
            B1_DESC := cAltera 
        SB1->(MsUnlock())
    endif 
    MsgAlert("Alteração efetuada!", "Atenção")
    RestArea(aArea)
RETURN

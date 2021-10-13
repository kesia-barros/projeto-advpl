#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} BANCO001
banco001
@type function 
@author Administrador
@since 06/10/2021
/*/
user function BANCO001()
    Local aArea := SB1->(GetArea())

    DbSelectArea("SB1")
    SB1->(DbSetOrder(1)) //Posiciona no indice 1
    SB1->(DbGoTop())

    //POSICIONA O PRODUTO DE CODIGO 01
    if SB1->(DbSeek(FWXFilial("SB1")+ "01"))
        Alert(SB1->B1_DESC)
    Endif

    RestArea(aArea)

RETURN

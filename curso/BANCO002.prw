#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} BANCO002
BANCO002
@type function 
@author Administrador
@since 06/10/2021
/*/
user function BANCO002()
    Local aArea := SB1->(GetArea())
    Local cMsg := ''

    DbSelectArea('SB1')
    SB1->(DbSetOrder(1))
    SB1->(DbGoTop())

    cMsg := Posicione('SB1',; // Area que esta ultilizando
                        1,; // O indice que esta utlizando
                        FWXfilial('SB1')+ '01',; // chave de pesquisa: indice 1(filial corrente (SB1) + codigo do produto (01))
                        'B1_DESC') // O compo que quer que retorne
    Alert("Descrição Produto: "+cMsg, "AVISO") 

    RestArea(aArea)


return

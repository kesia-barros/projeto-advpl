#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} DEBUG01
DEBUG01
@type function  
@author Kesia
@since 08/10/2021
/*/
user function DEBUG01()
    Local aArea := GetArea()
    Local aProduto := {}
    Local nCount := 0


    // Seleciona a tabela de produtos
    DbSelectArea("SB1")
    SB1->(DbSetOrder(1)) //Seleciona o indice
    Sb1->(DbGoTop())

    While ! SB1->(EoF()) //Enquanto não for final do arquivo
        aAdd(aProduto,{SB1->B1_COD,;
                        SB1->B1_DESC})

        nCount++
        SB1->(DbSkip())
    ENDDO

    MsgAlert("Quantidade de produtos encontrado: <b>" + cValToChar(nCount))

    nCount := 0 // Zerando o valor da variavel nCount

    RestArea(aArea)


return 

#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} ESTRREP
description
@type function
@version  
@author Administrador
@since 06/10/2021
@return variant, return_description
/*/
user function ESTRREP()
/*
    Local nCount
    Local nNum := 0

    for nCount := 0 To 10 STEP 2 //IMPLEMENTA DE 2 EM 2

    nNum += nCount

    NEXT
    Alert("Valor: "+ CValToChar(nNum))
    */

    //EXEMPLO DO COMANDO WHILE ENDDO

    /*Local nNum1 := 0 
    Local nNum2 := 10

    while nNum1 < nNum2
        nNum1++

    EndDo 
        Alert(nNum1 + nNum2)
    */

    Local nNum1 := 1
    Local cNome := 'RCTI'

    While nNum1 != 10 .and. cNome != "PROTHEUS"
        nNum1++
        if nNum1 == 5
        cNome := "PROTHEUS"
        ENDIF
    EndDo
    Alert("Numero: "+ cValToChar(nNum1))
    Alert("Nome: "+ cValToChar(cNome))
return

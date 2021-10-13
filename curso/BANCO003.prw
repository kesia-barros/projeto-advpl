#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} BANCO003
BANCO003
@type function
@author Administrador
@since 06/10/2021
/*/
user function BANCO003()
    Local aArea     := SB1->(GetArea())
    Local aDados    := {}
    Local nCount    := 0
    Local cAlias    := GetNextAlias()
    Local cConsulta := ""



    BeginSql alias cAlias
    
        SELECT 
            B1_FILIAL,
            B1_COD,  // retorna o codigo e a descrição do produto
            B1_DESC  
        FROM 
            %table:SB1% 
        WHERE 
            B1_MSBLQL != '1'
    EndSql
    
    cConsulta := Getlastquery()[2]
    MsgInfo("A consulta feita: " + cConsulta,"Consulta SQL")
    //Executando consulta acima

    while ! (cAlias)-> (EoF()) 
        AADD(aDados, (cAlias)->B1_COD) 
        AADD(aDados, (cAlias)->B1_DESC)
        (cAlias)->(DbSkip()) 
    ENDDO

    Alert(Len(aDados))
    For nCount := 1 To Len(aDados)
        MsgInfo(aDados[nCount])
    Next nCount 


    (cAlias)->(DbCloseArea())// para fechar 
    RestArea(aArea)
RETURN

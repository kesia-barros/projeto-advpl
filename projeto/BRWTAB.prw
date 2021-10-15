#INCLUDE "TOTVS.CH"

/*/{Protheus.doc} BRWTAB
BRWTAB
@type function  
@author Kesia
@since 08/10/2021
/*/
user function BRWTAB()
    Local aArea        := GetArea()
    Local cAlias       := "ZX0"
    Private cCadastro  := "AÇÕES"
    Private aRotina    := {}
    Private aCores     := {}

    AADD(aRotina, {"Pesquisar"  ,"AxPesqui"    ,0,1})
    AADD(aRotina, {"Visualizar" ,"AxVisual"    ,0,2})
    AADD(aRotina, {"Importar"   ,"u_ABREARQ()" ,0,3})
    AADD(aRotina, {"Excluir"    ,"AxDeleta"    ,0,5})
    AADD(aRotina, {"Legenda"    ,"u_LEGEND()"  ,0,6})

    AADD(aCores, {"ZX0_APROV = 'Aprovado'",  "BR_VERDE"})
    AADD(aCores, {"ZX0_APROV = 'Reprovado'", "BR_VERMELHO"})

    DbSelectArea(cAlias)
    (cAlias)->(DbSetOrder(1))

    dbGoTop()
    //mBrowse(,,,,cAlias,,,,,,aCores)
    mBrowse(6, 1, 22, 75, cAlias, , , , , , aCores)

    (cAlias)->(DbCloseArea())
    RestArea(aArea)

return

/*/{Protheus.doc} LEGEND
LEGEND
@type function 
@author Kesia
@since 14/10/2021
/*/
user function LEGEND()
    Local aLegenda     := {}

    AADD(aLegenda, {"BR_VERDE"    ,"Aprovado"})
    AADD(aLegenda, {"BR_VERMELHO" ,"Reprovado"})

    BrwLegenda(cCadastro, "Legenda", aLegenda)
return

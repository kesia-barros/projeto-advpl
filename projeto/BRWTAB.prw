#INCLUDE "TOTVS.CH"

/*/{Protheus.doc} BRWTAB
BRWTAB
@type function  
@author Kesia
@since 08/10/2021
/*/
user function BRWTAB()
    Local cAlias := "ZX0"
    Private cTitulo := "AÇÕES"
    Private aRotina := {}

    AADD(aRotina, {"Pesquisar"  ,"AxPesqui"    ,0,1})
    AADD(aRotina, {"Visualizar" ,"AxVisual"    ,0,2})
    AADD(aRotina, {"Importar"   ,"u_ABREARQ()" ,0,3})
    AADD(aRotina, {"Trocar"     ,"AxAltera"    ,0,4})
    AADD(aRotina, {"Excluir"    ,"AxDeleta"    ,0,5})

    DbSelectArea(cAlias)
    DbSetOrder(1)
    mBrowse(,,,,cAlias)


return

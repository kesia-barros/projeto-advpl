#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} MBRW00
MBRW00
@type function 
@author Administrador
@since 07/10/2021
/*/
user function MBRW00()
    local cAlias := "SB1"
    Private cTitulo := "Cadastro produto MBROWSE"
    Private aRotina := {}

    AADD(aRotina, {"Pesquisar"  ,"AxPesqui"    ,0,1})
    AADD(aRotina, {"Visualizar" ,"AxVisual"    ,0,2})
    AADD(aRotina, {"Incluir"    ,"AxInclui"    ,0,3})
    AADD(aRotina, {"Trocar"     ,"AxAltera"    ,0,4})
    AADD(aRotina, {"Excluir"    ,"AxDeleta"    ,0,5})
    AADD(aRotina, {"OlaMundo"   ,"U_OLAMUNDO"  ,0,6}) //outras ações

    DbSelectArea(cAlias)
    DbSetOrder(1)
    mBrowse(,,,,cAlias)
    //mBrowse(6,1,22,75,cAlias)

return

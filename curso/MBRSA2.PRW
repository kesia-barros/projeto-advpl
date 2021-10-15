#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} MBRSA2
MBRSA2
@type function
@author Administrador
@since 07/10/2021
/*/
user function MBRSA2()
    Local aArea         := GetArea()
    Local cAlias        := "SA2"
    Local aCores        := {}
    Local cFiltra       := "A2_FILIAL == '"+xFilial('SA2')+"' .And. A2_EST == 'MT'"
    Private cCadastro   := "Cadastro MBROWSE"
    Private aRotina     := {}
    Private aIndexSA2   := {}
    Private bFiltraBrw  := {||FilBrowse(cAlias, @aIndexSA2, @cFiltra)}

    AADD(aRotina, {"Pesquisar"  ,"AxPesqui"    ,0,1})
    AADD(aRotina, {"Visualizar" ,"AxVisual"    ,0,2})
    AADD(aRotina, {"Incluir"    ,"U_BInclui"   ,0,3})
    AADD(aRotina, {"Trocar"     ,"U_BAltera"   ,0,4})
    AADD(aRotina, {"Excluir"    ,"U_BDeleta"   ,0,5})
    AADD(aRotina, {"Legenda"    ,"U_BLegenda"  ,0,6})

    AADD(aCores,{"A2_TIPO == 'F'", "BR_VERDE"   })
    AADD(aCores,{"A2_TIPO == 'J'", "BR_AMARELO" })
    AADD(aCores,{"A2_TIPO == 'X'", "BR_LARANJA" })
    AADD(aCores,{"A2_TIPO == 'R'", "BR_MARROM"  })
    AADD(aCores,{"Empty(A2_TIPO)", "BR_PRETO"   })// se não for classificado

    DbSelectArea(cAlias)
    DbSetOrder(1)
    Eval(bFiltraBrw)

    dbGoTop()
    mBrowse(6,1,22,75,cAlias,,,,,,aCores)

    EndFilBrw(cAlias, aIndexSA2)
    (cAlias)->(DbCloseArea())
    RestArea(aArea)
return

//--------Função BInclui - inclusão------
/*/{Protheus.doc} BInclui
BInclui
@type function
@author Administrador
@since 07/10/2021
/*/
user function BInclui(cAlias, nReg, nOpc)
    Local nOpcao := 0
    nOpcao := AxInclui(cAlias, nReg, nOpc)
    if nOpcao == 1
        MsgInfo("Inclusão efetuada com sucesso!")
    else
        MsgAlert("Inclusão Cancelada!")
    Endif

return Nil

//--------Função BAltera - alterar------
/*/{Protheus.doc} BAltera
BAltera
@type function
@author Administrador
@since 07/10/2021
/*/
user function BAltera(cAlias, nReg, nOpc)
    Local nOpcao := 0
    nOpcao := AxAltera(cAlias, nReg, nOpc)
    if nOpcao == 1
        MsgInfo("Alteração efetuada com sucesso!")
    else
        MsgAlert("Alteração Cancelada!")
    Endif

return Nil
//--------Função BDeleta - deletar------
/*/{Protheus.doc} BDeleta
BDeleta
@type function
@author Administrador
@since 07/10/2021
/*/
user function BDeleta(cAlias, nReg, nOpc)
    Local nOpcao := 0
    nOpcao := AxDeleta(cAlias, nReg, nOpc)
    if nOpcao == 1
        MsgInfo("Exclusão efetuada com sucesso!")
    else
        MsgAlert("Exclusão Cancelada!")
    Endif

return Nil
//--------Função BLegenda - Legenda------
/*/{Protheus.doc} BLegenda
BLegenda
@type function
@author Administrador
@since 07/10/2021
/*/
user function BLegenda()
    Local aLegenda := {}

    AADD(aLegenda,{"BR_VERDE", "Pessoa Fisica"})
    AADD(aLegenda,{"BR_AMARELO", "Pessoa Juridica"})
    AADD(aLegenda,{"BR_LARANJA", "Exportação"})
    AADD(aLegenda,{"BR_MARROM", "Fornecedor Rural"})
    AADD(aLegenda,{"BR_PRETO", "Não Classificado"})

    BrwLegenda(cCadastro, "Legenda", aLegenda)

return

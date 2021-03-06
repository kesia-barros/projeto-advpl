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
    AADD(aCores,{"Empty(A2_TIPO)", "BR_PRETO"   })// se n�o for classificado

    DbSelectArea(cAlias)
    DbSetOrder(1)
    Eval(bFiltraBrw)

    dbGoTop()
    mBrowse(6,1,22,75,cAlias,,,,,,aCores)

    EndFilBrw(cAlias, aIndexSA2)
    (cAlias)->(DbCloseArea())
    RestArea(aArea)
return

//--------Fun��o BInclui - inclus�o------
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
        MsgInfo("Inclus�o efetuada com sucesso!")
    else
        MsgAlert("Inclus�o Cancelada!")
    Endif

return Nil

//--------Fun��o BAltera - alterar------
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
        MsgInfo("Altera��o efetuada com sucesso!")
    else
        MsgAlert("Altera��o Cancelada!")
    Endif

return Nil
//--------Fun��o BDeleta - deletar------
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
        MsgInfo("Exclus�o efetuada com sucesso!")
    else
        MsgAlert("Exclus�o Cancelada!")
    Endif

return Nil
//--------Fun��o BLegenda - Legenda------
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
    AADD(aLegenda,{"BR_LARANJA", "Exporta��o"})
    AADD(aLegenda,{"BR_MARROM", "Fornecedor Rural"})
    AADD(aLegenda,{"BR_PRETO", "N�o Classificado"})

    BrwLegenda(cCadastro, "Legenda", aLegenda)

return

#INCLUDE 'TOTVS.CH'
/*/{Protheus.doc} TRpt002
relatorio duas secoes
@type function
@author Kesia
@since 20/10/2021
/*/
User function TRpt002()
	Local oReport
	Local cPerg := Padr("TRPT002", 10)

    Pergunte(cPerg, .F.) //SX1
    oReport := RPTStruc(cPerg)

    oReport:PrintDialog()

return
/*/{Protheus.doc} RPrint
RPrint
@type function  
@author Kesia
@since 21/10/2021
/*/
static function RPrint(oReport)
    Local cAlias := GetNextAlias()
    Local oSection1 := oReport:section(1)
	Local oSection2 := oReport:section(2)
    Local cNumCod := ""

	    BeginSql Alias cAlias
            SELECT
                    A1_COD,
                    A1_LOJA,
                    A1_NOME,
                    A1_MUN,
                    B1_COD,
                    B1_DESC,
                    B1_TIPO,
                    C6_CLI,
                    C6_ITEM,
                    C6_PRODUTO,
                    C6_DESCRI,
                    C6_UM,
                    C6_VALOR
            FROM %Table:SA1%
                INNER JOIN %Table:SC5% ON C5_CLIENTE = A1_COD AND C5_LOJACLI = A1_LOJA
                INNER JOIN %Table:SC6% ON C6_NUM = C5_NUM
                INNER JOIN %Table:SB1% ON B1_COD = C6_PRODUTO AND B1_DESC = C6_DESCRI
            WHERE   %Table:SA1%.%NotDel%
                AND %Table:SC5%.%NotDel%
                AND %Table:SC6%.%NotDel%
                AND %Table:SB1%.%NotDel%
        EndSql

        oReport:setmeter((cAlias)->(RecCount()))
        while !EOF()
            if oReport:Cancel()
                Exit
            ENDIF
            //iniciando a primeira seção
            oSection1:init()
            oReport:incMeter()

            cNumCod := (cAlias)->(A1_COD)
            
            //imprimindo a primeira seção
            oSection1:Cell("A1_COD"):SetValue((cAlias)->(A1_COD))
            oSection1:Cell("A1_NOME"):SetValue((cAlias)->(A1_NOME))
            oSection1:Cell("C6_CLI"):SetValue((cAlias)->(C6_CLI))
            oSection1:Cell("A1_LOJA"):SetValue((cAlias)->(A1_LOJA))
            oSection1:Cell("A1_MUN"):SetValue((cAlias)->(A1_MUN))
            oSection1:Printline()

            //iniciando a primeira seção
            oSection2:init()
            while (cAlias)->(A1_COD) == cNumCod
                oReport:incMeter()
                oSection2:Cell("B1_COD"):SetValue((cAlias)->(B1_COD))
                oSection2:Cell("B1_DESC"):SetValue((cAlias)->(A1_LOJA))
                oSection2:Cell("B1_TIPO"):SetValue((cAlias)->(A1_NOME))
                oSection2:Cell("C6_ITEM"):SetValue((cAlias)->(C6_ITEM))
                oSection2:Cell("C6_PRODUTO"):SetValue((cAlias)->(C6_PRODUTO))
                oSection2:Cell("C6_DESCRI"):SetValue((cAlias)->(C6_DESCRI))
                oSection2:Cell("C6_UM"):SetValue((cAlias)->(C6_UM))
                oSection2:Cell("C6_VALOR"):SetValue((cAlias)->(C6_VALOR))
                oSection2:Printline()

            (cAlias)->(dbSkip())
            ENDDO
            oSection2:Finish()
            oReport:Thinline()
            oSection1:Finish()
        ENDDO
return
/*/{Protheus.doc} RPTStruc
RPTStruc
@type function  
@author Kesia
@since 21/10/2021
/*/
static function RPTStruc(cNome)
    Local cTitulo := "Relatorio de pedidos"
    Local cHelp := "Permite imprimir relatorios de pedidos"
    Local oReport 
    Local oSection1 
    Local osection2 

    oReport := Treport():New(cNome, cTitulo, cNome, {|oReport| RPrint(oReport)}, cHelp)

    oReport:SetPortrait()//definindo a orientação como retrato
    oSection1 := TRSection():New(oReport, "Clientes",{"SA1", "SC6"}, NIL, .F., .T.)
    TRCell():New(oSection1, "A1_COD", "SA1", "Codigo")
    TRCell():New(oSection1, "A1_NOME", "SA1", "Nome")
    TRCell():New(oSection1, "C6_CLI", "SC6", "Cliente")
    TRCell():New(oSection1, "A1_LOJA", "SA1", "Loja")
    TRCell():New(oSection1, "A1_MUN", "SA1", "Municipio")

    oSection2 := TRSection():New(oReport, "Produtos",{"SB1", "SC6"}, NIL, .F., .T.)
    TRCell():New(oSection2, "B1_COD", "SB1", "Codigo")
    TRCell():New(oSection2, "B1_DESC", "SB1", "Descricao")
    TRCell():New(oSection2, "B1_TIPO", "SB1", "Tipo")
    TRCell():New(oSection2, "C6_ITEM", "SC6", "Item")
    TRCell():New(oSection2, "C6_PRODUTO", "SC6", "Produto")
    TRCell():New(oSection2, "C6_DESCRI", "SC6", "Descricao")
    TRCell():New(oSection2, "C6_UM", "SC6", "Unidade")
    TRCell():New(oSection2, "C6_VALOR", "SC6", "Valor Total")

    oSection1:SetPageBreak(.T.) //quebra de pagina



return (oReport)

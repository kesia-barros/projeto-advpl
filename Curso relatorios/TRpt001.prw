#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} TRpt001
TReport
@type function
@author Kesia
@since 18/10/2021
/*/
user function TRpt001()
    Local oReport
    Local cAlias := getNextAlias()

    oReport := RptStruc(cAlias)

    oReport:PrintDialog()//tela de configuração da impressão 


return 
/*/{Protheus.doc} RPrint
RPrint
@type function 
@author Kesia
@since 18/10/2021
/*/
static function RPrint(oReport,cAlias)//função para imprimir o relatorio
    Local oSecao1 := oReport:Section(1)

    oSecao1:BeginQuery()// inicia a Query

            BeginSql Alias cAlias
                SELECT
                    B1_FILIAL FILIAL,
                    B1_COD CODIGO,
                    B1_DESC DESCRICAO,
                    B1_TIPO TIPO, 
                    B1_ATIVO ATIVO
                FROM %table:SB1%
                WHERE D_E_L_E_T_ = ' '// DELETADOS : D_E_L_E_T_ = ' '
                ORDER BY B1_FILIAL, B1_COD, B1_DESC, B1_TIPO, B1_ATIVO
            EndSql

            oSecao1:EndQuery()// fecha a Query
            oReport:SetMeter((cAlias)->(RecCount()))
            //RecCount:Determina a quantidade de registros existentes no arquivo
            oSecao1:Print()
return
/*/{Protheus.doc} RptStruc
RptStruc
@type function
@author Kesia
@since 19/10/2021
/*/
static function RptStruc(cAlias)
    Local cTitulo := "Produtos Ativos"
    Local cHelp := "Permite imprimir relatorios de produtos"
    Local oReport 
    Local oSection1
    //instanciando a classe Treport
    oReport := TReport():New('TRPT001', cTitulo, /**/, {|oReport|RPrint(oReport, cAlias)}, cHelp)//instanciando a classe TReport
    //Seção 1
    oSection1 := TRSection():New(oReport, "Produtos ", {"SB1"})
    TRCell():New(oSection1, "FILIAL", "SB1", "Filial")//TRCell para definir as colunas do relatorio
    TRCell():New(oSection1, "CODIGO", "SB1", "Codigo")
    TRCell():New(oSection1, "DESCRICAO", "SB1", "Descricao")
    TRCell():New(oSection1, "TIPO", "SB1", "Tipo")
    TRCell():New(oSection1, "ATIVO", "SB1", "Ativo")


return (oReport)

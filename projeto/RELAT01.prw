#INCLUDE 'TOTVS.CH'


/*/{Protheus.doc} RELAT01
relatorio de acoes
@type function
@author Kesia
@since 27/10/2021
/*/
user function RELAT01()
    Local oReport
    Local cAlias := GetNextAlias()
    
    oReport := Struc02(cAlias)
    oReport:PrintDialog()
return


/*/{Protheus.doc} Rprint
Rprint - funcao que imprime o relatorio
@type function
@author Kesia
@since 27/10/2021
/*/
Static function Rprint(oReport, cAlias)
    Local oSection1 := oReport:Section(1)
    Local oSection2 := oReport:Section(2)

        BeginSql Alias cAlias
            SELECT 
                ZX0_ACOES ACOES,
                ZX0_SET SETORES,
                ZX0_PRECO PRECOS,
                ZX0_PL PL,
                ZX0_YELD YIELD,
                ZX0_PVP PVPA,
                ZX0_PAY PAYOUT
            FROM %table:ZX0%
            WHERE D_E_L_E_T_ = ''  
            ORDER BY ZX0_ACOES, ZX0_SET, ZX0_PRECO, ZX0_PL, ZX0_YELD, ZX0_PVP, ZX0_PAY
        EndSql

        oReport:setMeter((cAlias)->(RECCOUNT()))
        while !EOF()
            if oReport:cancel()
                Exit
            endif

            oSection1:init()
            oReport:incMeter()

            oSection1:Cell("ACOES"):SetValue((cAlias)->(ACOES)) // ACOES != ZX0_ACOES
            oSection1:Cell("SETORES"):SetValue((cAlias)->(SETORES))
            oSection1:Cell("PRECOS"):SetValue((cAlias)->(PRECOS))
            oSection1:Printline()

            oSection2:init()
            oReport:incMeter()

            oSection2:Cell("PL"):SetValue((cAlias)->(PL))
            oSection2:Cell("YIELD"):SetValue((cAlias)->(YIELD))
            oSection2:Cell("PVPA"):SetVAlue((cAlias)->(PVPA))
            oSection2:Cell("PAYOUT"):SetValue((cAlias)->(PAYOUT))
            oSection2:Printline()

            (cAlias)->(dbSkip())

            oSection1:Finish()
            oReport:Thinline()
            oSection2:Finish()
        ENDDO
return
/*/{Protheus.doc} Struc02
Struc02
@type function
@author Kesia
@since 29/10/2021
/*/
Static function Struc02(cAlias)
    Local cTitulo := "Relatorio de Ações"
    Local cHelp := "Permite imprimir relatorios da melhores ações"
    Local oSection1 
    Local oSection2
    Local oReport

    oReport := TReport():New('RELAT01', cTitulo, /**/, {|oReport|Rprint(oReport, cAlias)}, cHelp)

    oSection1 := TRSection():New(oReport, "ACOES", {"ZX0"})
    TRCell():New(oSection1, "ACOES", "ZX0", "Acoes", "@!", 15) //aqui o nome do seu objeto esta diferente do Cell la em cima
    TRCell():New(oSection1, "SETORES", "ZX0", "Setores", "@!", 31)
    TRCell():New(oSection1, "PRECOS", "ZX0", "Precos", "@E 999,999.99")

    oSection2 := TRSection():New(oReport, "ACOES", {"ZX0"})
    TRCell():New(oSection2, "PL", "ZX0","PL", "@!", 15)
    TRCell():New(oSection2, "YIELD", "ZX0", "YIELD", "@!", 15)
    TRCell():New(oSection2, "PVPA", "ZX0", "PVPA", "@!", 15)
    TRCell():New(oSection2, "PAYOUT", "ZX0", "PAYOUT", "@!", 15)
return (oReport)

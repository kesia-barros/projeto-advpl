#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} GRVBANK
GRVBANK
@type function 
@author Kesia
@since 12/10/2021
/*/
User function GRVBANK(aArquivo)

    Local nI := 0

    For nI := 1 to Len(aArquivo)
        Chkfile("ZX0")
        DbSelectArea("ZX0")
        DbSetOrder(2)
        If !DbSeek(xFilial("ZX0")+DToS(aArquivo[nI][2])+aArquivo[nI][1])
            If RecLock("ZX0", .T.)
                ZX0_FILIAL := cFilAnt
                ZX0_DATA   := aArquivo[nI][2]
                ZX0_ACOES  := aArquivo[nI][1]
                ZX0_SEG    := aArquivo[nI][3]
                ZX0_SET    := aArquivo[nI][4]
                ZX0_APROV  := aArquivo[nI][5]
                ZX0_PRECO  := aArquivo[nI][6]
                ZX0_VALOR  := aArquivo[nI][7]
                ZX0_MSG    := aArquivo[nI][8]
                ZX0_DIV    := aArquivo[nI][9]
                ZX0_YELD   := aArquivo[nI][10]
                ZX0_PAY    := aArquivo[nI][11]
                ZX0_PL     := aArquivo[nI][12]
                ZX0_LPA    := aArquivo[nI][13]
                ZX0_PVP    := aArquivo[nI][14]
                ZX0_VPA    := aArquivo[nI][15]
                ZX0_ROE    := aArquivo[nI][16]
                ZX0_ROA    := aArquivo[nI][17]
                ZX0_ROIC   := aArquivo[nI][18]
                ZX0_MB     := aArquivo[nI][19]
                ZX0_ML     := aArquivo[nI][20]
                ZX0_EV     := aArquivo[nI][21]
                ZX0_DLPL   := aArquivo[nI][22]
                ZX0_PSR    := aArquivo[nI][23]
                ZX0_LC     := aArquivo[nI][24]
                ZX0_CAGR   := aArquivo[nI][25]
                ZX0_PEG    := aArquivo[nI][26]
                ZX0_MD     := aArquivo[nI][27]
                ZX0->(MsUnlock())
            EndIf
        EndIf
    Next nI
return

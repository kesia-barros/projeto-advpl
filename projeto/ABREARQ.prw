#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} ABREARQ
ABREARQ
@type function 
@author Kesia
@since 12/10/2021
/*/
User function ABREARQ()
    Local cDiretorio := ""

    cDiretorio := cGetFile("Arquivo CSV |*.csv", "Planilha")
    u_CSVTOARR(cDiretorio)

return

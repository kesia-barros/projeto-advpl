#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} MENUPERS
MENUPERS
@type function 
@author Kesia
@since 12/10/2021
/*/
user function MENUPERS()
    Local cDiretorio := ""

    cDiretorio := cGetFile("Arquivo CSV |*.csv", "Planilha")
    u_CSVTOARR(cDiretorio)

return

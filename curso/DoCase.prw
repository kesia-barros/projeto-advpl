#INCLUDE 'TOTVS.CH'


/*/{Protheus.doc} DoCase
description
@type function
@version  
@author Administrador
@since 06/10/2021
@return variant, return_description
/*/
user function DoCase()

    local cData := "19/12/2021"

    Do Case 

    Case cData == "20/12/2021"
    Alert("Não e Natal" + cData)

    Case cData == "25/12/2021"
    Alert("E NATAL!!!")

    OtherWise
    MsgInfo("Não sei que dia e hoje!")

    EndCase

return 

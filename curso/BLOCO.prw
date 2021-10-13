#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} BLOCO
description
@type function
@version  
@author Administrador
@since 06/10/2021
@return variant, return_description
/*/
user function BLOCO()

//Local bBLOCO := {|| Alert("Ola Mundo")}
    //Eval(bBloco)

Local bBLOCO := {|cMsg| Alert(cMsg)}
    Eval(bBLOCO, "Ola Mundo!")


return

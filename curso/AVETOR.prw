#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} AVETOR
description
@type function
@version  
@author Administrador
@since 06/10/2021
@return variant, return_description
/*/
user function AVETOR()
// ARRAYS: S�O CPLE��ES DE VALORES, SEMELHANTES A UMA LISTA
// CADA ITEM EM UM ARRAY E REFERENCIADO PELA INDICA��O DE SUA POSI��O NUMERICA

Local dData := Date()
Local aValores := {"Jo�o", dData, 100}

Alert(aValores[2])  // Exibe a posi��o 2 do array
Alert(aValores[3])

return 

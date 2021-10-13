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
// ARRAYS: SÃO CPLEÇÕES DE VALORES, SEMELHANTES A UMA LISTA
// CADA ITEM EM UM ARRAY E REFERENCIADO PELA INDICAÇÃO DE SUA POSIÇÃO NUMERICA

Local dData := Date()
Local aValores := {"João", dData, 100}

Alert(aValores[2])  // Exibe a posição 2 do array
Alert(aValores[3])

return 

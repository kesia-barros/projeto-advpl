#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} OPERADOR
OPERADORES
@type function
@author Administrador
@since 06/10/2021
/*/
user function OPERADOR()

    Local nNum1 := 10
    Local nNum2 := 20

    //OPERADORES MATEMATICOS
    //Alert(nNum1 + nNum2)
    //Alert(nNum2 - nNum1)
    //Alert(nNum1 * nNum2)
    //Alert(nNum2 / nNum1)
    //Alert(nNum2 % nNum1)

    //OPERADORES RELACIONAIS
    Alert(nNum1 < nNum2) //COMPARA플O MENOR
    Alert(nNum1 > nNum2) //COMPARA플O MAIOR 
    Alert(nNum1 = nNum2) //COMPAR플O IGUAL
    Alert(nNum1 == nNum2) //EXATAMENTE IGUAL/ MAIS USADOS PARA COMPARAR CARACTERES
    Alert(nNum1 <= nNum2) //COMPARA플O MENOR OU IGUAL
    Alert(nNum1 >= nNum2) //COMPARA플O MAIOR OU IGUAL
    Alert(nNum1 != nNum2) //DIFEREN�A


    //OPERADORES DE ATRIBUI플O
    nNum1 := 10 //ATRIBUI플O SIMPLES
    nNum1 += nNum2 //nNum1 = nNum1 + nNum2
    nNum2 -= nNum1 //nNum2 = nNum2 - nNum1
    nNum1 *= nNum2 //nNum1 = nNum1 * nNum2
    nNum2 /= nNum1 //nNum2 = nNum2 / nNum1
    //nNum2 %= nNum1 //nNum2 = nNum2 % nNum1

Return 

#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} ESTRUTUR
ESTRUTURA
@type function
@author Administrador
@since 06/10/2021
/*/
user function ESTRUTUR()

    Local nNum1 := 100
    Local nNum2 := 100

    if(nNum1 < nNum2)
        MsgInfo("A variavel nNum1 e menor ou igual a nnum2")

    elseif (nNum1 = nNum2)
        Alert("As variaveis são iguais")
        
    else
        Alert("A variavel nNum1 não e menor ou igual a nNum2")

    endif    
return 

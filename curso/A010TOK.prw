#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} A010TOK
A010TOK
@type function
@author Kesia
@since 08/10/2021
/*/
user function A010TOK()
    local lExecuta := .T.
    Local cTipo := AllTrim(M->B1_TIPO) //elemina os espaços em branco e pega os campos preenchidos/ M - memoria 
    Local cConta := AllTrim(M->B1_CONTA)


        if (cTipo = "PA" .and. cConta = "001")
            Alert("A conta <b> "+ cConta +"</b> não pode estar associada a um produto do tipo <b>"+cTipo)

            lExecuta := .F.  // enquanto a lExecuta for falsa, o programa não sera finalizado

        ENDIF
return (lExecuta) // colocar no return para retorna o falso, se nao retorna true

#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} MODELO1
MODELO1
@type function 
@author Administrador
@since 07/10/2021
/*/
user function MODELO1()
    Local cAlias := "SB1"
    local cTitulo := "Cadastro - AXCadastro"
    Local cVldExc := ".T."  // permite exclusão
    Local cVldAlt := ".T."// permite alteração

    AxCadastro(cAlias, cTitulo, cVldExc, cVldAlt)

return Nil

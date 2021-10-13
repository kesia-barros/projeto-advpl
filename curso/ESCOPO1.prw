#INCLUDE 'TOTVS.CH'

Static cStat := ''
/*/{Protheus.doc} ESCOPO1
ESCOPO
@type function 
@author Administrador
@since 06/10/2021
/*/
User Function ESCOPO1()
    
    //VARIAVEIS LOCAIS
    local nVar0 := 1
    local nVar1 := 20

    //VARIAVEIS PRIVATE
    Private cPri := 'private!'

    //VARIAVEIS PUBLIC
    public __cPublic := 'RCTI'

    TestEscop(nVar0, @nVar1)

Return 

//-------------função static------------
/*/{Protheus.doc} TestEscop
ESCOPO
@type function 
@author Administrador
@since 06/10/2021
/*/
Static Function TestEscop(nValor1, nValor2)

    Local __cPublic := 'Alterei'
    //Alterando conteudo da variavel
    nValor2 := 10

    //mostrar conteudo da variavel private
    Alert("Private: "+ cPri)

    //Alterar valor da variavel public
    Alert("Publica:"+ __cPublic)

    MsgAlert(nValor2)
    Alert("Variavel Static: "+ cStat)
    
Return

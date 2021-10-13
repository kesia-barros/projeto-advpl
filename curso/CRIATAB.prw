#INCLUDE 'TOTVS.CH'
/*/{Protheus.doc} CRIATAB
CRIATAB
@type function
@author Kesia
@since 08/10/2021
/*/
user function CRIATAB()
    Local lCheck        := .F.

    lCheck := CHKFILE("ZX0")
    If lCheck == .T.
        MsgInfo("Tabela criada!")
    EndIf    
 return

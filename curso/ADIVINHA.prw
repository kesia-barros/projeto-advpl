#include 'TOTVS.CH'

/*/{Protheus.doc} ADIVINHA
Jogo de adivinha��o
@type function
@author kesia
@since 06/10/2021
/*/
user function ADIVINHA()
    Local nNum := RANDOMIZE(1, 10)
    Local nNum2 := RANDOMIZE(1, 50)
    Local nNum3 := RANDOMIZE( 1, 100)
    Local nChute := 0
    Local nCount := 0
    Local nEscolha := 0


    nEscolha := Val(FWInputBox('Escolha um nivel - [FACIL - 1 / MEDIO - 2/ DIFICIL - 3]: '))

    if nEscolha == 1
        WHILE nChute != nNum
        nChute := Val(FWInputBox("Escolha um numero de 1 - 10: "))
            if nChute == nNum
                MsgInfo("Voc� acertou - <b>"+ cValToChar(nChute)+ "</b>")
            elseif nChute > nNum
                MsgAlert("Valor alto, tente novamente!")
            else
                MsgAlert("Valor baixo, tente Novamnete") 
            ENDIF
            nCount++ 
        END
        Alert("Voc� fez em "+ CValToChar(nCount), " �tentativas!")

    elseif nEscolha == 2
        WHILE nChute != nNum2
        nChute := Val(FWInputBox("Escolha um numero de 1 - 50: "))
            if nChute == nNum2
                MsgInfo("Voc� acertou - <b>"+ CValToChar(nChute)+ "</b>")
            elseif nChute > nNum2
                MsgAlert("Valor alto, tente novamente!")
            else
                MsgAlert("Valor baixo, tente Novamnete") 
            ENDIF
            nCount++ 
        END
        Alert("Voc� fez em "+ CValToChar(nCount), " �tentativas!")

    else
        WHILE nChute != nNum3
        nChute := Val(FWInputBox("Escolha um numero de 1? - 100: "))
            if nChute == nNum3
                MsgInfo("Voc� acertou - <b>"+ CValToChar(nChute)+ "</b>")
            elseif nChute > nNum3
                MsgAlert("Valor alto, tente novamente!")
            else
                MsgAlert("Valor baixo, tente Novamnete") 
            ENDIF
            nCount++ 
        END
        Alert("Voc� fez em "+ CValToChar(nCount), " �tentativas!")
    ENDIF

RETURN

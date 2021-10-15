#include 'totvs.ch'

/*/{Protheus.doc} CSVTOARR
CSVTOARR
@type function
@author Kesia
@since 12/10/2021
/*/
User Function CSVTOARR(cArquivo) 

    Local cAux1     := ""		
    Local cAux2     := ""
    Local aArquivo  := {}    
    Local aArqCSV   := {}
    Local aColunas  := {}
    Local aLinha    := {}
    Local nLinha    := 1
    Local nColuna   := 1    
    Local oFile

    Default cArquivo:= ""

    //Definindo o arquivo a ser lido
    oFile := FWFileReader():New(cArquivo)
    //Se o arquivo pode ser aberto
    If (oFile:Open())
        //Enquanto houver linhas a serem lidas
        While (oFile:hasLine())
           //adicionando o texto a linha atual
            aAdd(aArqCSV,oFile:GetLine())
        Enddo
        //Fecha o arquivo e finaliza o processamento
        oFile:Close()	
    Endif

    For nLinha := 1 to Len(aArqCSV)
                
        aArqCSV[nLinha] := StrTran(aArqCSV[nLinha],";;",";s ;") 
        aColunas 		:= StrTokarr(aArqCSV[nLinha] ,";") 
        aLinha   		:= {}
        
        For nColuna := 1 To Len(aColunas)

            //SE DATA ATUAL ESTIVER EM aColunas[nColuna]
            If (SubStr(DToC(dDataBase),4,10) $ aColunas[nColuna])
            //TRANSFORMA EM DATA
                aColunas[nColuna] := CToD(aColunas[nColuna])
                aAdd(aLinha, aColunas[nColuna])  
                Loop
            EndIf


            If ("R$" $ aColunas[nColuna])
                cAux1 := StrTran(Replace(aColunas[nColuna],"R$",""),",",";")
                cAux2 := Val(StrTran(Replace(cAux1,".",""),";","."))
                aColunas[nColuna] := cAux2

            Endif
    

            aAdd(aLinha, aColunas[nColuna]) 

            Next

        aAdd(aArquivo, aLinha)

    Next	

    u_GRVBANK(@aArquivo)

Return

    
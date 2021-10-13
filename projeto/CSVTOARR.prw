#include 'totvs.ch'

/*/{Protheus.doc} CSVTOARR  
@description Permite ler um arquivo texto em formato CSV e converter para Array.
@author  	Súlivan Simões - sulivansimoes@gmail.com
@since		24/06/2021
@param		Character, diretório + nome do arquivo + extensao do arquivo a ser lido. 
@return 	Array, contendo que foi lido do arquivo estruturado em formato de Array
@obs		/

@example: c:\temp\arquivo.csv
/*/
User Function CSVTOARR(cArquivo) 
			
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
    Else
		FWLogMsg("[CSVTOARR]- Nao conseguiu abrir arquivo: "+cValToChar(cArquivo))	
    Endif

    For nLinha := 1 to Len(aArqCSV)
                
        aArqCSV[nLinha] := StrTran(aArqCSV[nLinha],";;","; ;") //Informações que não tem nada jogo um espaço vazio
        aColunas 		:= StrTokarr(aArqCSV[nLinha] ,";") 
        aLinha   		:= {}
        
    For nColuna := 1 To Len(aColunas)

            aAdd( aLinha, aColunas[nColuna]  )            
        Next
        aAdd( aArquivo, aLinha)
    Next	
    u_GRVBANK(@aArqCSV)
Return aArquivo
    
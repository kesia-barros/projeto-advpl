#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} RelTxt
Relatorio TXT
@type function  
@author Kesia
@since 15/10/2021
/*/
User function RelTxt()

    if MsgYesNo("Gerar arquivp TXT?")
        MsAguarde({||GeraArq()},,"O arquivo esta sendo gerado...")
    else
        Alert("Cancelada pelo Operador")
    endif

return Nil

//Função que gera o arquivo TXT
/*/{Protheus.doc} GeraArq
Gerar Arquivo txt
@type function  
@author Kesia
@since 15/10/2021
/*/
static function GeraArq(cAlias)
    Local cDir := "C:\Users\Kesia\Desktop\Relatorios\"
    Local cArq := "Teste_arquivo2.txt"
    Local cAlias := GetNextAlias()
    Local nHandle := FCreate(cDir+cArq)//FCreate: Cria um arquivo vazio no disco, para operação de escrita em modo exclusivo, com o tamanho de 0 ( zero ) bytes
    //Local nLinha := 1
//nHandle - parametro do Fwrite

        BeginSql Alias cAlias
            SELECT
                B1_FILIAL FILIAL,
                B1_COD CODIGO,
                B1_DESC DESCRICAO
            FROM 
                %table:SB1%
            WHERE 
                D_E_L_E_T_ = ' '

        EndSql
        if nHandle < 0
            MsgAlert("Erro ao criar arquivo", "ERRO")
        else
            //enquanto não for o fim da tabela temporaria(TMP)
            while (cAlias)->(!EOF())
                Fwrite(nHandle, (cAlias)->FILIAL+"|"+(cAlias)->CODIGO+"|"+(cAlias)->DESCRICAO+CRLF)
                (cAlias)->(dbSkip())//para ir para o proximo registro
            
            endDo

            FClose(nHandle)//Fechando o arquivo

        endif

        if FILE("C:\Users\Kesia\Desktop\Relatorios\Teste_arquivo2.txt") // verifica se o arquivo existe
            MsgInfo("Arquivo criado com sucesso!", "Mensagem")
        else 
        MsgAlert("Não foi possivel criar o arquivo", "ALERTA")
        endif
return Nil

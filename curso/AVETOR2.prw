#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} AVETOR2
vetores
@type function 
@author Administrador
@since 06/10/2021
/*/
user function AVETOR2()
/**
AADD() - Permite a inserção de um item em um array ja existente
AINS() - Permite a inserção de um elemento em qualquer posição de Array
ACLONE() - Realiza a copia de um Array para outro 
ADEL() - Permite a exclusão de um elemento do Array, tornando o ultimo valor NULL
ASIZE() -Redefine a estrutura de um array pre-existente, adicionando ou removendo itens 
LEN() - Retorna a quantidade de elementos de um Array
**/

Local aVetor := {10, 20, 30}

AaDd(aVetor, 40)
//Alert(Len(aVetor))

//AIns(aVetor,2)
//aVetor[2] := 200
//Alert(aVetor[2])
//Alert(len(aVetor))

/*
Local nCount

 aVetor2 := AClone(aVetor)
    for nCount := 1 To Len(aVetor2)
        Alert(aVetor2[nCount])

    Next nCount
*/
/*
Adel(aVetor, 2)
Alert(aVetor[3])
Alert(Len(aVetor))
*/
//Asize(aVetor, 2)
//Alert(Len(aVetor))

return 

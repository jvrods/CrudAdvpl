#Include 'Protheus.ch'
#Include 'FWMVCDEF.ch'
#Include 'RestFul.CH'
/***********************
+-------------------------------------------------------------------------+
|Funcao      | ConsLink       | Autor |   João Victor Rodrigues                 |
+------------+------------------------------------------------------------+
|Data        | 07.01.2022                                                 |
+------------+------------------------------------------------------------+
|Descricao   | Retorna a consulta dos dados do link criado                |
**************************/

User Function RetCont()
Local cConteud := ""

  cConteud := U_lercep("50791100", 2)

Return


User function lercep(cCep, nPos)

aInfo := ConsLink(cCep)

return aInfo[1,nPos]


static Function ConsLink(cCep)

Local oRest    := FWRest():New("https://viacep.com.br")
Local oJson    := JSonObject():New()
Local aTeste := {}



oRest:setPath("/ws/"+cCep+"/json/")
oRest:GET()
cErro := oJSon:fromJson(decodeUtf8(oRest:GetResult()))

If !empty(cErro)
  Return 
Endif

aAdd(aTeste, {oJson:GetJSonObject('cep'), oJson:GetJSonObject('logradouro'),oJson:GetJSonObject('complemento'),oJson:GetJSonObject('bairro'),oJson:GetJSonObject('localidade'),oJson:GetJSonObject('uf'),oJson:GetJSonObject('ibge'),oJson:GetJSonObject('gia'),oJson:GetJSonObject('ddd'),oJson:GetJSonObject('siafi')})



Return aTeste

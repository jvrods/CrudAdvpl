#Include 'Protheus.ch'
#Include 'FWMVCDEF.ch'
#Include 'RestFul.CH'
/**************************
+-------------------------------------------------------------------------+
|Funcao      | ConsLink       | Autor |    Walter Rodrigo                 |
+------------+------------------------------------------------------------+
|Data        | 08.02.2021                                                 |
+------------+------------------------------------------------------------+
|Descricao   | Retorna a consulta dos dados do link criado                |
**************************/

User Function ConsLink()


Local oRest    := FWRest():New("https://rickandmortyapi.com")
Local oJson    := JSonObject():New()



oRest:setPath("/api/character/1")
oRest:GET()
cResult := oRest:GetResult()
cErro := oJSon:fromJson(oRest:GetLastError())

If !empty(cErro)
  Return aLink
Endif

aResult   := oJson:GetJSonObject()


Return 

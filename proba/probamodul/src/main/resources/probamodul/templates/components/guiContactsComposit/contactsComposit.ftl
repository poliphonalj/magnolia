<!-- itt csak egy node lehet mert a definiciobol nem engedek ugsem tobbet -->
 [#assign contactContentMapList = cmsfn.children(content,"mgnl:contentNode")]	 <!--  contacts ezt mar en adtam meg mas nem irhatja at  -->
 [#assign contactsLine = cmsfn.children(contactContentMapList[0])]
 
[#list contactsLine as actualProperty]		
 	[#assign img=damfn.getAssetLink(actualProperty.image)!]
 	${actualProperty.key} : ${actualProperty.value}<br>
 	${actualProperty.descr} 
 [#assign img = actualProperty.image]	
 	${img}
 	<img src="${damfn.getAssetLink(img!)}" alt="Avatar" style="width:50px;height:50px;">
 	<hr>
 	<br><br><br>
[/#list]

 		
	

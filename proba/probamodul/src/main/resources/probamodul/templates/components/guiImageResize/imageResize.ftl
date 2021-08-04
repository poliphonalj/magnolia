<div>
 [#assign currentTheme=sitefn.theme(sitefn.site(content))]

${sitefn.site()}
${currentTheme}

[#assign nod = cmsfn.children(content,"mgnl:contentNode")/]		<!-- /node -->
${nod[0]}
[#assign img = content.imageLogo]								<!-- a contentből behozza az imageLogo változójju képet -->
	
<!--
[#assign rendition = damfn.getRendition(img, "kicsi")]
		<img src="${rendition.link}"/>


[#assign rendition = damfn.getRendition(img, "fura")]
<img src="${rendition.link}"/>
-->


itt még csak az alap resize van, nincs beállitva a dam-focal! A fokuszpont defaultból középre esik, és
először négyzetet készitve vagdossa le a kívánt méretre két oldalról.
${content}
<table>
	<tr>
		<td>eredeti méret (600x466)</td>	<td><img src="${damfn.getAssetLink(img!,"normal")}" alt="logo" ></td>
	</tr>	

	<tr>
		<td>változtatott méret(variation "kicsi",100x100 )</td>	<td><img src="${damfn.getAssetLink(img!,"kicsi")}" alt="logo" ></td>
	</tr>	

	<tr>
		<td>változtatott méret2(variation "fura",100x400 )</td>	<td><img src="${damfn.getAssetLink(img!,"fura")}" alt="logo" ></td>
	</tr>	

<tr>
		<td>változtatott méret3(variation "csik",500x100)</td>	<td><img src="${damfn.getAssetLink(img!,"csik")}" alt="logo" ></td>
	</tr>	





</table>
${content}
${ctx}



<br><br><br>
a DAM Focal használata a fókuszpont a bal alsó csatornára téve
<table>
	<tr>
		<td>eredeti méret (600x466)</td>	<td><img src="/proba-webapp/.imaging/focalpoint/600x466/dam/jcr:3384dbf5-7dde-4b4c-bf62-e399128cd4fc/retro.jpg"></td>
	</tr>	

	<tr>
		<td> 700x30</td>	<td><img src="/proba-webapp/.imaging/focalpoint/700x30/dam/jcr:3384dbf5-7dde-4b4c-bf62-e399128cd4fc/retro.jpg"></td>
	</tr>	

	<tr>
		<td>50x70</td>	<td><img src="/proba-webapp/.imaging/focalpoint/50x70/dam/jcr:3384dbf5-7dde-4b4c-bf62-e399128cd4fc/retro.jpg"></td>
	</tr>	
	
	
	<tr>
		<td>200x400</td>	<td><img src="/proba-webapp/.imaging/focalpoint/200x400/dam/jcr:3384dbf5-7dde-4b4c-bf62-e399128cd4fc/retro.jpg"></td>
	</tr>
	
	<tr>
		<td>400x200</td>	<td><img src="/proba-webapp/.imaging/focalpoint/400x200/dam/jcr:3384dbf5-7dde-4b4c-bf62-e399128cd4fc/retro.jpg"></td>
	</tr>
		

	<tr>
		<td>1600x1600</td>	<td><img src="/proba-webapp/.imaging/focalpoint/1600x1600/dam/jcr:3384dbf5-7dde-4b4c-bf62-e399128cd4fc/retro.jpg"></td>
	</tr>	

	<tr>
		<td>100x400</td>	<td><img src="/proba-webapp/.imaging/focalpoint/100x400/dam/jcr:3384dbf5-7dde-4b4c-bf62-e399128cd4fc/retro.jpg"></td>
	</tr>	

	<tr>
		<td>500x100</td>	<td><img src="/proba-webapp/.imaging/focalpoint/500x100/dam/jcr:3384dbf5-7dde-4b4c-bf62-e399128cd4fc/retro.jpg"></td>
	</tr>	

</table>
<br><br><br><br>

animalt gifek esetn nem mukodi, mindig az eredeti meretet adja visssza:
<table>
	<tr>
		<td>eredeti méret (280x280)</td>	<td><img src="/proba-webapp/.imaging/focalpoint/280x280/dam/jcr:263fb066-4453-4486-8649-57a1248cc7c8/uTM.gif"></td>
	</tr>	

	<tr>
		<td> 700x300</td>	<td><img src="/proba-webapp/.imaging/focalpoint/100x100/dam/jcr:263fb066-4453-4486-8649-57a1248cc7c8/uTM.gif"></td>
	</tr>	



</table>


</div>
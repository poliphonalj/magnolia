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
		<td>változtatott méret2(variation "fura",400x100 )</td>	<td><img src="${damfn.getAssetLink(img!,"fura")}" alt="logo" ></td>
	</tr>	

<tr>
		<td>változtatott méret3(variation "csik",100x500 )</td>	<td><img src="${damfn.getAssetLink(img!,"csik")}" alt="logo" ></td>
	</tr>	





</table>
${content}
${ctx}

[#assign m = cmsfn.contentByPath("/retro.jpg", "dam")]




hiiiii${m}

</div>
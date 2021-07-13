<div>

[#assign node = cmsfn.nodeByPath("/", "alternate-card")/]		<!-- /node -->

[#assign childNodes=cmsfn.children(node,"lib:alternateCard")/]
	
	[#list childNodes as actualReference]
		[#assign childName = "/"+actualReference.name	]
 	[#assign peaceOfNews = cmsfn.contentByPath(childName, "alternate-card")]	
 	<p>${peaceOfNews.editor}</p>	
 	[/#list]
 	
 	
 	
 			
 	
 	
</div>
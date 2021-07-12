<div>
	[#assign node = cmsfn.nodeByPath("/", "news-app")]						<!-- gives back the node from path and workspace-->
	[#assign childrenNodeList =  cmsfn.children(node,"lib:actualNews")]		<!-- gives back the newsList -->
	

 	<!-- 0 tol indul a searchResults és megadja a ciklusok számát -->
 	<!--felkészülni, hogy ha 3db hir jelenik meg-->
 	
 	[#if childrenNodeList?size%2=0]											<!-- calculates the number of pages-->
 		[#assign numOfPages=childrenNodeList?size/2]						<!-- have to divide by 2 because 2news/page is the standard:) -->
 	[#else]
 		[#assign numOfPages=(childrenNodeList?size/2)+1]
 	[/#if]	
	   
	
	[#assign linksList=model.getPagerList()]
	[#assign newsList = model.getNewsList()]
	[#assign first=model.isFirst()]
	[#assign back=model.isBack()]
	[#assign next=model.isNext()]
	[#assign last=model.isLast()]
	
	[#if first=true]
		<a href="?page=1">  első </a> 
	[/#if]
	
	[#if back=true]
		<a href="?page=${model.getBackElement()}">  vissza  </a> ...
	[/#if]
	
	 
	[#list linksList as linkItem]
		<a href="?page=${linkItem}">  ${linkItem}  </a>
	[/#list]
	
	[#if next=true]
	...	<a href="?page=${model.getNextElement()}">  tovább  </a> 
	[/#if]
	
	[#if last=true]
		<a href="?page=${model.getLastElement()}">  utolsó </a> 
	[/#if]

	<br><br>
	  

	[#list newsList as newsItem]
		${newsItem.getAuthor()}
		${newsItem.getIntro()}
		${newsItem.getText()}
		${newsItem.getPublish_date()}
		[#assign img=newsItem.getImage()]
		<img src="${damfn.getAssetLink(img!)}" width="300" height="234">		
		<br><br>
	[/#list]
	ha tobbszor magara kattintok meg nem muxik
	
	
	
	
 
 
  
  </div>
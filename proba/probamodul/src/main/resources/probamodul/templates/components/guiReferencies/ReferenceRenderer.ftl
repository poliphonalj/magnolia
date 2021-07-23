
<div>



<div>
[#assign node = cmsfn.nodeByPath("/", "alternate-card")/]		<!-- /node -->
[#assign childNodes=cmsfn.children(node,"lib:alternateCard")/]

	[#list childNodes as actualReference]
	<div  >
		[#assign childName = "/"+actualReference.name	]
 		[#assign ref = cmsfn.contentByPath(childName, "alternate-card")]	
 		[#assign focim = ref.focim]
		[#assign alcim = ref.alcim]
		[#assign text = ref.text]
		[#assign img = ref.image]
		
 		<!--itt kell megjeleníteni a css kartyat-->
 		
 		<a href="#${focim}"> <div id="thediv" />
 		
 		 	<div id="thediv" class="flip-card" class="row">
				<div class="flip-card-inner" class="column">
					<div class="flip-card-front">
						<img src="${damfn.getAssetLink(img!)}" alt="Avatar" style="width:300px;height:234px;">
					</div>
					<div class="flip-card-back">
						<p>${ref.textOnCard}</p>	
					</div>
				</div>
			</div>
	 	</a>
 	</div>
 	<br>
 	[/#list]
</div></div>
<br>
<br>
<br><hr>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>

<div>
	[#list childNodes as actualReference]
		[#assign childName2 = "/"+actualReference.name	]
 		[#assign ref2 = cmsfn.contentByPath(childName2, "alternate-card")]	
		<h1 id="${ref2.focim}" style="color:Tomato;">${ref2.focim}</h1>
		<h2 style="color:Tomato;">${ref2.alcim}</h1>
		<h3>${ref2.text}</h1><br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	[/#list]
</div>

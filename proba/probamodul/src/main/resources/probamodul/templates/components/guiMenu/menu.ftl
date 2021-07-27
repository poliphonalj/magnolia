
<div style="background-color: pink;">
	<nav class="navbar navbar-light" style="background-color: #35353f ;">
		<div class="container-fluid" >
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
							<!-- <a class="navbar-brand" href="#">
							<img src="${damfn.getAssetLink("jcr:90180d68-8662-4198-8f6c-fa3fad673e6d")}"/></a>	-->

				<button type="button"  class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false"  style="background-color: pink ;">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar" style="background-color: lightblue"></span>		<!-- a hamburger menu csikjai -->
					<span class="icon-bar" style="background-color: lightblue"></span>
					<span class="icon-bar" style="background-color: lightblue"></span>
				</button>
			</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1"  >
		<ul class="nav navbar-nav" >
			[#assign rootPage =navfn.rootPage(content)]<!-- contentmapot add vissza-->
			
			[#if rootPage??]
				<--!	iiiiiiiiiiiiidddddddddddweeeee a menupontokba elsore betenni a rootpage-t	-->			
				[#assign menupontok= navfn.navItems(rootPage)]
			[/#if]
			
			<!-- ide jonnek a nav elemek-->
			[#assign i=0]
			[#list menupontok as actualMenupont]		<!-- lehetne nav fuggvennel is gyerekeit adja vissza-->
				[#assign subMenu = navfn.navItems(actualMenupont)]]
				[#assign link= cmsfn.link(actualMenupont)]
				<!-- ha van submenu-->
				[#if subMenu?size!=0]
					<li class="dropdown" >
						<a href="${link}" style="background-color: #35353f" class="dropdown-toggle disabled" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${actualMenupont}<span class="caret"></span></a>
							
							<ul class="dropdown-menu">
								[#list subMenu as actualSubMenu]
									[#assign linktosubpage=cmsfn.link(actualSubMenu)]
									
									<li><a href="${linktosubpage}">${actualSubMenu}</a></li>
								[/#list]
							</ul>
					</li>
				
				<!-- ha nincs submenu-->
				[#else]
					[#if i=0]		<!-- azert kell, hogy a főoldal menüjét a forciklus csak egyszer tegye ki-->
						[#assign link1= cmsfn.link(rootPage)]
						<li><a style="background-color: #35353f ;" href="${link1}">${rootPage}</a></li>
					[/#if]
					
					<li><a style="background-color: #35353f ;" href="${link}">${actualMenupont}</a></li>
				[/#if]
				[#assign i=i+1]
			[/#list]
			 					
		</ul>
	</div><!-- /.navbar-collapse -->
</div><!-- /.container-fluid -->
</nav>




</div>${rootPage}
${navfn.link(rootPage)


}
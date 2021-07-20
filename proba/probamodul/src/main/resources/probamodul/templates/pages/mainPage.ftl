<!DOCTYPE html>
<html xml:lang="${cmsfn.language()}" lang="${cmsfn.language()}">




<head>

 <!-- ez itt a header -->
     <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">  

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> 
  
  
   [@cms.page /]
   
	
	<!-- dropdown menu -->







<style>
<!--    .navbar-light {
    min-height: 100px;
} -->

.navbar-collapse{
.navbar-text {
    color: rgba(255,255,255,.8);
}
}


.dropdown:hover .dropdown-menu {
    display: block;
    margin-top: 0; // remove the gap so it doesn't close
 }


a-menu:hover {
   background-color:yellow !important;
 }

</style>



</head>


   


  
<body>



[#assign menupontok = cmsfn.children(content, "mgnl:page")]







<nav class="navbar navbar-light" style="background-color: #35353f ;">
  <div class="container-fluid" >
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      
      
      <a class="navbar-brand" href="#">
       <img src="${damfn.getAssetLink("jcr:90180d68-8662-4198-8f6c-fa3fad673e6d")}"/>
      </a>
      
      
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



																		<!-- ide jonnek a nav elemek-->
	[#list menupontok as actualMenupont]
		
					<!-- lehetne nav fuggvennel is gyerekeit adja vissza-->
			
			[#assign subMenu = navfn.navItems(actualMenupont)]]
			[#if subMenu?size!=0]
				<li class="dropdown" >
					<a href="#" style="background-color: #35353f" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${actualMenupont}<span class="caret"></span></a>
						<ul class="dropdown-menu">
							[#list subMenu as actualSubMenu]
								<li><a href="#">${actualSubMenu}</a></li>
							[/#list]
						</ul>
				</li>
			
			[#else]
				<li  ><a style="background-color: #35353f ;" href="#">${actualMenupont}</a></li>
			[/#if]
			
	[/#list] 



        <li><a href="#">Link</a></li>
       
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Action</a></li>
            <li><a href="#">Another action</a></li>
            <li><a href="#">Something else here</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">Separated link</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="#">One more separated link</a></li>
          </ul>
        </li>
      </ul>
     
        
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
















      
    
     [@cms.area name="header"/]
     
     
     
   



  hello ez a main area
  [@cms.area name="main"/]





a fejlécet betenni egy header areaba ahonnan csak ezt lehet kivaálasztani, és az osszes oldal ezt megorokli!
- nem kell hogy legyen dialogja
- az oldalak dialogjánál egy checkbox kerdezze meg hogy be akar e kerulni a menu rendszerbe
- a menu
brand képet betennia fejlécbe?


<!-- Footer -->

		[@cms.area name="footer" /]

<!-- End: Footer -->


</body>
</html>
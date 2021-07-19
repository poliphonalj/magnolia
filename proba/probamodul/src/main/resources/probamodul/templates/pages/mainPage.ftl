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
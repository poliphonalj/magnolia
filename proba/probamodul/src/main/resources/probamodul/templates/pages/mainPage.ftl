<!DOCTYPE html>
<html xml:lang="${cmsfn.language()}" lang="${cmsfn.language()}">




<head>

[#assign site =
sitefn.site()!]

[#assign theme =
sitefn.theme(site)!]











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


  	  /* The flip card container - set the width and height to whatever you want. We have added the border property to demonstrate that the flip itself goes out of the box on hover (remove perspective if you don't want the 3D effect */
	.flip-card {
  	background-color: transparent;
  	width: 300px;
  	height: 234px;
  	border: 1px solid #f1f1f1;
  	perspective: 1000px; /* Remove this if you don't want the 3D effect */
	}

	/* This container is needed to position the front and back side */
	.flip-card-inner {
  	position: relative;
  	width: 100%;
  	height: 100%;
  	text-align: center;
  	transition: transform 0.8s;
  	transform-style: preserve-3d;
	}

	/* Do an horizontal flip when you move the mouse over the flip box container */
	.flip-card:hover .flip-card-inner {
  	transform: rotateY(180deg);
	}

	/* Position the front and back side */
	.flip-card-front, .flip-card-back {
  	position: absolute;
  	width: 100%;
  	height: 100%;
  	-webkit-backface-visibility: hidden; /* Safari */
  	backface-visibility: hidden;
	}

	/* Style the front side (fallback if image is missing) */
	.flip-card-front {
  	background-color: #bbb;
  	color: black;
	}

	/* Style the back side */
	.flip-card-back {
  	background-color: dodgerblue;
  	color: white;
  	transform: rotateY(180deg);
	} 
	
	
	
	/* Style the header */
.header {

}
  
   /* Create 4 equal columns that floats next to each other */
.column {
  float: left;
  width: 25%;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Responsive layout - makes the 4 columns stack on top of each other instead of next to each other on smaller screens (600px wide or less) */
@media screen and (max-width: 600px) {
  .column {
    width: 100%;
  }
} 
  
.footer {

  background-color: pink;
  color: white;
}  
  
  
  </style>


</head>


<body>

<!-- header-->
<div class="header">
 	[@cms.area name="header"/]
</div>	
<!-- End: header -->

<!-- main -->
		[@cms.area name="main" /]
<!-- End: main -->

<!-- Footer -->
<div class="footer">
	[@cms.area name="footer" /]
</div>
<!-- End: Footer -->

</body>
</html>
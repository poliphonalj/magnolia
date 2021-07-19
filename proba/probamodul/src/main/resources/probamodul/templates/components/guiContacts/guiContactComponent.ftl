<div id="footercomp">

[#assign site =
sitefn.site()!]
 
[#assign theme =
sitefn.theme(site)!]

${theme}


you have the content object which is the component node. In the screenshot above, the node with the name 0 is the content object.
To display an image, you must get the subnode of content and pass it as argument to the imgfn templating function. You can use the same method to get the original version of the image and to get a variation.










[#assign binaryNode = cmsfn.asJCRNode(content).getNode('myNode') /]   

${binaryNode}

[#assign imgLink = imgfn.getImageVariationLinkFromBinary(binaryNode,'original') /]
[#assign imgLink240 = imgfn.getImageVariationLinkFromBinary(binaryNode,'small') /]

<div>
    <span>The default image</span><br/>
   
    <span>Image variation 240</span><br/>
    <img src="${imgLink240}">
</div>




















</div>
	 
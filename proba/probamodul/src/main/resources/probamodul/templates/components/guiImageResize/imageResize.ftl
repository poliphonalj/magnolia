[#assign binaryNode = cmsfn.asJCRNode(content).getNode('myNode') /]
[#assign imgLink240 = imgfn.getImageVariationLinkFromBinary(binaryNode,"100") /]
${binaryNode} -- binaryNoode
${imgLink240} -- imagelink
<div>
    
    
[#assign currentSiteDefinition = sitefn.site(content)]
   ${currentSiteDefinition} 
    [#assign currentTheme=sitefn.theme(sitefn.site(content))]
     ${currentTheme} 
  
    <span>Image variation 240</span><br/>
    <img src="${imgLink240}">
    
    
    
    
    [#assign rendition = damfn.getRendition(content.image5Resize, "100")] 
    ${rendition}
    ${rendition.getLink()}
    <img src="${rendition.getLink()}"/>
    
     <img src="/proba-webapp/.imaging/default/website/mainpage2/kep/main/0/myNode/generated-image"/>
    
   
    
    
    </div>
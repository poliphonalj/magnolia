hello ez a fromokat megjelenito oldal lesz!

[#assign dataModelList = model.getList() /]	<!--megkapja a datamodelleket tartalmazó listát (minden datamodelben egy hasmap van amiben a property-k laknak)-->
[#list dataModelList as actualDataModel]	<!-- ebben vannak a hashmapek a property-kel-->
	[#assign propertiesList4actualDataModel = actualDataModel.gethMap()]
	[#list propertiesList4actualDataModel as actualPropertyKey,actualPropertyValue]
		<br>szia:  ${actualPropertyKey}  --  ${actualPropertyValue}<br><br>
	[/#list]
[/#list]

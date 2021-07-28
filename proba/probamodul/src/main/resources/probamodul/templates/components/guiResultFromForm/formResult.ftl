hello ez a formokat megjelenito oldal lesz!

<table style="width:100%">
[#assign dataModelList = model.getList() /]	<!--megkapja a datamodelleket tartalmazó listát (minden datamodelben egy hasmap van amiben a property-k laknak)-->

[#list dataModelList as actualDataModel]	<!-- ebben vannak a hashmapek a property-kel-->
	<tr>
	[#assign propertiesList4actualDataModel = actualDataModel.gethMap()]
		[#list propertiesList4actualDataModel as actualPropertyKey,actualPropertyValue]
		
		<td>${actualPropertyKey} : ${actualPropertyValue}</td>
	[/#list]
	</tr>
[/#list]
</table>
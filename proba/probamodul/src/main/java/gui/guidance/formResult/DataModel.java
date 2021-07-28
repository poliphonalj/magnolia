package gui.guidance.formResult;

import org.apache.commons.collections.map.HashedMap;


public class DataModel{
	private HashedMap hMap=new HashedMap();
	
	public DataModel() {
	}

	public HashedMap gethMap() {
		return hMap;
	}

	public void sethMap(HashedMap hMap) {
		this.hMap = hMap;
	}
}
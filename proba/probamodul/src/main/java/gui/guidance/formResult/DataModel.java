package gui.guidance.formResult;

import org.apache.commons.collections.map.HashedMap;

import com.google.inject.spi.PrivateElements;

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
	
	public String getVal() {
		return "valuewwwwwwwww";
	}

}
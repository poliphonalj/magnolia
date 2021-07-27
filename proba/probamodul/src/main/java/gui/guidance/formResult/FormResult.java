//ez egy Renderer osztály

package gui.guidance.formResult;

import java.util.ArrayList;

import javax.inject.Inject;
import javax.jcr.Node;
import javax.jcr.NodeIterator;
import javax.jcr.Property;
import javax.jcr.PropertyIterator;
import javax.jcr.RepositoryException;
import javax.jcr.Session;

import org.apache.commons.collections.map.HashedMap;

import info.magnolia.context.MgnlContext;
import info.magnolia.rendering.model.RenderingModel;
import info.magnolia.rendering.model.RenderingModelImpl;
import info.magnolia.rendering.template.configured.ConfiguredTemplateDefinition;

public class FormResult <RD extends ConfiguredTemplateDefinition> extends RenderingModelImpl<ConfiguredTemplateDefinition> {
	private HashedMap propertiesMap;		//properties: kulcs-érték pár
	ArrayList<DataModel>list=new ArrayList<DataModel>();
	
	DataModel dm;
	
	@Inject
	public FormResult(Node content, ConfiguredTemplateDefinition definition, RenderingModel<?> parent) throws RepositoryException {
		super(content, definition, parent);
	
	Session session=MgnlContext.getJCRSession("form2db"); // igy valthatunk workspace-t
	Node rootNode=session.getRootNode();
	NodeIterator nodeIterator=rootNode.getNodes();

	Node firstChild=null;
	while(nodeIterator.hasNext()) {
		firstChild=(Node)nodeIterator.next();
		if(firstChild.getName().contains("jcr:system") || firstChild.getName().contains("rep:accesscontrol") ){
			System.out.println("nem jo");
		}
		else{
			System.out.println("firstChild nevek:   "+firstChild.getName());
		}
	}
	
	Node secondChild=null;
	NodeIterator nodeIterator2=firstChild.getNodes();
	while(nodeIterator2.hasNext()) {
			secondChild=(Node)nodeIterator2.next();
			if(secondChild.getName().contains("jcr:system") || secondChild.getName().contains("rep:accesscontrol") ){
				System.out.println("nem jo");
			}
			else{
				System.out.println("secondChild nevek:   "+secondChild.getName());
			}
	}
	 
	 NodeIterator nodeIterator3=secondChild.getNodes();
	 while(nodeIterator3.hasNext()) {
			Node thirdChild=(Node)nodeIterator3.next();
			if(thirdChild.getName().contains("jcr:system") || thirdChild.getName().contains("rep:accesscontrol") ){
				System.out.println("nem jo");
			}
			else{
				System.out.println("thirdChild nevek:   "+thirdChild.getName()+"  +  ");
				PropertyIterator pIterator = thirdChild.getProperties();
				while(pIterator.hasNext()) {
					Property property = (Property)pIterator.next();
					if(!((property.getName().contains("jcr:") || property.getName().contains("mgnl:")))) {
						//egy property value-nak a kikérése a getString() metódussal történik
						System.out.println(property.getName()+" : "+ property.getString());	
						dm=new DataModel();
						propertiesMap=new HashedMap();
						
						propertiesMap.put(property.getName(), property.getString());	//itt beteszi a kulcs értk párokat a mapbe, nem kell tudni előre sem a kulcsot sem a db számot!
						dm.sethMap(propertiesMap);		//a datamodelhez hozzáadom a hashmapet
						list.add(dm);					//a datamodelt beteszem egy listaba amit az .ftl-nek kuldök át
					}
					
				}
			}
		}
	}

	@Override
	public String execute() {
		// TODO Auto-generated method stub
		return super.execute();
	}

	public HashedMap getPropertiesMap() {
		return propertiesMap;
	}

	public void setPropertiesMap(HashedMap propertiesMap) {
		this.propertiesMap = propertiesMap;
	}

	public ArrayList<DataModel> getList() {
		return list;
	}

	public void setList(ArrayList<DataModel> list) {
		this.list = list;
	}
	
	
}

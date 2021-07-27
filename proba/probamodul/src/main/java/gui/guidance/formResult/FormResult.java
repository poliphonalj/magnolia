//ez egy Renderer osztály

package gui.guidance.formResult;

import javax.inject.Inject;
import javax.jcr.Node;
import javax.jcr.NodeIterator;
import javax.jcr.Property;
import javax.jcr.PropertyIterator;
import javax.jcr.RepositoryException;
import javax.jcr.Session;
import info.magnolia.context.MgnlContext;
import info.magnolia.rendering.model.RenderingModel;
import info.magnolia.rendering.model.RenderingModelImpl;
import info.magnolia.rendering.template.configured.ConfiguredTemplateDefinition;

public class FormResult <RD extends ConfiguredTemplateDefinition> extends RenderingModelImpl<ConfiguredTemplateDefinition> {
	
	@Inject
	public FormResult(Node content, ConfiguredTemplateDefinition definition, RenderingModel<?> parent) throws RepositoryException {
		super(content, definition, parent);
	
	Session session=MgnlContext.getJCRSession("form2db"); // igy vaalto workspace-t
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
}

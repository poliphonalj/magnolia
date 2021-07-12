package gui.guidance;
import info.magnolia.*;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.GregorianCalendar;
import javax.jcr.AccessDeniedException;
import javax.jcr.ItemNotFoundException;
import javax.jcr.Node;
import javax.jcr.RepositoryException;
import javax.servlet.http.HttpServletRequest;

import org.apache.jackrabbit.commons.iterator.AbstractLazyIterator;

import com.google.inject.spi.PrivateElements;

import info.magnolia.context.MgnlContext;
import info.magnolia.jcr.util.ContentMap;
import info.magnolia.rendering.model.RenderingModel;
import info.magnolia.rendering.model.RenderingModelImpl;
import info.magnolia.rendering.template.configured.ConfiguredTemplateDefinition;
import info.magnolia.templating.functions.SearchTemplatingFunctions;

public class PaginatedNews <RD extends ConfiguredTemplateDefinition> extends RenderingModelImpl<ConfiguredTemplateDefinition> {
	
	private ArrayList<News> newsList=new ArrayList<News>();
	private String actualPosition;
	private ArrayList<String>pagerList=new ArrayList<>();
	private int lengthOfResults;
	private int lengthOfPages;
	private boolean first=false;
	private boolean last=false;
	private boolean next=false;
	private boolean back=false;
	private String img;
	
	public PaginatedNews(Node content, ConfiguredTemplateDefinition definition, RenderingModel<?> parent) throws AccessDeniedException, ItemNotFoundException, RepositoryException {
		super(content, definition, parent);
	}

	
	@Override
	public String execute() { 
	String param;
	
	if(MgnlContext.getInstance().getAttribute("page")==null){	//ez az elso betoltesnel van van
		 param = "1";
		 actualPosition ="1";
	}
	else{
		param =	 MgnlContext.getInstance().getAttribute("page");
		if(param.startsWith("<")){
			param =	param.substring(1, param.length()-1); //az aktuális oldalszamot pl igy kappja vissza: <2>, itt levágjuk a két kacsacsört!
		}
		actualPosition =	 MgnlContext.getInstance().getAttribute("page");
		pagerList.clear();
	}
	
	int a=Integer.parseInt(param);
	int offset=2*a-1;
	System.out.println("offset:"+offset);
	SearchTemplatingFunctions searchTemplatingFunctions=new SearchTemplatingFunctions();
		try {
			lengthOfResults=searchTemplatingFunctions.searchContent("news-app", "*", "/", "lib:actualNews").size();
			Collection<ContentMap>list= searchTemplatingFunctions.searchContent("news-app", "*", "/", "lib:actualNews",2,offset);// ide betenni a param-ot visszateresek szamo, honnan
			//Collection<ContentMap>list= searchTemplatingFunctions.searchContent("news-app", "*", "/", "lib:actualNews");// ide betenni a param-ot visszateresek szamo, honnan

			
			for (ContentMap actualmap : list) {  
				News news=new News();
				news.setAuthor((String)actualmap.get("author"));
				news.setIntro((String)actualmap.get("intro"));
				news.setText((String)actualmap.get("text"));
				if(actualmap.get("image")!=null){
					 img=(String)actualmap.get("image");
				}
				else {
					img="na";	
				}								//ha nincs kép, mivel a kép nem kötelező
				news.setImage(img);
				GregorianCalendar date=((GregorianCalendar)actualmap.get("publish_date"));
				news.setPublish_date(date.toString());
				newsList.add(news);
			}
			createPagerList(actualPosition, lengthOfResults);
		} catch (RepositoryException e) {
			System.out.println("itt torik el a program");// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// TODO Auto-generated method stub
		return super.execute();
 	}
 
	
	public ArrayList<News>getNewsList(){
		return newsList;
	}
	
	
	public void createPagerList(String actual, int lenghtOfResults){				//itt lesz a logika ami legyártja az aktuális pagerListet az actualPosition alapjan
		int actualPos=Integer.parseInt(actual);
		
		if(lengthOfResults%2==0){
			lengthOfPages=lenghtOfResults/2;
		//lengthOfPages=21;
		}
		else{
			lengthOfPages=(lenghtOfResults/2)+1;
		//lengthOfPages=21;
		}
		
		if(lengthOfPages<=10){								//ha 10 oldalnal kevesebb van akkor minden link megjelenik elso es utolso nelkul
			this.setBack(false);
			this.setFirst(false);
			this.setLast(false);
			this.setNext(false);
			for(int i=1;i<=lengthOfPages;i++){
				pagerList.add(i+"");
			}
			pagerList.remove(actualPos-1);
			pagerList.add(actualPos-1, "<"+actual+">");
		}
		
		else if(lengthOfPages>10 && actualPos==1){		//legelso
			pagerList.clear();
			this.setBack(false);
			this.setFirst(false);
			this.setLast(true);
			this.setNext(true);
		
			for(int i=1;i<=3;i++){
				pagerList.add(i+"");
			}
			pagerList.remove(0);
			pagerList.add(0, "<"+actual+">");
		}
		
		
		else if(lengthOfPages>10 && actualPos==2){		//masodik
			pagerList.clear();
			this.setBack(true);
			this.setFirst(true);
			this.setLast(true);
			this.setNext(true);
		
			for(int i=1;i<=4;i++){
				pagerList.add(i+"");
			}
			pagerList.remove(1);
			pagerList.add(1, "<"+actual+">");
		}
		
		else if(lengthOfPages>10 && actualPos==lengthOfPages){	//utolso
			
			this.setBack(true);
			this.setFirst(true);
			this.setLast(false);
			this.setNext(false);
		
			for(int i=lengthOfPages;i>=lengthOfPages-2;i--){
				pagerList.add(i+"");
			}
			pagerList.remove(actualPos-1);
			pagerList.add(actualPos-1, "<"+actual+">");
		}
		
		else if(lengthOfPages>10 && actualPos==lengthOfPages-1){		//utolso elotti
			this.setBack(true);
			this.setFirst(true);
			this.setLast(true);
			this.setNext(true);
		
			for(int i=lengthOfPages;i>=lengthOfPages-2;i--){
				pagerList.add(i+"");
			}
			//meg az uccso tagot betenni ittt
			pagerList.remove(actualPos-2);
			pagerList.add(actualPos-2, "<"+actual+">");
		}
		
		else{									//altalanos eset
			pagerList.clear();
			this.setBack(true);
			this.setFirst(true);
			this.setLast(true);
			this.setNext(true);
			
			for(int i=actualPos-2;i<actualPos+3;i++){
				pagerList.add(i+"");
			}
			
			pagerList.remove(2);
			pagerList.add(2, "<"+actualPos+">");
		}
	}


	public ArrayList<String>getPagerList(){		//a pagerList ami tartalmazza a navigációs linkeket
		return pagerList;
	}

	public boolean isFirst() {
		return first;
	}

	public void setFirst(boolean first) {
		this.first = first;
	}

	public boolean isLast() {
		return last;
	}

	public void setLast(boolean last) {
		this.last = last;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public boolean isBack() {
		return back;
	}

	public void setBack(boolean back) {
		this.back = back;
	}
	
	public int getBackElement(){
		return (Integer.parseInt(actualPosition))-1;
	}
	
	public int getNextElement(){
		return (Integer.parseInt(actualPosition))+1;
	}
	
	public int getLastElement(){
		return (lengthOfPages-1);
	}
}

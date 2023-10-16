package db;

import java.sql.DriverManager;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class xmltest {
	
	public static void main(String[] args) {
		try {
			String apiKey = "dn5V7VHzMAAH9UmfOInjhNIBWgJak1bNISgkquqQu7anHP%2BpKIBznJZtPV6%2FFGYD88Htbt8kVBuW3MGh7rVvHA%3D%3D";
			String url = "http://openapi.qnet.or.kr/api/service/rest/InquiryStatSVC/getTotExamList?ServiceKey="+apiKey+"&baseYY=2017";
			DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
			Document doc = dBuilder.parse(url);

			// 3. 데이터 삽입
			// String sql = "INSERT INTO examinfo (jmcd, jmfldnm,  obligfldcd, obligfldnm, mdobligfldcd, mdobligfldnm, seriescd, seriesnm, qualgbcd, qualgbnm) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			// pstmt = conn.prepareStatement(sql);

			NodeList nList = doc.getElementsByTagName("item");
			for (int temp = 0; temp < nList.getLength(); temp++) {
				Node nNode = nList.item(temp);
				if (nNode.getNodeType() == Node.ELEMENT_NODE) {
					Element eElement = (Element) nNode;

					System.out.println("=================================");
					System.out.println("pilrccnt6 : " + getTagValue("pilrccnt6",eElement));
					System.out.println("pilrccnt5 : " + getTagValue("pilrccnt5",eElement));
					System.out.println("pilrccnt4 : " + getTagValue("pilrccnt4",eElement));
					System.out.println("pilrccnt3 : " + getTagValue("pilrccnt3",eElement));
					System.out.println("pilrccnt2 : " + getTagValue("pilrccnt2",eElement));
					System.out.println("pilrccnt1 : " + getTagValue("pilrccnt1",eElement));
					System.out.println("silrccnt6 : " + getTagValue("silrccnt6",eElement));
					System.out.println("silrccnt5 : " + getTagValue("silrccnt5",eElement));
					System.out.println("silrccnt4 : " + getTagValue("silrccnt4",eElement));
					System.out.println("silrccnt3 : " + getTagValue("silrccnt3",eElement));
					System.out.println("silrccnt2 : " + getTagValue("silrccnt2",eElement));
					System.out.println("silrccnt1 : " + getTagValue("silrccnt1",eElement));
					System.out.println("=================================");

//					pstmt.executeUpdate();
				}
			}
		} catch (Exception e) {
//			try {
//				if(pstmt!=null) {
//					pstmt.close();
//					
//				}
//				conn.close();
//				
//			} catch(Exception e2) {
//				e2.printStackTrace();				
//			}
			e.printStackTrace();
		}
	}

	public static String getTagValue(String tag, Element eElement) { // 태그값을 받아옴
		String result = ""; // 나중에 리턴값을 받음(밑에꺼)

		NodeList nList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
		result = nList.item(0).getTextContent();

		return result;
	}
	
	public static String getTagValue(String tag, String childTag, Element eElement) {

		//결과를 저장할 result 변수 선언
		String result = "";

		NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();

		for(int i = 0; i < eElement.getElementsByTagName(childTag).getLength(); i++) {

			//result += nlList.item(i).getFirstChild().getTextContent() + " ";
			result += nlList.item(i).getChildNodes().item(0).getTextContent() + " ";
		}

		return result;
	}
}


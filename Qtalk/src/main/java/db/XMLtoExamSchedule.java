package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import service.ExamInfoService;
import service.ExamInfoServiceImpl;

public class XMLtoExamSchedule {
 
	private static final String DB_URL = "jdbc:mariadb://localhost:3306/qtalk";
	private static final String DB_USER = "root";
	private static final String DB_PASSWORD = "1234";
	
	public static String getTagValue(String tag, Element eElement) { //태그값을 받아옴
		String result = ""; // 나중에 리턴값을 받음

		NodeList nList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
		result = nList.item(0).getTextContent();

		return result;
	}

	public static void main(String[] args) {
		//
		List<String> list = null;
		try {
			ExamInfoService examInfoService = new ExamInfoServiceImpl();
			list = examInfoService.jmcd();
//			System.out.println(list);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		PreparedStatement pstmt = null;
		Connection conn = null;
		for(String li : list) {
			String apiKey = "";
			try {
				String url = "http://openapi.q-net.or.kr/api/service/rest/InquiryTestInformationNTQSVC/getJMList?jmcd="+li+"&serviceKey=관리자에게 문의&jmCd="+li;
				DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
				DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
				Document doc = dBuilder.parse(url);
				// 2. DB 연결
				conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
				
				// 3. 데이터 삽입
				String sql = "INSERT INTO  examschedule (jmfldnm, implplannm, docregstartdt, docregenddt, docexamstartdt, docexamenddt, docpassdt, docsubmitstartdt, docsubmitenddt, pracregstartdt, pracregenddt, pracexamstartdt, pracexamenddt, pracpassstartdt, pracpassenddt, obligfldcd, obligfldnm, mdobligfldcd, mdobligfldnm) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)"; 
				pstmt = conn.prepareStatement(sql);

				NodeList nList = doc.getElementsByTagName("item");
				for (int temp = 0; temp < nList.getLength(); temp++) {
					Node nNode = nList.item(temp);
					if (nNode.getNodeType() == Node.ELEMENT_NODE) {
						Element eElement = (Element) nNode;
						pstmt.setString(1, getTagValue("jmfldnm", eElement)); // 종목
						pstmt.setString(2, getTagValue("implplannm", eElement)); // 
						pstmt.setString(3, getTagValue("docregstartdt", eElement));
						pstmt.setString(4, getTagValue("docregenddt", eElement));
						pstmt.setString(5, getTagValue("docexamstartdt", eElement));
						pstmt.setString(6, getTagValue("docexamenddt", eElement));
						pstmt.setString(7, getTagValue("docpassdt", eElement));
						pstmt.setString(8, getTagValue("docsubmitstartdt", eElement));
						pstmt.setString(9, getTagValue("docsubmitenddt", eElement));
						pstmt.setString(10, getTagValue("pracregstartdt", eElement));
						pstmt.setString(11, getTagValue("pracregenddt", eElement));
						pstmt.setString(12, getTagValue("pracexamstartdt", eElement));
						pstmt.setString(13, getTagValue("pracexamenddt", eElement));
						pstmt.setString(14, getTagValue("pracpassstartdt", eElement));
						pstmt.setString(15, getTagValue("pracpassenddt", eElement));
						pstmt.setString(16, getTagValue("obligfldcd", eElement));
						pstmt.setString(17, getTagValue("obligfldnm", eElement));
						pstmt.setString(18, getTagValue("mdobligfldcd", eElement));
						pstmt.setString(19, getTagValue("mdobligfldnm", eElement));
	
						pstmt.executeUpdate();
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
				try {
					if(pstmt!=null) {
						pstmt.close();
						
					}
					conn.close();
					
				} catch(Exception e2) {
					e2.printStackTrace();				
				}
			}
		}
	} // main
} // class
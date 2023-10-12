package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

// ... [XML 파싱 관련 임포트]

public class XMLtoExamInfoDB {

	private static final String DB_URL = "jdbc:mariadb://localhost:3306/qtalk";
	private static final String DB_USER = "root";
	private static final String DB_PASSWORD = "1234";



	public static void main(String[] args) {
		PreparedStatement pstmt = null;
		Connection conn = null;
		try {
			String url = "http://openapi.q-net.or.kr/api/service/rest/InquiryListNationalQualifcationSVC/getList?serviceKey=관리자에게 문의&";
			DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
			Document doc = dBuilder.parse(url);
			// 2. DB 연결
			conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

			// 3. 데이터 삽입
			String sql = "INSERT INTO examinfo (jmcd, jmfldnm,  obligfldcd, obligfldnm, mdobligfldcd, mdobligfldnm, seriescd, seriesnm, qualgbcd, qualgbnm) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);

			NodeList nList = doc.getElementsByTagName("item");
			for (int temp = 0; temp < nList.getLength(); temp++) {
				Node nNode = nList.item(temp);
				if (nNode.getNodeType() == Node.ELEMENT_NODE) {
					Element eElement = (Element) nNode;
					pstmt.setString(1, getTagValue("jmcd", eElement)); //종목코드
					pstmt.setString(2, getTagValue("jmfldnm", eElement)); // 
					pstmt.setString(3, getTagValue("obligfldcd", eElement));
					pstmt.setString(4, getTagValue("obligfldnm", eElement));
					pstmt.setString(5, getTagValue("mdobligfldcd", eElement));
					pstmt.setString(6, getTagValue("mdobligfldnm", eElement));
					pstmt.setString(7, getTagValue("seriescd", eElement));
					pstmt.setString(8, getTagValue("seriesnm", eElement));
					pstmt.setString(9, getTagValue("qualgbcd", eElement));
					pstmt.setString(10, getTagValue("qualgbnm", eElement));

					pstmt.executeUpdate();
				}
			}
		} catch (Exception e) {
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

	public static String getTagValue(String tag, Element eElement) { // 태그값을 받아옴
		String result = ""; // 나중에 리턴값을 받음(밑에꺼)

		NodeList nList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
		result = nList.item(0).getTextContent();

		return result;
	}
}

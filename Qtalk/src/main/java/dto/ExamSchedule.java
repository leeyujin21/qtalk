package dto;

import java.sql.Date;

public class ExamSchedule {
	private int num;
	private String jmfldnm; //  종목명
	private String implplannm; //  회차
	private Date docregstartdt; //  필기원서접수시작일자
	private Date docregenddt; //  필기원서접수종료일자
	private Date docexamstartdt; //  필기시험시작일정
	private Date docexamenddt ; //  필기시험종료일자
	private Date docpassdt ; //  필기시험 합격(예정)자 발표
	private Date docsubmitstartdt ; //  응시자격서류제출시작일자
	private Date docsubmitenddt ; //  응시자격 서류제출종료일자
	private Date pracregstartdt ; //  실기시험원서접수시작일자
	private Date pracregenddt ; //  실기시험원서접수종료일자
	private Date pracexamstartdt ; //  실기시험시작일자
	private Date pracexamenddt ; //  실기시험종료일자
	private Date pracpassstartdt ; //  합격자발표시작일자
	private Date pracpassenddt ; //  합격자발표종료일자
	private String obligfldcd; //  대직무분야코드
	private String obligfldnm; //  대직무분야명
	private String mdobligfldcd; //  중직무분야코드
	private String mdobligfldnm; //  중직무분야명
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getJmfldnm() {
		return jmfldnm;
	}
	public void setJmfldnm(String jmfldnm) {
		this.jmfldnm = jmfldnm;
	}
	public String getImplplannm() {
		return implplannm;
	}
	public void setImplplannm(String implplannm) {
		this.implplannm = implplannm;
	}
	public Date getDocregstartdt() {
		return docregstartdt;
	}
	public void setDocregstartdt(Date docregstartdt) {
		this.docregstartdt = docregstartdt;
	}
	public Date getDocregenddt() {
		return docregenddt;
	}
	public void setDocregenddt(Date docregenddt) {
		this.docregenddt = docregenddt;
	}
	public Date getDocexamstartdt() {
		return docexamstartdt;
	}
	public void setDocexamstartdt(Date docexamstartdt) {
		this.docexamstartdt = docexamstartdt;
	}
	public Date getDocexamenddt() {
		return docexamenddt;
	}
	public void setDocexamenddt(Date docexamenddt) {
		this.docexamenddt = docexamenddt;
	}
	public Date getDocpassdt() {
		return docpassdt;
	}
	public void setDocpassdt(Date docpassdt) {
		this.docpassdt = docpassdt;
	}
	public Date getDocsubmitstartdt() {
		return docsubmitstartdt;
	}
	public void setDocsubmitstartdt(Date docsubmitstartdt) {
		this.docsubmitstartdt = docsubmitstartdt;
	}
	public Date getDocsubmitenddt() {
		return docsubmitenddt;
	}
	public void setDocsubmitenddt(Date docsubmitenddt) {
		this.docsubmitenddt = docsubmitenddt;
	}
	public Date getPracregstartdt() {
		return pracregstartdt;
	}
	public void setPracregstartdt(Date pracregstartdt) {
		this.pracregstartdt = pracregstartdt;
	}
	public Date getPracregenddt() {
		return pracregenddt;
	}
	public void setPracregenddt(Date pracregenddt) {
		this.pracregenddt = pracregenddt;
	}
	public Date getPracexamstartdt() {
		return pracexamstartdt;
	}
	public void setPracexamstartdt(Date pracexamstartdt) {
		this.pracexamstartdt = pracexamstartdt;
	}
	public Date getPracexamenddt() {
		return pracexamenddt;
	}
	public void setPracexamenddt(Date pracexamenddt) {
		this.pracexamenddt = pracexamenddt;
	}
	public Date getPracpassstartdt() {
		return pracpassstartdt;
	}
	public void setPracpassstartdt(Date pracpassstartdt) {
		this.pracpassstartdt = pracpassstartdt;
	}
	public Date getPracpassenddt() {
		return pracpassenddt;
	}
	public void setPracpassenddt(Date pracpassenddt) {
		this.pracpassenddt = pracpassenddt;
	}
	public String getObligfldcd() {
		return obligfldcd;
	}
	public void setObligfldcd(String obligfldcd) {
		this.obligfldcd = obligfldcd;
	}
	public String getObligfldnm() {
		return obligfldnm;
	}
	public void setObligfldnm(String obligfldnm) {
		this.obligfldnm = obligfldnm;
	}
	public String getMdobligfldcd() {
		return mdobligfldcd;
	}
	public void setMdobligfldcd(String mdobligfldcd) {
		this.mdobligfldcd = mdobligfldcd;
	}
	public String getMdobligfldnm() {
		return mdobligfldnm;
	}
	public void setMdobligfldnm(String mdobligfldnm) {
		this.mdobligfldnm = mdobligfldnm;
	}

	
}

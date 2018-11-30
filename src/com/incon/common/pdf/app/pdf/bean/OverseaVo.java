package com.incon.common.pdf.app.pdf.bean;

import java.util.List;

import com.incon.common.pdf.app.pdf.AbstractDocumentVo;


/**
 * �����Ԯpdf���VO
 * @ClassName: OverseaVo
 * @Description: �����Ԯpdf���VO
 * @author lihengjun
 * �޸�ʱ�䣺 2013��11��11�� ����2:48:23
 * �޸����ݣ��½�
 */
public class OverseaVo extends AbstractDocumentVo{
	
	/**
	 * ������
	 */
	private String policyNo;
	/**
	 * Ͷ��������
	 */
	private String holderName;
	/**
	 * Ͷ�����˹�ϵ
	 */
	private String relation;
	/**
	 * Ͷ���������ַ
	 */
	private String holderAdress;
	/**
	 * Ͷ�����ʱ�
	 */
	private String holderPostCode;
	
	/**
	 * ������������
	 */
	private String insuredName;
	/**
	 * ������������ƴ��
	 */
	private String insuredPingyinName;
	/**
	 * �������˻��պ���
	 */
	private String insuredPassportNo;
	/**
	 * ���������Ա�
	 */
	private String insuredSex;
	/**
	 * �������˳�������
	 */
	private String insuredBirthday;
	/**
	 * �������˵绰
	 */
	private String insuredPhone;
	
	/**
	 * ��������֤������
	 */
	private String insuredIDNo;
	
	/**
	 * ǰ���һ����
	 */
	private String destination;
	
	/**
	 * ����������
	 */
	private String beneficiaryName;
	
	/**
	 * ��ע
	 */
	private String remarks;
	
	/**
	 * �����ڼ�
	 */
	private String period;
	
	/**
	 * ���������˺���м�����
	 */
	private String accidentalSumInsured;
	
	/**
	 * ������Ԯҽ�Ʊ���
	 */
	private String emergencySumInsured;
	
	/**
	 * ���Ӿ��������Ԯҽ����
	 */
	private String medicalSumInsured;
	
	/**
	 * �ܱ���
	 */
	private String premium;
	/**
	 * ǩ������
	 */
	private String issueDate;
	
	/**
	 * ʡ��
	 */
	private String branchName;
	
	/**
	 * ������˾���
	 */
	private String companyName;
	
	/**
	 * ͼƬ���·��
	 */
	private String imagePath;
	
	private String abc;
	private List   vlist;
	

	public String getHolderName() {
		return holderName;
	}

	public void setHolderName(String holderName) {
		this.holderName = holderName;
	}

	public String getRelation() {
		return relation;
	}

	public void setRelation(String relation) {
		this.relation = relation;
	}

	public String getHolderAdress() {
		return holderAdress;
	}

	public void setHolderAdress(String holderAdress) {
		this.holderAdress = holderAdress;
	}

	public String getHolderPostCode() {
		return holderPostCode;
	}

	public void setHolderPostCode(String holderPostCode) {
		this.holderPostCode = holderPostCode;
	}

	public String getInsuredName() {
		return insuredName;
	}

	public void setInsuredName(String insuredName) {
		this.insuredName = insuredName;
	}

	public String getInsuredPingyinName() {
		return insuredPingyinName;
	}

	public void setInsuredPingyinName(String insuredPingyinName) {
		this.insuredPingyinName = insuredPingyinName;
	}

	public String getInsuredPassportNo() {
		return insuredPassportNo;
	}

	public void setInsuredPassportNo(String insuredPassportNo) {
		this.insuredPassportNo = insuredPassportNo;
	}

	public String getInsuredSex() {
		return insuredSex;
	}

	public void setInsuredSex(String insuredSex) {
		this.insuredSex = insuredSex;
	}

	public String getInsuredBirthday() {
		return insuredBirthday;
	}

	public void setInsuredBirthday(String insuredBirthday) {
		this.insuredBirthday = insuredBirthday;
	}

	public String getInsuredPhone() {
		return insuredPhone;
	}

	public void setInsuredPhone(String insuredPhone) {
		this.insuredPhone = insuredPhone;
	}

	public String getInsuredIDNo() {
		return insuredIDNo;
	}

	public void setInsuredIDNo(String insuredIDNo) {
		this.insuredIDNo = insuredIDNo;
	}

	public String getDestination() {
		return destination;
	}

	public void setDestination(String destination) {
		this.destination = destination;
	}

	public String getBeneficiaryName() {
		return beneficiaryName;
	}

	public void setBeneficiaryName(String beneficiaryName) {
		this.beneficiaryName = beneficiaryName;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getPeriod() {
		return period;
	}

	public void setPeriod(String period) {
		this.period = period;
	}


	public String getPremium() {
		return premium;
	}

	public void setPremium(String premium) {
		this.premium = premium;
	}


	public String getIssueDate() {
		return issueDate;
	}

	public void setIssueDate(String issueDate) {
		this.issueDate = issueDate;
	}

	public String getBranchName() {
		return branchName;
	}

	public void setBranchName(String branchName) {
		this.branchName = branchName;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getAccidentalSumInsured() {
		return accidentalSumInsured;
	}

	public void setAccidentalSumInsured(String accidentalSumInsured) {
		this.accidentalSumInsured = accidentalSumInsured;
	}

	public String getEmergencySumInsured() {
		return emergencySumInsured;
	}

	public void setEmergencySumInsured(String emergencySumInsured) {
		this.emergencySumInsured = emergencySumInsured;
	}

	public String getMedicalSumInsured() {
		return medicalSumInsured;
	}

	public void setMedicalSumInsured(String medicalSumInsured) {
		this.medicalSumInsured = medicalSumInsured;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public String getPolicyNo() {
		return policyNo;
	}

	public void setPolicyNo(String policyNo) {
		this.policyNo = policyNo;
	}
	
	public String findPrimaryKey() {
		return this.policyNo;
	}

	public List getVlist() {
		return vlist;
	}

	public void setVlist(List vlist) {
		this.vlist = vlist;
	}
	public void addVlist(Object a) {
		this.vlist.add(a);
	}
	public String getAbc() {
		return abc;
	}

	public void setAbc(String abc) {
		this.abc = abc;
	}

	 

}

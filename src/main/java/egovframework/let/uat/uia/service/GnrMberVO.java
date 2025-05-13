package egovframework.let.uat.uia.service;

import java.util.Date;

/**
 * 일반회원 가입 시 사용하는 VO 클래스
 * LETTNGNRLMBER 테이블의 주요 컬럼과 매핑됨
 */
public class GnrMberVO {

    /** 회원 아이디 */
    private String mberId;

    /** 비밀번호 (암호화 전 상태) */
    private String password;

    /** 비밀번호 힌트 */
    private String passwordHint;

    /** 비밀번호 정답 */
    private String passwordCnsr;

    /** 회원 이름 */
    private String mberNm;

    /** 성별 코드 (M: 남성, F: 여성) */
    private String sexdstnCode;

    /** 우편번호 */
    private String zip;

    /** 기본 주소 */
    private String adres;

    /** 상세 주소 */
    private String detailAdres;

    /** 이메일 주소 */
    private String mberEmailAdres;

    /** 휴대폰 번호 */
    private String mbtlnum;

    /** 그룹 ID */
    private String groupId;

    /** 고유 식별 ID */
    private String esntlId;

    /** 가입일자 */
    private Date sbscrbDe;

    // ====== Getter / Setter ======

    public String getMberId() {
        return mberId;
    }

    public void setMberId(String mberId) {
        this.mberId = mberId;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPasswordHint() {
        return passwordHint;
    }

    public void setPasswordHint(String passwordHint) {
        this.passwordHint = passwordHint;
    }

    public String getPasswordCnsr() {
        return passwordCnsr;
    }

    public void setPasswordCnsr(String passwordCnsr) {
        this.passwordCnsr = passwordCnsr;
    }

    public String getMberNm() {
        return mberNm;
    }

    public void setMberNm(String mberNm) {
        this.mberNm = mberNm;
    }

    public String getSexdstnCode() {
        return sexdstnCode;
    }

    public void setSexdstnCode(String sexdstnCode) {
        this.sexdstnCode = sexdstnCode;
    }

    public String getZip() {
        return zip;
    }

    public void setZip(String zip) {
        this.zip = zip;
    }

    public String getAdres() {
        return adres;
    }

    public void setAdres(String adres) {
        this.adres = adres;
    }

    public String getDetailAdres() {
        return detailAdres;
    }

    public void setDetailAdres(String detailAdres) {
        this.detailAdres = detailAdres;
    }

    public String getMberEmailAdres() {
        return mberEmailAdres;
    }

    public void setMberEmailAdres(String mberEmailAdres) {
        this.mberEmailAdres = mberEmailAdres;
    }

    public String getMbtlnum() {
        return mbtlnum;
    }

    public void setMbtlnum(String mbtlnum) {
        this.mbtlnum = mbtlnum;
    }

    public String getGroupId() {
        return groupId;
    }

    public void setGroupId(String groupId) {
        this.groupId = groupId;
    }

    public String getEsntlId() {
        return esntlId;
    }

    public void setEsntlId(String esntlId) {
        this.esntlId = esntlId;
    }

    public Date getSbscrbDe() {
        return sbscrbDe;
    }

    public void setSbscrbDe(Date sbscrbDe) {
        this.sbscrbDe = sbscrbDe;
    }
}

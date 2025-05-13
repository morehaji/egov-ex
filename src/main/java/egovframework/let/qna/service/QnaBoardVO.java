package egovframework.let.qna.service;
import java.util.Date;


public class QnaBoardVO {
	private int qaId;			// 게시글 ID
	private String qaTitle;		// 제목
	private String qaContent;	// 내용
	private String writerId;	// 작성자 ID
	private String writerName;  // 작성자 이름
	private Date regDate;		// 등록일
	private Date modDate;		// 수정일
	private int readCount;		// 조회수
	private String delYn;		// 삭제 여부(Y/N)
	private int pageIndex;             // 현재 페이지 번호
	private int pageUnit;             // 한 페이지에 표시할 게시물 수
	private int pageSize;             // 페이지 리스트에 출력할 페이지 수
	private int firstIndex;           // 현재 페이지 시작 게시물 인덱스
	private int lastIndex;            // 현재 페이지 마지막 게시물 인덱스
	private int recordCountPerPage;   // 페이지당 게시물 수
	private int totalCount;           // 전체 게시물 수
	
	
	
	// Getters and Setters
	public int getQaId() {
		return qaId;
	}
	public void setQaId(int qaId) {
		this.qaId = qaId;
	}
	public String getQaTitle() {
		return qaTitle;
	}
	public void setQaTitle(String qaTitle) {
		this.qaTitle = qaTitle;
	}
	public String getQaContent() {
		return qaContent;
	}
	public void setQaContent(String qaContent) {
		this.qaContent = qaContent;
	}
	public String getWriterId() {
		return writerId;
	}
	public void setWriterId(String writerId) {
		this.writerId = writerId;
	}
	public String getWriterName() {
		return writerName;
	}
	public void setWriterName(String writerName) {
		this.writerName = writerName;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public Date getModDate() {
		return modDate;
	}
	public void setModDate(Date modDate) {
		this.modDate = modDate;
	}
	public int getReadCount() {
		return readCount;
	}
	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}
	public String getDelYn() {
		return delYn;
	}
	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}
	public int getPageIndex() {
		return pageIndex;
	}
	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}
	public int getPageUnit() {
		return pageUnit;
	}
	public void setPageUnit(int pageUnit) {
		this.pageUnit = pageUnit;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getFirstIndex() {
		return firstIndex;
	}
	public void setFirstIndex(int firstIndex) {
		this.firstIndex = firstIndex;
	}
	public int getLastIndex() {
		return lastIndex;
	}
	public void setLastIndex(int lastIndex) {
		this.lastIndex = lastIndex;
	}
	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}
	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	
}
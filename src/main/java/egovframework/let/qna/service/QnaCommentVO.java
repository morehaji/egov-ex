package egovframework.let.qna.service;

import java.util.Date;

public class QnaCommentVO {
	private Long commentId;        // 댓글 ID
    private Long qaId;             // 원글 ID
    private String commentText;    // 댓글 내용
    private String writerId;       // 작성자 ID
    private String writerName;     // 작성자 이름
    private Date regDate;          // 등록일
    private String delYn;          // 삭제 여부
	public Long getCommentId() {
		return commentId;
	}
	public void setCommentId(Long commentId) {
		this.commentId = commentId;
	}
	public Long getQaId() {
		return qaId;
	}
	public void setQaId(Long qaId) {
		this.qaId = qaId;
	}
	public String getCommentText() {
		return commentText;
	}
	public void setCommentText(String commentText) {
		this.commentText = commentText;
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
	public String getDelYn() {
		return delYn;
	}
	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}
	@Override
    public String toString() {
        return "QnaCommentVO [commentId=" + commentId + ", qaId=" + qaId + ", commentText=" + commentText
                + ", writerId=" + writerId + ", writerName=" + writerName + ", regDate=" + regDate + ", delYn=" + delYn + "]";
    }
	
}
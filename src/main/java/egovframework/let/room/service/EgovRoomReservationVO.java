package egovframework.let.room.service;

import java.io.Serializable;
import java.util.Date;

public class EgovRoomReservationVO implements Serializable {

    private static final long serialVersionUID = 1L;

    private int resvId;               // 예약 ID
    private int roomId;               // 회의실 ID
    private String userId;            // 예약자 ID
    private Date startTime;           // 예약 시작 시간
    private Date endTime;             // 예약 종료 시간
    private String purpose;           // 예약 목적
    private String status;            // 상태 (APPLIED, APPROVED, REJECTED)
    private Date regDate;             // 등록일자

    // 조회 시 회의실명도 같이 출력할 수 있도록 필드 추가 (JOIN용)
    private String roomName;

    // Getter / Setter
    public int getResvId() {
        return resvId;
    }

    public void setResvId(int resvId) {
        this.resvId = resvId;
    }

    public int getRoomId() {
        return roomId;
    }

    public void setRoomId(int roomId) {
        this.roomId = roomId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public String getPurpose() {
        return purpose;
    }

    public void setPurpose(String purpose) {
        this.purpose = purpose;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getRegDate() {
        return regDate;
    }

    public void setRegDate(Date regDate) {
        this.regDate = regDate;
    }

    public String getRoomName() {
        return roomName;
    }

    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }
}

package egovframework.let.room.service;

import java.io.Serializable;
import java.util.Date;

public class EgovMeetingRoomVO implements Serializable {

    private static final long serialVersionUID = 1L;

    private int roomId;               // 회의실 ID
    private String roomName;          // 회의실 이름
    private String location;          // 위치
    private int capacity;             // 수용 인원
    private String equipmentInfo;     // 비품 정보
    private String useYn;             // 사용 여부 (Y/N)
    private Date regDate;             // 등록일자
    private String delYn;			  // 삭제여부

    

	// Getter / Setter
    public int getRoomId() {
        return roomId;
    }

    public void setRoomId(int roomId) {
        this.roomId = roomId;
    }

    public String getRoomName() {
        return roomName;
    }

    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public String getEquipmentInfo() {
        return equipmentInfo;
    }

    public void setEquipmentInfo(String equipmentInfo) {
        this.equipmentInfo = equipmentInfo;
    }

    public String getUseYn() {
        return useYn;
    }

    public void setUseYn(String useYn) {
        this.useYn = useYn;
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
}
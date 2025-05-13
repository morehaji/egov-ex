package egovframework.let.room.service.impl;

import java.util.List;

import egovframework.let.room.service.EgovMeetingRoomVO;
import egovframework.let.room.service.EgovRoomReservationVO;

public interface EgovRoomMapper {
    List<EgovMeetingRoomVO> selectRoomList();
    
    List<EgovRoomReservationVO> selectAllReservations();
    
    // 회의실 조회 
	EgovMeetingRoomVO selectRoomById(Long roomId);
	
	// 회의실 예약
	void insertReservation(EgovRoomReservationVO reservationVO);

	// 내예약(회의실)
	List<EgovRoomReservationVO> selectReservationsByUser(String userId);

	// 예약취소(회의실)
	void updateReservationStatusToCancelled(int resvId);
}
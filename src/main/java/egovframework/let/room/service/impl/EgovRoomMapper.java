package egovframework.let.room.service.impl;

import java.util.List;
import java.util.Map;

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

	// 관리자 - 예약 승인 / 반려
	void updateReservationStatus(Map<String, Object> paramMap);

	// 관리자 - 회의실 등록
	void insertRoom(EgovMeetingRoomVO roomVO);

	// 관리자 - 회의실 목록
	List<EgovMeetingRoomVO> selectAdminRoomList();

	// 예약현황 달력 
	List<EgovRoomReservationVO> selectReservationsByRoomId(Long roomId);
}
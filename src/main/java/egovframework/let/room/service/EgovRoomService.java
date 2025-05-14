package egovframework.let.room.service;

import java.util.List;

public interface EgovRoomService {

	List<EgovMeetingRoomVO> selectRoomList();

	List<EgovRoomReservationVO> selectAllReservations();

	EgovMeetingRoomVO findById(Long roomId);

	void insertReservation(EgovRoomReservationVO reservationVO);

	List<EgovRoomReservationVO> selectReservationsByUser(String userId);

	void cancelReservation(int resvId);

	// 관리자 - 예약 승인 / 반려
	void updateReservationStatus(int resvId, String status);

	// 관리자 - 회의실 등록 
	void insertRoom(EgovMeetingRoomVO roomVO) throws Exception;

	// 관리자 - 회의실 목록
	List<EgovMeetingRoomVO> selectAdminRoomList();

	// 예약현황 달력 
	List<EgovRoomReservationVO> getReservationsByRoomId(Long roomId) throws Exception;
	
}
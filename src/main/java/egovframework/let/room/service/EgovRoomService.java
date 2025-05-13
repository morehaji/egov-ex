package egovframework.let.room.service;

import java.util.List;

public interface EgovRoomService {

	List<EgovMeetingRoomVO> selectRoomList();

	List<EgovRoomReservationVO> selectAllReservations();

	EgovMeetingRoomVO findById(Long roomId);

	void insertReservation(EgovRoomReservationVO reservationVO);

	List<EgovRoomReservationVO> selectReservationsByUser(String userId);

	void cancelReservation(int resvId);
	
}
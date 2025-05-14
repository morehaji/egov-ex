package egovframework.let.room.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import egovframework.let.room.service.EgovMeetingRoomVO;
import egovframework.let.room.service.EgovRoomReservationVO;
import egovframework.let.room.service.EgovRoomService;

@Service("egovRoomService")
@Transactional
public class EgovRoomServiceImpl implements EgovRoomService {

	@Resource(name = "egovRoomMapper")
    private EgovRoomMapper egovRoomMapper;
	
	@Override
	public List<EgovMeetingRoomVO> selectRoomList() {
		return egovRoomMapper.selectRoomList();
	}

	@Override
	public List<EgovRoomReservationVO> selectAllReservations() {
		return egovRoomMapper.selectAllReservations();
	
	}

	@Override
	public void insertReservation(EgovRoomReservationVO reservationVO) {
	    reservationVO.setStatus("APPLIED"); // 초기 상태
	    egovRoomMapper.insertReservation(reservationVO);
	}
	
	@Override
    public EgovMeetingRoomVO findById(Long roomId) {
        return egovRoomMapper.selectRoomById(roomId); // ← 매퍼 메서드 호출
    }
	
	@Override
	public List<EgovRoomReservationVO> selectReservationsByUser(String userId) {
	    return egovRoomMapper.selectReservationsByUser(userId);
	}
	
	@Override
	public void cancelReservation(int resvId) {
		egovRoomMapper.updateReservationStatusToCancelled(resvId);
	}
	
	// 관리자 - 예약 승인 / 반려
	@Override
	public void updateReservationStatus(int resvId, String status) {
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("resvId", resvId);
		paramMap.put("status", status);
		egovRoomMapper.updateReservationStatus(paramMap);
	}
	
	// 관리자 - 회의실 등록 
	@Override
	public void insertRoom(EgovMeetingRoomVO roomVO) throws Exception {
	    egovRoomMapper.insertRoom(roomVO);
	}
	
	@Override
	public List<EgovMeetingRoomVO> selectAdminRoomList() {
		return egovRoomMapper.selectAdminRoomList();
	}
	
	// 예약현황 달력 
	@Override
    public List<EgovRoomReservationVO> getReservationsByRoomId(Long roomId) throws Exception {
        return egovRoomMapper.selectReservationsByRoomId(roomId);
    }
}

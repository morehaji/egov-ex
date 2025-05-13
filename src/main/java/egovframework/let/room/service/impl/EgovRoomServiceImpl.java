package egovframework.let.room.service.impl;

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
	
}

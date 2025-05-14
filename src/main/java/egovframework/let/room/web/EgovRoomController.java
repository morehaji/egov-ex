package egovframework.let.room.web;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.com.cmm.LoginVO;
import egovframework.let.room.service.EgovMeetingRoomVO;
import egovframework.let.room.service.EgovRoomReservationVO;
import egovframework.let.room.service.EgovRoomService;

@Controller
public class EgovRoomController {
	
	@Resource(name = "egovRoomService")
	private EgovRoomService egovRoomService;
	
	// 회의실 리스트 조회 
	@RequestMapping("/room/roomList.do")
	public String roomList(ModelMap model) {
	    List<EgovMeetingRoomVO> roomList = egovRoomService.selectRoomList();
	    model.addAttribute("roomList", roomList);
	    return "room/roomList"; // /WEB-INF/jsp/room/roomList.jsp
	}
	
	// 회의실 예약
	@RequestMapping("/room/roomReserve.do")
	public String roomReserve(@RequestParam("roomId") Long roomId, ModelMap model) {
	    System.out.println("roomReserve called with roomId = " + roomId);

	    EgovMeetingRoomVO room = egovRoomService.findById(roomId);
	    if (room == null) {
	        System.out.println("❌ 회의실 아이디 = " + roomId);
	        return "redirect:/room/roomList.do";
	    }

	    
	    model.addAttribute("room", room);
	    System.out.println("✅ Returning to: room/reservationRoom");
	    return "room/reservationRoom";
	}
	
	// 회의실 예약 진행 
	@RequestMapping(value = "/room/submitReservation.do", method = RequestMethod.POST)
	public String submitReservation(EgovRoomReservationVO reservationVO, HttpServletRequest request, ModelMap model) {
	    System.out.println("예약 요청 도착: " + reservationVO);

	    // 로그인 사용자 정보 설정
	    LoginVO loginVO = (LoginVO) request.getSession().getAttribute("LoginVO");
	    reservationVO.setUserId(loginVO.getId()); // 또는 loginVO.getMberId()
	    reservationVO.setStatus("APPLIED"); // 상태값 기본 (APPLIED)
	    
	    try {
            egovRoomService.insertReservation(reservationVO);
            System.out.println("✅ 예약 저장 성공: 시작=" + reservationVO.getStartTime() + ", 종료=" + reservationVO.getEndTime());
        } catch (Exception e) {
            System.out.println("예약 저장 중 오류 발생");
            e.printStackTrace();
            model.addAttribute("message", "예약 중 오류가 발생했습니다.");
            return "room/reservationRoom";
        }
	    return "redirect:/room/roomList.do"; // 예약 후 목록으로 리다이렉트
	}

	
	// 예약현황 달력 
	@ResponseBody
	@RequestMapping(value = "/room/calendarEvents", method = RequestMethod.GET)
	public List<Map<String, Object>> getCalendarEvents(@RequestParam("roomId") Long roomId) throws Exception {
	    List<EgovRoomReservationVO> reservations = egovRoomService.getReservationsByRoomId(roomId);

	    List<Map<String, Object>> events = new ArrayList<>();
	    for (EgovRoomReservationVO vo : reservations) {
	        Map<String, Object> event = new HashMap<>();
	        event.put("id", vo.getResvId());
	        event.put("title", vo.getPurpose());
	        event.put("start", vo.getStartTime()); // ISO 8601 포맷 자동 처리됨
	        event.put("end", vo.getEndTime());
	        event.put("status", vo.getStatus());
	        events.add(event);
	    }

	    return events;
	}
	
	
	
	// 내 예약 
	@RequestMapping("/room/myReservations.do")
	public String myReservations(HttpServletRequest request, ModelMap model) {
		LoginVO loginVO = (LoginVO) request.getSession().getAttribute("LoginVO");
	    String userId = loginVO.getId();

	    List<EgovRoomReservationVO> myReservations = egovRoomService.selectReservationsByUser(userId);
	    model.addAttribute("myReservations", myReservations);
	    
		return "room/myReservations";
	}
	
	
	// 예약 취소 
	@RequestMapping(value = "/room/cancelReservation.do", method = RequestMethod.POST)
	public String cancelReservation(@RequestParam("resvId") int resvId) {
	    egovRoomService.cancelReservation(resvId);
	    return "redirect:/room/myReservations.do"; // 취소 후 다시 내 예약 목록으로 이동
	}
	
	// 회의실 관리자 
	@RequestMapping(value = "/room/adminRoomManage.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String adminRoomManage(ModelMap model) {
	    List<EgovRoomReservationVO> reservationList = egovRoomService.selectAllReservations();
	    model.addAttribute("reservationList", reservationList);
	    return "room/adminRoomManage"; // /WEB-INF/jsp/room/adminRoomManage.jsp
	}
	
	// 관리자 - 예약 승인 / 반려
	@RequestMapping(value = "/room/updateReservationStatus.do", method = RequestMethod.POST)
	public String updateReservationStatus(@RequestParam("resvId") int resvId,
            @RequestParam("status") String status,
            HttpServletRequest request) {
		
		egovRoomService.updateReservationStatus(resvId, status);
		return "redirect:/room/adminRoomManage.do";
	}
	
	// 회의실 생성관리 목록
	@RequestMapping(value = "/room/adminRoomCreate.do")
	public String adminRoomCreate(Model model) throws Exception {
		List<EgovMeetingRoomVO> roomList = egovRoomService.selectAdminRoomList(); // 전체 회의실 조회
		model.addAttribute("roomList", roomList);
		return "room/adminRoomCreate"; // JSP 경로
	}
	
	// 회의실 등록폼
	@RequestMapping(value = "/room/adminRoomCreateForm.do")
	public String adminRoomCreateForm() {
		return "room/adminRoomCreateForm";
	}
	
	// 회의실 등록
	@RequestMapping(value = "/room/insertRoom.do", method = RequestMethod.POST)
	public String insertRoom(@ModelAttribute EgovMeetingRoomVO roomVO) throws Exception {
		roomVO.setDelYn("N"); // 기본값
		if (roomVO.getUseYn() == null) {
	        roomVO.setUseYn("Y"); // 기본값으로 사용 설정
	    }
		egovRoomService.insertRoom(roomVO);
		return "redirect:/room/adminRoomCreate.do"; // 등록 후 목록으로 이동
	}
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
	    // HTML datetime-local 형식 대응 ("T" 포함)
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
	    dateFormat.setLenient(false);
	    binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}
	
	
}

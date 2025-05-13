package egovframework.let.room.web;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
	    // HTML datetime-local 형식 대응 ("T" 포함)
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
	    dateFormat.setLenient(false);
	    binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}
}

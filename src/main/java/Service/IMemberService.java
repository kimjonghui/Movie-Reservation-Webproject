package Service;

import DTO.MemberDTO;

public interface IMemberService {

	// 로그인 로직
	MemberDTO login(String email, String password);

	// 회원가입 로직
	void registerMember(MemberDTO member);

	// 회원정보 수정 로직
	void updateMemberInfo(MemberDTO member);

	// 회원탈퇴 로직
	boolean deleteMember(String id, String password);

	// ID 중복 확인 로직
	boolean isIdDuplicate(String id);

	// Email 중복 확인 로직
	boolean isEmailDuplicate(String email);

	// 이메일로 ID를 찾는 메소드
	String findIdByEmail(String email);

	// id로 현재 비밀번호를 불러오는 메서드
	String getNowPasswordById(String id);

	// 비밀번호 변경 메서드
	void changePassword(String id, String newPassword);

	// id 값으로 email, phoneNumber 변경하는 메소드
	boolean updateEmailAndPhoneNumber(String id, String email, String phoneNumber);
}

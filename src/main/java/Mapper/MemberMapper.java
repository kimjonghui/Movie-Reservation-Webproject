package Mapper;

import DTO.MemberDTO;
import org.apache.ibatis.annotations.*;

@Mapper
public interface MemberMapper {
	// 로그인시 필요한 메서드
	@Select("SELECT * FROM members WHERE id = #{id} and password = #{password}")
	@Results(id = "memberMapper", value = { @Result(property = "Id", column = "id", id = true),
			@Result(property = "Password", column = "password"),
			@Result(property = "PhoneNumber", column = "phonenumber"), @Result(property = "Email", column = "email") })
	MemberDTO findByEmailAndPassword(@Param("id") String id, @Param("password") String password);

	// 회원가입시 필요한 메서드
	@Insert("INSERT INTO members(id, password, phonenumber, email) VALUES(#{id}, #{password}, #{phoneNumber}, #{email})")
	int insert(MemberDTO member);

	// 회원정보 수정시 필요한 메서드
	@Update("UPDATE members SET password = #{password}, phonenumber = #{phoneNumber}, email = #{email} WHERE id = #{id}")
	int update(MemberDTO member);

	// 회원탈퇴시 필요한 메서드
	@Delete("DELETE FROM members WHERE id = #{id} and password = #{password}")
	int delete(@Param("id") String id, @Param("password") String password);

	// 중복 ID 확인을 위한 메서드
	@Select("SELECT COUNT(*) FROM members WHERE id = #{id}")
	int countById(@Param("id") String id);

	// 중복 이메일 확인을 위한 메서드
	@Select("SELECT COUNT(*) FROM members WHERE email = #{email}")
	int countByEmail(@Param("email") String email);

	// 이메일로 ID를 찾는 메서드
	@Select("SELECT id FROM members WHERE email = #{email}")
	String findIdByEmail(@Param("email") String email);

	// id로 password를 불러오는 메서드
	@Select("SELECT PASSWORD FROM members WHERE id = #{id}")
	String CallPassword(@Param("id") String id);

	// 변경한 password로 변경하는 메서드
	@Update("UPDATE members SET password = #{newPassword} WHERE id = #{id}")
	int updatePassword(@Param("id") String id, @Param("newPassword") String newPassword);

	// 회원의 ID를 기준으로 이메일과 전화번호를 업데이트하는 메소드
	@Update("UPDATE members SET email = #{email}, phonenumber = #{phoneNumber} WHERE id = #{id}")
	int updateEmailAndPhoneNumber(@Param("id") String id, @Param("email") String email,
			@Param("phoneNumber") String phoneNumber);
}

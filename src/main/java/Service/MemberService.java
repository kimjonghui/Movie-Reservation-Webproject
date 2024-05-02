package Service;

import org.apache.ibatis.session.SqlSession;

import DTO.MemberDTO;
import Mapper.MemberMapper;
import dbutil.SqlSessionInit;

public class MemberService implements IMemberService {

	@Override
	public MemberDTO login(String id, String password) {
		try (SqlSession session = SqlSessionInit.getSqlSession()) {
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			MemberDTO member = mapper.findByEmailAndPassword(id, password);
			System.out.println(member);
			return member;
		}
	}

	@Override
	public void registerMember(MemberDTO member) {
		try (SqlSession session = SqlSessionInit.getSqlSession()) {
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			int result = mapper.insert(member);
			if (result > 0) {
				session.commit();
			} else {
				session.rollback();
			}
		}
	}

	@Override
	public void updateMemberInfo(MemberDTO member) {
		try (SqlSession session = SqlSessionInit.getSqlSession()) {
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			int result = mapper.update(member);
			if (result > 0) {
				session.commit();
			} else {
				session.rollback();
			}
		}
	}

	@Override
	public boolean deleteMember(String id, String password) {
		try (SqlSession session = SqlSessionInit.getSqlSession()) {
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			int result = mapper.delete(id, password);
			if (result > 0) {
				session.commit();
				return true;
			} else {
				session.rollback();
				return false;
			}
		}
	}

	@Override
	public boolean isIdDuplicate(String id) {
		try (SqlSession session = SqlSessionInit.getSqlSession()) {
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			int result = mapper.countById(id);
			if (result > 0) {
				// 1 이상이면 중복된 아이디가 존재하므로 해당 ID는 사용이 불가능하다.
				return false;
			} else {
				// 0 이면 중복된 아이디가 존재하지 않으므로 해당 ID는 사용이 가능하다.
				return true;
			}
		}
	}

	@Override
	public boolean isEmailDuplicate(String email) {
		try (SqlSession session = SqlSessionInit.getSqlSession()) {
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			int result = mapper.countByEmail(email);
			if (result > 0) {
				// 1 이상이면 중복된 아이디가 존재하므로 해당 Email는 사용이 불가능하다.
				return false;
			} else {
				// 0 이면 중복된 아이디가 존재하지 않으므로 해당 Email는 사용이 가능하다.
				return true;
			}
		}
	}

	@Override
	public String findIdByEmail(String email) {
		try (SqlSession session = SqlSessionInit.getSqlSession()) {
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			String id = mapper.findIdByEmail(email);
			return id;
		}
	}

	@Override
	public String getNowPasswordById(String id) {
		try (SqlSession session = SqlSessionInit.getSqlSession()) {
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			String password = mapper.CallPassword(id);
			return password;
		}
	}

	@Override
	public void changePassword(String id, String newPassword) {
		try (SqlSession session = SqlSessionInit.getSqlSession()) {
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			int changePassword = mapper.updatePassword(id, newPassword);
			if (changePassword == 1) {
				session.commit(); // 성공시 커밋으로 변경
				System.out.println("DB 비밀번호 변경 완료");
			} else {
				session.rollback(); // 실패시 롤백으로 변경 하지 않음.
				System.out.println("DB 비밀번호 변경 실패");
			}
		}
	}

	@Override
	public boolean updateEmailAndPhoneNumber(String id, String email, String phoneNumber) {
		try (SqlSession session = SqlSessionInit.getSqlSession()) {
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			int result = mapper.updateEmailAndPhoneNumber(id, email, phoneNumber);
			if (result > 0) {
				session.commit();
				return true;
			}else {
				session.rollback();
				return false;
			}
		}
	}
}

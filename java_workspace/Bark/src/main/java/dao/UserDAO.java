package dao;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import dto.UserDTO;
import utils.JDBConnect;

public class UserDAO extends JDBConnect{
	
	public UserDAO(ServletContext application) {
		super(application);
	}
	
	public int login(String id, String pwd) {
		String sql = "SELECT pwd FROM user WHERE id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString("pwd").equals(pwd)) {
					// 로그인 정보가 일치함
					return 1;
				}
				else {
					// 로그인 정보가 일치하지 않음
					return 0;
				}
			}
			// 로그인 정보가 존재하지 않음
			return -1;
		}catch (Exception e) {
			System.out.println("로그인 에러: " + e.getMessage());
			// 데이터베이스 오류
			
		}
		// 데이터베이스 오류
		return -2;
	}
	
	public UserDTO getUser(String id) {
		String sql = "SELECT * FROM user WHERE id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			rs.next();
			UserDTO newUser = new UserDTO();
			newUser.setId(id);
			newUser.setPwd(rs.getString("pwd"));
			newUser.setName(rs.getString("name"));
			newUser.setPhone(rs.getString("phone"));
			newUser.setEmail(rs.getString("email"));
			newUser.setAddr(rs.getString("addr"));
			newUser.setAddrDetail(rs.getString("addrDetail"));
			newUser.setPostcode(rs.getString("postcode"));
			newUser.setBank(rs.getString("bank"));
			newUser.setBankAcc(rs.getString("bankAcc"));
			newUser.setRegDate(rs.getDate("regDate"));
			newUser.setType(rs.getInt("type"));
			return newUser;
			
		}catch (Exception e) {
			System.out.println("유저 정보 회수 에러: " + e.getMessage());
		}
		return null;
	}
	
	public int join(UserDTO user) {
		int result = 0;
		String sql = "INSERT INTO user(id, pwd, name, phone, email, addr, addrDetail, postcode, bank, bankAcc, type)"
						+ "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getId());
			pstmt.setString(2, user.getPwd());
			pstmt.setString(3, user.getName());
			pstmt.setString(4, user.getPhone());
			pstmt.setString(5, user.getEmail());
			pstmt.setString(6, user.getAddr());
			pstmt.setString(7, user.getAddrDetail());
			pstmt.setString(8, user.getPostcode());
			pstmt.setString(9, user.getBank());
			pstmt.setString(10, user.getBankAcc());
			pstmt.setInt(11, user.getType());
			result = pstmt.executeUpdate();
			return result;
		}catch (Exception e) {
			System.out.println("회원가입 에러: " + e.getMessage());
			// 데이터베이스 오류
			
		}
		// 데이터베이스 오류
		return -1;
	}
	public List<UserDTO> getList(){
		List<UserDTO> uList = new ArrayList<>();
		String sql = "SELECT * FROM user";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				UserDTO user = new UserDTO();
				user.setId(rs.getString("id"));
				user.setPwd(rs.getString("pwd"));
				user.setName(rs.getString("name"));
				user.setPhone(rs.getString("phone"));
				user.setEmail(rs.getString("email"));
				user.setAddr(rs.getString("addr"));
				user.setAddrDetail(rs.getString("addrDetail"));
				user.setPostcode(rs.getString("postcode"));
				user.setBank(rs.getString("bank"));
				user.setBankAcc(rs.getString("bankAcc"));
				user.setRegDate(rs.getDate("regDate"));
				user.setType(rs.getInt("type"));
				uList.add(user);
			}
			return uList;
		}catch (Exception e) {
			System.out.println("getList: " + e.getMessage());
			return uList;
		}
	}
	
	public List<UserDTO> getAdminList(){
		List<UserDTO> uList = new ArrayList<>();
		String sql = "SELECT * FROM user WHERE type=3";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				UserDTO user = new UserDTO();
				user.setId(rs.getString("id"));
				user.setPwd(rs.getString("pwd"));
				user.setName(rs.getString("name"));
				user.setPhone(rs.getString("phone"));
				user.setEmail(rs.getString("email"));
				user.setAddr(rs.getString("addr"));
				user.setAddrDetail(rs.getString("addrDetail"));
				user.setPostcode(rs.getString("postcode"));
				user.setBank(rs.getString("bank"));
				user.setBankAcc(rs.getString("bankAcc"));
				user.setRegDate(rs.getDate("regDate"));
				user.setType(rs.getInt("type"));
				uList.add(user);
			}
			return uList;
		}catch (Exception e) {
			System.out.println("getList: " + e.getMessage());
			return uList;
		}
	}
	
}

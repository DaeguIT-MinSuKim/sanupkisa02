package sanupkisa02.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import sanupkisa02.ds.JdbcUtil;
import sanupkisa02.dto.Board;

public class BoardDao {
	private static final BoardDao instance = new BoardDao();
	
	private BoardDao() {
		// TODO Auto-generated constructor stub
	}

	public static BoardDao getInstance() {
		return instance;
	}

	public int total() {
		String sql = "select count(*) from BOARD_TBL";
		try (Connection con = JdbcUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery()) {
			if (rs.next()) {
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public List<Board> selectBoardByAll(){
		String sql = "select idx, writer, subject, content, regdate from board_tbl order by regdate desc";
		try (Connection con = JdbcUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery()) {
			if (rs.next()) {
				List<Board> list = new ArrayList<>();
				do {
					list.add(getBoard(rs));
				} while (rs.next());
				return list;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	private Board getBoard(ResultSet rs) throws SQLException {
		int idx = rs.getInt("idx");
		String writer = rs.getString("writer");
		String subject = rs.getString("subject");
		String content = rs.getString("content");
		Timestamp regDate = rs.getTimestamp("regDate");
		return new Board(idx, writer, subject, content, regDate);
	}
	
	public Board selectBoardByIdx(int idx){
		String sql = "select idx, writer, subject, content, regdate from board_tbl where idx = ?";
		try (Connection con = JdbcUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);){
				pstmt.setInt(1, idx);
			try(ResultSet rs = pstmt.executeQuery()){
				if (rs.next()) {
					return getBoard(rs);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public void insertBoard(Board board) {
		String sql = "insert into board_tbl values(board_tbl_seq.nextval, ?, ?, ?, sysdate)";
		try(Connection con = JdbcUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){
			pstmt.setString(1, board.getWriter());
			pstmt.setString(2, board.getSubject());
			pstmt.setString(3, board.getContent());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void deleteBoard(int idx) {
		String sql = "delete from BOARD_TBL where idx = ?";
		try(Connection con = JdbcUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void updateBoard(Board board) {
		String sql = "update board_tbl set writer=?, subject=?, content=? where idx=?";
		try(Connection con = JdbcUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){
			pstmt.setString(1, board.getWriter());
			pstmt.setString(2, board.getSubject());
			pstmt.setString(3, board.getContent());
			pstmt.setInt(4, board.getIdx());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}

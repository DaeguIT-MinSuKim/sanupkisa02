package sanupkisa02.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import sanupkisa02.ds.JdbcUtil;
import sanupkisa02.dto.Reply;

public class ReplyDao {
	private static final ReplyDao instance = new ReplyDao();
	
	private ReplyDao() {
		// TODO Auto-generated constructor stub
	}

	public static ReplyDao getInstance() {
		return instance;
	}
	public void insertReply(Reply reply) {
		String sql = "insert into comment_tbl values(comment_tbl_seq.nextval, ?, ?, ?, sysdate)";
		try(Connection con = JdbcUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){
			pstmt.setInt(1, reply.getbIdx());
			pstmt.setString(2, reply.getWriter());
			pstmt.setString(3, reply.getContent());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	public void deleteReply(int idx) {
		String sql = "DELETE FROM COMMENT_TBL where idx = ?";
		try(Connection con = JdbcUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public List<Reply> selectReplyByIdx(int idx){
		String sql = "select idx, bidx, writer, content, regdate from COMMENT_TBL where bidx = ?";
		try(Connection con = JdbcUtil.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){
			pstmt.setInt(1, idx);
			try(ResultSet rs = pstmt.executeQuery()){
				if (rs.next()) {
					List<Reply> list = new ArrayList<>();
					do {
						list.add(getReply(rs));
					}while(rs.next());
					return list;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	private Reply getReply(ResultSet rs) throws SQLException {
		int idx = rs.getInt("idx");
		int bIdx = rs.getInt("bIdx");
		String writer = rs.getString("writer");
		String content = rs.getString("content");
		Timestamp regDate = rs.getTimestamp("regDate");
		return new Reply(idx, bIdx, writer, content, regDate);
	}
}

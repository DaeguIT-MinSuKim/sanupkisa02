package sanupkisa02.dto;

import java.sql.Timestamp;

public class Board {
	private int idx;
	private String writer;
	private String subject;
	private String content;
	private Timestamp regDate;

	public Board() {
		// TODO Auto-generated constructor stub
	}

	public Board(String writer, String subject, String content) {
		this.writer = writer;
		this.subject = subject;
		this.content = content;
	}

	public Board(int idx, String writer, String subject, String content) {
		this.idx = idx;
		this.writer = writer;
		this.subject = subject;
		this.content = content;
	}

	public Board(int idx, String writer, String subject, String content, Timestamp regDate) {
		this.idx = idx;
		this.writer = writer;
		this.subject = subject;
		this.content = content;
		this.regDate = regDate;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getRegDate() {
		return regDate;
	}

	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return String.format("Board [idx=%s, writer=%s, subject=%s, content=%s, regDate=%s]", idx, writer, subject,
				content, regDate);
	}

}

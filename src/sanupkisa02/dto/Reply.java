package sanupkisa02.dto;

import java.sql.Timestamp;

public class Reply {
	private int idx;
	private int bIdx;
	private String writer;
	private String content;
	private Timestamp regDate;

	public Reply() {
		// TODO Auto-generated constructor stub
	}

	public Reply(int bIdx, String writer, String content) {
		this.bIdx = bIdx;
		this.writer = writer;
		this.content = content;
	}

	public Reply(int idx, int bIdx, String writer, String content, Timestamp regDate) {
		this.idx = idx;
		this.bIdx = bIdx;
		this.writer = writer;
		this.content = content;
		this.regDate = regDate;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getbIdx() {
		return bIdx;
	}

	public void setbIdx(int bIdx) {
		this.bIdx = bIdx;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
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
		return String.format("Reply [idx=%s, bIdx=%s, writer=%s, content=%s, regDate=%s]", idx, bIdx, writer, content,
				regDate);
	}

}

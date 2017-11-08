package kr.gudi.util;

public class BoardFile {
	private int seq;
	private int boardcontent_seq;
	private String orgfilename;
	private String filename;
	private String shortname;
	private String type;
	private String path;
	private String size;
	private String ip;
	private String regname;
	private String regdate;
	private String del_YN;
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public int getBoardcontent_seq() {
		return boardcontent_seq;
	}
	public void setBoardcontent_seq(int boardcontent_seq) {
		this.boardcontent_seq = boardcontent_seq;
	}
	public String getOrgfilename() {
		return orgfilename;
	}
	public void setOrgfilename(String orgfilename) {
		this.orgfilename = orgfilename;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getShortname() {
		return shortname;
	}
	public void setShortname(String shortname) {
		this.shortname = shortname;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getRegname() {
		return regname;
	}
	public void setRegname(String regname) {
		this.regname = regname;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getDel_YN() {
		return del_YN;
	}
	public void setDel_YN(String del_YN) {
		this.del_YN = del_YN;
	}
	@Override
	public String toString() {
		return "BoardFile [seq=" + seq + ", boardcontent_seq=" + boardcontent_seq + ", orgfilename=" + orgfilename
				+ ", filename=" + filename + ", shortname=" + shortname + ", type=" + type + ", path=" + path
				+ ", size=" + size + ", ip=" + ip + ", regname=" + regname + ", regdate=" + regdate + ", del_YN="
				+ del_YN + "]";
	}
	
	
}

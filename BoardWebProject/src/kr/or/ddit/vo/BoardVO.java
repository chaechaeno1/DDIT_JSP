package kr.or.ddit.vo;

import java.sql.Date;

public class BoardVO {
	/*
	CREATE TABLE BOARD(	
		"BO_NO" NUMBER(8,0) NOT NULL ENABLE, 
		"BO_TITLE" VARCHAR2(150 BYTE) NOT NULL ENABLE, 
		"BO_CONTENT" VARCHAR2(4000 BYTE), 
		"BO_WRITER" VARCHAR2(150 BYTE) NOT NULL ENABLE, 
		"BO_DATE" DATE NOT NULL ENABLE, 
		"BO_HIT" NUMBER(8,0) NOT NULL ENABLE, 
		 CONSTRAINT "PK_BOARD" PRIMARY KEY ("BO_NO")
	*/
	
	private int bo_no; //글번호
	private String bo_title; //글제목
	private String bo_content; //글내용
	private String bo_writer; //작성자
	private Date bo_date; //작성일
	private int bo_hit; //조회수

	
	
	//shift + alt + s
	
	//기본 생성자
	public BoardVO() {
		super();
	}

	
	//매개변수 생성자
	public BoardVO(int bo_no, String bo_title, String bo_content, String bo_writer, Date bo_date, int bo_hit) {
		super();
		this.bo_no = bo_no;
		this.bo_title = bo_title;
		this.bo_content = bo_content;
		this.bo_writer = bo_writer;
		this.bo_date = bo_date;
		this.bo_hit = bo_hit;
	}


	//게터세터
	public int getBo_no() {
		return bo_no;
	}


	public void setBo_no(int bo_no) {
		this.bo_no = bo_no;
	}


	public String getBo_title() {
		return bo_title;
	}


	public void setBo_title(String bo_title) {
		this.bo_title = bo_title;
	}


	public String getBo_content() {
		return bo_content;
	}


	public void setBo_content(String bo_content) {
		this.bo_content = bo_content;
	}


	public String getBo_writer() {
		return bo_writer;
	}


	public void setBo_writer(String bo_writer) {
		this.bo_writer = bo_writer;
	}


	public Date getBo_date() {
		return bo_date;
	}


	public void setBo_date(Date bo_date) {
		this.bo_date = bo_date;
	}


	public int getBo_hit() {
		return bo_hit;
	}


	public void setBo_hit(int bo_hit) {
		this.bo_hit = bo_hit;
	}


	@Override
	public String toString() {
		return "BoardVO [bo_no=" + bo_no + ", bo_title=" + bo_title + ", bo_content=" + bo_content + ", bo_writer="
				+ bo_writer + ", bo_date=" + bo_date + ", bo_hit=" + bo_hit + "]";
	}
	
	
	
	
	
	
	
	

}

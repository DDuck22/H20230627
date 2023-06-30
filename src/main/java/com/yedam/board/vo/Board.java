package com.yedam.board.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Board {
	private long brdNo;
	private String brdTitle;
	private String brdWriter;
	private String userName;
	private String brdContent;
	private Date createDate;
	private int clickCnt;
}

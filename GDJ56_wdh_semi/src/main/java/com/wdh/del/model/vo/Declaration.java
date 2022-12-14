package com.wdh.del.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Declaration {
	private int dclNo;
	private String dclTitle;
	private String dclContent;
	private Date dclDate;
	private String dclHeadTitle;
	private char dclResult;
	private int memberNo;
	private String filePath;
//	private String dclOriginalFileName;
//	private String dclRenameFileName;
	
}
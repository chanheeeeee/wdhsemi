package com.wdh.board.service;

import static com.wdh.common.JDBCTemplate.close;
import static com.wdh.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.wdh.board.dao.BoardDao2;
import com.wdh.board.vo.Board;
import com.wdh.board.vo.BoardComment;
import com.wdh.board.vo.ReviewBoard;

public class BoardService2 {
	
private BoardDao2 dao = new BoardDao2();
	
	public List<Board> selectBoardList(int cPage, int numPerpage){
		Connection conn = getConnection();
		List<Board> result = dao.selectBoardList(conn, cPage, numPerpage); //numPerpage
		close(conn);
		return result;
	}
	
	public int selectBoardCount() {
		Connection conn = getConnection();
		int result = dao.selectBoardCount(conn);
		close(conn);
		return result;
	}
	
	public Board selectBoard(int boardNo) {
		Connection conn = getConnection();
		Board result = dao.selectBoard(conn, boardNo);
		close(conn);
		return result;
	}
	
	public List<BoardComment> selectBoardComment(int boardNo) {
		Connection conn = getConnection();
		List<BoardComment> result = dao.selectBoardComment(conn, boardNo);
		close(conn);
		return result;
	}
	
	public List<ReviewBoard> selectReviewBoard(int boardNo) {
		Connection conn = getConnection();
		List<ReviewBoard> result = dao.selectReviewBoard(conn, boardNo);
		close(conn);
		return result;
	}

}

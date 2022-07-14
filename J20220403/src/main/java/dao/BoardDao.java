package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDao {
	private static BoardDao instance; 
	private BoardDao() {  } 
	public static BoardDao getInstance() {
		if (instance ==null ) {
			instance = new BoardDao();
		}
		return instance;
	} 
	private Connection getConnection() {
		 Connection conn=null;
		try {
			Context	ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn=ds.getConnection();
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return conn;
	}
	//게시판개수
public int getTotalCnt(int tchno) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt	= null;
		ResultSet rs 	= null;
		int tot 		= 0;
		String sql 		= "select count(*) from board where re_level = 0 and tchno=?";
		System.out.println("BoardDao getTotalCnt sql=>"+sql); //sql 확인
	try {
			conn = getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, tchno);
			rs = pstmt.executeQuery();
			
			if(rs.next()) tot=rs.getInt(1);
			System.out.println("BoardDao getTotalCnt tot=>"+tot); // db에서 받아왔을 때 숫자 

			
		} catch(Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if(rs !=null ) 		rs.close();
			if(pstmt !=null ) 	pstmt.close();
			if(conn !=null ) 	conn.close();
		}
     	System.out.println("BoardDao getTotalCnt return Before  tot=>"+tot); // 데이너 넘어가기 전에 숫자
     	
     	
		return tot;
	}
	//선생님 게시판 목록 
public List<Board> tchBoardList (int tchno, int startRow, int endRow) throws SQLException{
		List<Board> list = new ArrayList<Board>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql ="select * from(select rownum rn, a.*"
				   +"from (select b.*, t.name from board b, teacher t where b.re_level = 0 and  b.tchno=? and t.tchno=b.tchno order by ref desc) a)"
				   +"where rn between ? and ?";
	try {
		conn=getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, tchno);
		pstmt.setInt(2, startRow);
		pstmt.setInt(3, endRow);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			Board board=new Board();
			board.setBoardno(rs.getInt("boardno"));
			board.setSubject(rs.getString("subject"));
			board.setWrite_date(rs.getDate("write_date"));
			board.setReadcount(rs.getInt("readcount"));
			board.setRe_step(rs.getInt("re_step"));
			board.setName(rs.getString("name")); //선생님이름 
			list.add(board);
		}
	} catch (Exception e){
		System.out.println(e.getMessage());
	} finally {
		if(rs!=null) rs.close();
		if(pstmt!=null) pstmt.close();
		if(conn!=null) conn.close();
	}
		return list;
	
	}
	//상세보기
	public Board select(int boardno) throws SQLException {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select b.*, t.name from board b, teacher t where b.tchno=t.tchno and boardno="+boardno;
		Board board = new Board();
		
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				board.setBoardno(rs.getInt("boardno"));
				board.setTchno(rs.getInt("tchno"));
				board.setStudno(rs.getInt("studno")); 		
				board.setSubject(rs.getString("subject"));
				board.setContent(rs.getString("content"));
				board.setReadcount(rs.getInt("readcount"));
				board.setWrite_date(rs.getDate("write_date"));
				board.setRef(rs.getInt("ref"));
				board.setRe_step(rs.getInt("re_step"));
				board.setRe_level(rs.getInt("re_level"));
				board.setName(rs.getString("name"));
			}
			
		} catch (Exception e) {
			System.out.print(e.getMessage());
		} finally {
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(conn != null) conn.close();
			
		}
		return board;
		
	} //end of board
	
	
	//조회수
	public void readCount(int boardno) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			String sql = "update board set readcount=readcount+1 where boardno=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardno);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
		if(conn != null) conn.close();
		if(pstmt != null) pstmt.close();
		}
	}
	//게시글등록하기
	public int insert(Board board) throws SQLException {
		int boardno = board.getBoardno();
		System.out.println("*boardno->"+boardno); 
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		String sql = "select max(boardno) from board"; //보드넘버 가져와~										
		String sql1 = "insert into board values(boardno_seq.nextval,?,null,?,?,sysdate,?,?,?,?)";
		try { 
			conn = getConnection();
			////보드 넘버가져와 
			pstmt = conn.prepareStatement(sql); //selet 
			rs=pstmt.executeQuery();
			rs.next();
			int number=rs.getInt(1)+1; //ref=boardno -> number
			rs.close();
			pstmt.close();
			if(boardno==0) board.setRef(number);//맨 첫글일 경우 혹은 신규글
				pstmt=conn.prepareStatement(sql1); //insert 
				System.out.println("pstmt->"+pstmt); 
				pstmt.setInt(1, board.getTchno());
				pstmt.setString(2, board.getContent());
				pstmt.setString(3, board.getSubject());
				pstmt.setInt(4, board.getReadcount());
				pstmt.setInt(5, board.getRef()); 
				pstmt.setInt(6, board.getRe_step());
				pstmt.setInt(7, board.getRe_level());
				result=pstmt.executeUpdate(); //result=0 이면 오류 
				System.out.println("result->"+result);
		}catch(Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if(pstmt != null) pstmt.close();
			if(rs!=null) rs.close();	
			if(conn != null) conn.close();
		} 
		
		return result;
	}
	
	//수정하기
	public int update(Board board) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update board set subject=?, content=? where boardno=?";
		int result = 0;
		
		try {
			 conn = getConnection();  
			 pstmt = conn.prepareStatement(sql);
			 pstmt.setString(1, board.getSubject());
			 pstmt.setString(2, board.getContent());
			 pstmt.setInt(3, board.getBoardno());
			 
			 result = pstmt.executeUpdate();
			
		} catch(Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (conn != null) conn.close();
			if (pstmt != null) pstmt.close();
		}
		return result;
	}
	public int delete(int boardno) throws SQLException {
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt=null;
		String sql = "delete from board where boardno=?";
		ResultSet rs = null;
		
		try {
			conn=getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, boardno);
			rs=pstmt.executeQuery();
		} catch (Exception e ) {
			System.out.println(e.getMessage());
		} finally {
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
		}
		return result;
	}
	
} //end of class (project)

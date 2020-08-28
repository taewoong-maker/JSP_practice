package net.guest.sql;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import net.tis.common.DB;

public class ReplySQL {
	
	int Rrn, Rnum, Rsabun ;
  String Rwriter, Rcontent ;
  int Rcnt ; //댓글갯수표시
  String msg;
  
  Connection CN ;
  Statement ST ;
  PreparedStatement PST;
  CallableStatement CST;
  ResultSet RS ;
  
  public ReplySQL() {
  	CN = DB.getConnection();
  }  
  
  public void dbReUpdate(ReplyDTO dto) {
		
  	Rnum = dto.getNum();
		Rsabun= dto.getSabun();
		Rwriter= dto.getWriter();
		Rcontent=dto.getContent();

		try{
			System.out.println("abcde");
			msg="update guestreply set writer=?, content=? "
					+"where num = " + Rnum;
			//PreparedStatement명령어로
			PST=CN.prepareStatement(msg);
			PST.setString(1, Rwriter);
			PST.setString(2, Rcontent);
			PST.executeUpdate();	
		}catch(Exception e){System.out.println(e);}		
  }  
  
  public void dbReInsert(ReplyDTO dto) { //함수의중복=OverLoading=오버로딩
 	 try {
// 		 System.out.println("testing...");
// 		 System.out.println(dto.getSabun());
// 		 System.out.println(dto.getName());
// 		 System.out.println(dto.getSabun());
 		 
  		msg="insert into guestreply values(guestreply_seq.nextval	,?,?,?)";
  		PST = CN.prepareStatement(msg);
  		PST.setString(1,  dto.getWriter());
  		PST.setString(2, dto.getContent());
  		PST.setInt(3, dto.getSabun());
  		PST.executeUpdate();
  		System.out.println("GuestSQL자바문서 dbInsert(dto)함수  저장성공\n");
  	 }catch(Exception ex) { System.out.println("저장에러:" + ex);}
  }//end--------------------------------------------------------------------
  
	
}

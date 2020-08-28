package net.guest.sql;

import java.sql.*;
import java.util.ArrayList;

import net.tis.common.DB;

public class GuestSQL {
	  Connection CN ;
	  Statement ST ;
	  PreparedStatement PST;
	  CallableStatement CST;
	  ResultSet RS ;
	 
	  int Gsabun,Gpay, Ghit ;
	  int GGtotal; //전체레코드갯수
	  int Gtotal ; //조회레코드갯수
	  int GStotal=0 ; //Gtotal대신 GStotal사용도 좋습니다조회갯수
	 
	  String Gname,Gtitle, Gemail ;
	 
	  String msg;
	  String submsg;
	  String Gdata;
	 
	  //댓글관련전역변수
	  int Rrn, Rnum, Rsabun ;
	  String Rwriter, Rcontent ;
	  int Rcnt ; //댓글갯수표시
	  
	  String skey , sval;
		String returnpage;
		public int start ;
    public int end;
  	ArrayList<GuestDTO> al=new ArrayList<GuestDTO>();
	 //////////////////////////////////////////////////////
   public GuestSQL() {
  	  CN = DB.getConnection();
   }//end--------------------------------------------------------------------
   
   public void dbDelete( String data ) {
     try {
    	 //guestDelete.jsp문서 
       msg="delete  from guest where sabun =  " + data ;
       ST=CN.createStatement();
       ST.executeUpdate(msg);
       System.out.println(data + " 데이터 삭제처리 성공했습니다");
  	 }catch(Exception ex) { System.out.println("에러:" + ex);} 
   }//end--------------------------------------------------------------------
   
   public void dbReDelete( String data ) {
     try {
    	 //guestDelete.jsp문서 
       msg="delete  from guestreply where num =  " + data ;
       ST=CN.createStatement();
       ST.executeUpdate(msg);
       System.out.println(data + " 데이터 삭제처리 성공했습니다");
  	 }catch(Exception ex) { System.out.println("에러:" + ex);} 
   }//end-
   
   public int gstotal(String a, String b) {
			GuestDTO dto = new GuestDTO();
			try {
				msg = "select count(*) cnt from guest where " + a + " like '%" + b + "%'";
				ST=CN.createStatement();
				RS=ST.executeQuery(msg);		
				RS.next();
				int cnt = RS.getInt("cnt");
				dto.setGtotal(cnt);
			} catch (Exception e) {
				System.out.println("gstotal메소드 " + e);		
				}
			return dto.getGtotal();
		}
    
   public void dbInsert(GuestDTO dto) { //함수의중복=OverLoading=오버로딩
  	 try {
   		msg="insert into guest values(?,?,?,sysdate,?,0,?)";
   		PST = CN.prepareStatement(msg);
   			PST.setInt(1,  dto.getSabun());
   			PST.setString(2, dto.getName());
   			PST.setString(3, dto.getTitle());
   			PST.setInt(4, dto.getPay());
   			PST.setString(5, dto.getEmail());
   		PST.executeUpdate(); //진짜저장
   		System.out.println("GuestSQL자바문서 dbInsert(dto)함수  저장성공\n");
   	 }catch(Exception ex) { System.out.println("저장에러:" + ex);}
   }//end--------------------------------------------------------------------
   
   public void dbInsert(int s,String n, String t, int p, String e) { //2020-07-31-금요일
  	 try {
  		msg="insert into guest values(?,?,?,sysdate,?,0,?)";
  		PST = CN.prepareStatement(msg);
  			PST.setInt(1,  s);
  			PST.setString(2, n);
  			PST.setString(3, t);
  			PST.setInt(4, p);
  			PST.setString(5, e);
  		PST.executeUpdate(); //진짜저장
  		System.out.println("GuestSQL자바문서 dbInsert함수(s,n,t,p,e)  저장성공\n");
  	 }catch(Exception ex) { System.out.println("저장에러:" + ex);}
   }//end--------------------------------------------------------------------
   
   
   public ArrayList<GuestDTO> dbSelect(GuestDTO dto, int start, int end, String squery) {

			try {				
				String a = "select * from ( ";
				String b = " select rownum rn, g.*, (select count(*) from guestreply r where r.sabun=g.sabun)as rcnt from guest g "+squery;
				String c = " ) where rn between " + start + " and "+end;
				
				msg = a+b+c;
				ST=CN.createStatement();
				RS=ST.executeQuery(msg);
				
				while(RS.next()) {
					GuestDTO dt = new GuestDTO();
					dt.setRn(RS.getInt("rn"));
					dt.setSabun(RS.getInt("sabun"));
					dt.setName(RS.getString("name"));
					dt.setTitle(RS.getString("title"));
					dt.setPay(RS.getInt("pay"));
					dt.setEmail(RS.getString("email"));
					dt.setHit(RS.getInt("hit"));
					dt.setRcnt(RS.getInt("rcnt"));
					al.add(dt);
				}				
			}catch (Exception e) {	System.out.println("dbSelect메소드"+e);	}
			return al;
		}
 	
   public ArrayList<GuestDTO>  dbReSelect(String sabun) {
 		
 		 String a=" select rownum rn,  r.num, r.writer, r.content , g.sabun from guest g " ; 
 		 String b=" inner join guestreply r " ;
 		 String c=" on g.sabun = r.sabun  " ; 
 		 String d=" and  r.sabun =  " + sabun ;
 		 
// 		 StringBuffer sb = new StringBuffer();
// 		 sb.append(" select rownum rn,  r.num, r.writer, r.content , g.sabun from guest g " );
// 		 sb.append(" inner join guestreply r ");
// 		 sb.append(" on g.sabun = r.sabun  ");
// 		 sb.append(" and  r.sabun =  " + sabun);
// 		 ST=CN.createStatement();
//		 RS=ST.executeQuery(sb.toString());
 		 
 		 msg = a+b+c+d;
 		 try {
 			 ST=CN.createStatement();
					RS=ST.executeQuery(msg);
 				while(RS.next()) {
 					GuestDTO dt = new GuestDTO();
 					dt.setRn(RS.getInt("rn"));
 					dt.setNum(RS.getInt("num"));
 					dt.setWriter(RS.getString("writer"));
 					dt.setContent(RS.getString("content"));
 					dt.setSabun(RS.getInt("sabun"));
 					al.add(dt);
 				}
 		 }catch (Exception e) {
				// TODO: handle exception
			}
 		 return al;
 }
   
 	//////////////////////////////////////////////////////////////////////////
  public int dbGtotal() {
 	 try {
 		 msg="select count(*) as cnt from guest ";
 		 ST = CN.createStatement();
 		 RS = ST.executeQuery(msg);
 		 if(RS.next()==true) { Gtotal= RS.getInt("cnt"); }
 		 System.out.println("총갯수=" + Gtotal);
 	 }catch(Exception ex) { System.out.println("에러:" + ex);}
 	 return Gtotal;
  }//end--------------------------------------------------------------------
  
  public int dbGtotal(String skey, String sval) {
  	 try {
  		 msg="select count(*) as cnt from guest where "+skey+" like '%"+sval+"%'";
  		 ST = CN.createStatement();
  		 RS = ST.executeQuery(msg);
  		 if(RS.next()==true) { Gtotal= RS.getInt("cnt"); }
  		 System.out.println("총갯수=" + Gtotal);
  	 }catch(Exception ex) { System.out.println("에러:" + ex);}
  	 return Gtotal;
   }//end--------------------------------------------------------------------
  
  public GuestDTO dbDetail(String a) {
  	GuestDTO dt = new GuestDTO();
		try {
			msg="select * from guest where sabun = " + a;
			ST=CN.createStatement();
			RS=ST.executeQuery(msg);			
			while(RS.next()) {				
				dt.setSabun(RS.getInt("sabun"));
				dt.setName(RS.getString("name"));
				dt.setTitle(RS.getString("title"));
				dt.setPay(RS.getInt("pay"));
				dt.setEmail(RS.getString("email"));
				dt.setHit(RS.getInt("hit"));				
			}			
		}catch (Exception e) {	System.out.println("dbDetail 메소드 "+e);	}
		return dt;
	}
  
  public int dbHit(String a) {
  	msg = "select hit from guest where sabun = " + a;
  	try {
  		ST=CN.createStatement();
  		RS=ST.executeQuery(msg);	
  		while(RS.next()) {
  			Ghit = RS.getInt("hit");
  		}
  	}catch (Exception e) {	System.out.println(e);	}  	
  	return Ghit;
  }
  
  public void dbHitUpdate(String a, int b) {
  	try {
  		msg="update guest set hit=? where sabun = ?";
  		PST = CN.prepareStatement(msg);
  			PST.setInt(1,  b);
  			PST.setString(2, a);
  		PST.executeUpdate(); //진짜저장
  		System.out.println("dbHitInsert 메소드 update성공");
  	 }catch(Exception ex) { System.out.println("dbHitInsert 메소드 저장에러:" + ex);}
  }
  
  public void dbUpdate(GuestDTO dto) {
			
			Gsabun= dto.getSabun();
			Gname=dto.getName();	
			Gtitle=dto.getTitle();
			Gpay=  dto.getPay();
			Gemail=dto.getEmail();				
			try{
				msg="update guest set name=?, title=?, pay=?, email=?"
						+"where sabun = " + Gsabun;
									
				//PreparedStatement명령어로
				PST=CN.prepareStatement(msg);
				PST.setString(1, Gname);
				PST.setString(2, Gtitle);
				PST.setInt(3, Gpay);
				PST.setString(4, Gemail);
				PST.executeUpdate();	
			}catch(Exception e){System.out.println(e);}		
  }
        
}//GuestSQL class END


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ include file="ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[GuestList.jsp]</title>
<style>
	
</style>
<script type="text/javascript"></script>
</head>
<body>

	<%
		msg="select count(*) cnt from guest a";
		ST=CN.createStatement();
		RS=ST.executeQuery(msg);
		RS.next();
		Gtotal=RS.getInt("cnt");		
	%>
		<p>
			 전체 레코드 갯수 [<%=Gtotal%>]
	<%		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		Date dt = new Date();
		//제목옆에 1시간 전에 올라온 굴에 대해서 new 깃발이나 red 색 표시하고 싶어!!
		String pnum;		
		int pageNUM, pagecount;
		int start, end; //시작행, 끝행
		int startpage, endpage; //시작페이지, 끝페이지
		int tmp; // 임시계산식
		String sqry;
		String skey = "검색필드", sval="키워드";
		String returnpage = "아직은 몰라요";
		
		pnum = request.getParameter("pageNum"); //pnum 은 매개변수를 받아온 값이기 때문에 String
		if(pnum ==null || pnum==""){ pnum = "1"; }
		pageNUM = Integer.parseInt(pnum);// String 값을 int 값으로 변환
		//System.out.println("클릭한 페이지 = " + pageNUM);
		
		start = (pageNUM-1)*10+1;
		end = pageNUM*10;
		tmp=(pageNUM -1)%10; //tmp 임시공간. tmp가 13이면 결괏값 2
		startpage = pageNUM-tmp;
		endpage = pageNUM+9;
		
		//////////////////////////////////////
		String a = "select * from (";
		String b = "select rownum rn, g.* from guest g ";
		String c = ") where rn between " + start + " and " + end;
		//msg="select rownum rn, g.* from guest g";
		msg = a+b+c;
		RS=ST.executeQuery(msg);
	%>
	<div class=id>
		<table width=900 cellspacing="0">
			<tr bgcolor="yellow" >
				 <td>행번호</td>
				 <td>사번</td>
				 <td>이름</td>
				 <td>제목</td>
				 <td>이메일</td>
				 <td>날짜</td>
				 <td>조회수</td>
				 <td>삭제</td>
			</tr>
			<%
			while(RS.next()==true){
			%>
			<tr>
				 <td>				 
				 	 <%=RS.getInt("rn") %>
				 </td>
				 <td>					 
					 <%=RS.getInt("sabun") %>				
				 </td>
				 <td><%=RS.getString("name") %></td>
				 <td>
					 <a href="GuestDetail.jsp?idx=<%=RS.getInt("sabun")%>">
					 <%=RS.getString("title") %>
				 </a>
				 </td>
				 <td><%=RS.getString("email") %></td>
				 <td><%=RS.getDate("wdate") %></td>
				 <td><%=RS.getInt("hit") %></td>
				 <td><input type="button" value = "삭제"
				  onclick="location.href='GuestDetail.jsp?idx=<%=RS.getInt("sabun")%>'"></td>
			</tr>
			<%	}
			
			%>	
			<tr onmouseover="style.backgroundColor='lightgray'"
				onmouseout="style.backgroundColor='' ">	
				<td colspan="8" align="center">								
					<%
					for(int i=1; i<11 ; i++){
						out.println("<a href=GuestList.jsp?pageNum="+i+">["+i+"]</a>" );
						//pageNum : 전달자. 매개변수
						}
					%>
				</td>			
			</tr>		
		</table>
	</div>

	<br>
		<a href="GuestWrite.jsp"> [등록] </a>
		<a href="index.jsp"> [index] </a>
		<a href="login.jsp"> [login] </a>
		<a href="GuestList.jsp"> [전체출력] </a>
</body>
</html>
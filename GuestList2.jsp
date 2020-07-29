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
	/* a:hover {
	color:crimson;
} */
</style>
<script type="text/javascript"></script>
</head>
<body>
	<%
// 		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
// 		Date dt = new Date();
		//제목옆에 1시간 전에 올라온 굴에 대해서 new 깃발이나 red 색 표시하고 싶어!!
		String pnum;		
		int pageNUM, pagecount;
		int start, end; //시작행, 끝행
		int startpage, endpage; //시작페이지, 끝페이지
		int tmp; // 임시계산식
		String sqry;
		String skey , sval;
		String returnpage;
		pnum = request.getParameter("pageNum"); //pnum 은 매개변수를 받아온 값이기 때문에 String
		if(pnum ==null || pnum==""){ pnum = "1"; }
		pageNUM = Integer.parseInt(pnum);// String 값을 int 값으로 변환
		//System.out.println("클릭한 페이지 = " + pageNUM);
		
		start = (pageNUM-1)*10+1;
		end = pageNUM*10;
		tmp=(pageNUM -1)%10; //tmp 임시공간. pageNUM이 13이면 결괏값 2
		startpage = pageNUM-tmp;
		endpage = startpage+9;	
		
		skey=request.getParameter("keyfield");
		sval=request.getParameter("keyword");
		System.out.println(skey + "와(과) " + sval);
		if(skey==null||skey==""||sval==null||sval==""){
			skey="title";
			sval="";	
		}
		
		returnpage="keyfield=" + skey +"&keyword=" + sval;
		
		msg="select count(*) cnt from guest where "+ skey + " like '%" + sval + "%'";
		ST=CN.createStatement();
		RS=ST.executeQuery(msg);
		RS.next();
		Gtotal=RS.getInt("cnt");	
		
		%>
		<p>
			 전체 레코드 갯수 [<%=Gtotal%>]
		<%
		
		//페이지갯수를 구해야 이전, 다음 이동이 가능
		if(Gtotal%10==0){
			pagecount=Gtotal/10;
		}else{
			pagecount = (Gtotal/10)+1;
		}		
		//////////////////////////////////////
		String a = "select * from (";
		String b = "select rownum rn, g.* from guest g ";
		String c =  "where "+ skey + " like '%" + sval + "%'";
		String d = ") where rn between " + start + " and " + end ;
		//msg="select rownum rn, g.* from guest g";
		msg = a+b+c+d;
		RS=ST.executeQuery(msg);
		
// 		select * from( select rownum rn, g.* from (
// 		select * from guest order by sabun) g where name like '%b%')
// 		where rn between 11 and 20;
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
			<%	}	%>
			<tr onmouseover="style.backgroundColor='lightgray'"
				onmouseout="style.backgroundColor='' ">	
				<td colspan="8" align="center">								
					<%
					if(startpage>10)
						out.println("<a href=GuestList2.jsp?"+returnpage+"&pageNum="+(startpage-10)+">[이전]</a>" );	
					//out.println("<a href=GuestList.jsp?pageNum="+tmp+">[이전]</a>" );
// 					if(endpage>pagecount){
// 							endpage=pagecount;
// 						}
					for(int i=startpage; i<=endpage ; i++){			
						if(i==pageNUM){
							out.println("<font style='color:crimson'>["+i+"]");
						}else{
						out.println("<a href=GuestList2.jsp?"+returnpage+"&pageNum="+i+">["+i+"]</a>" );
						}
						//pageNum : 전달자. 매개변수
						if(i==pagecount)	break;
						}
					if(endpage<pagecount)
						out.println("<a href=GuestList2.jsp?"+returnpage+"&pageNum="+(endpage+1)+">[다음]</a>" );
					%>
				</td>
			</tr>
			<tr>
				<td colspan="8" align="center">					
					<form >
						<select name="keyfield">
							<option value=""></option>
							<option value="sabun">사번검색</option>
							<option value="name">이름검색</option>
							<option value="title">제목검색</option>
						</select>	
						<input type="text" name="keyword" size="10">
						<input type="submit" value="검색">					
					</form>
				</td>
			</tr>
		</table>
	</div>

	<br>
		<a href="GuestWrite.jsp"> [등록] </a>
		<a href="index.jsp"> [index] </a>
		<a href="login.jsp"> [login] </a>
		<a href="GuestList2.jsp"> [전체출력] </a>
</body>
</html>
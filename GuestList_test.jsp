<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ include file="ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[GuestList_test0731.jsp]</title>

<script type="text/javascript">
	function pagegood(){
	    page.keyword.value="";
	    page.keyfield.focus();
	 }
</script>
</head>
<body>
	<%
// 		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
// 		Date dt = new Date();
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
		//System.out.println(skey + "와(과) " + sval);
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
		msg = a+b+c+d;
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
// 			||RS2.next()
			while(RS.next()==true){
//  		 =======================================
			 Gsabun=RS.getInt("sabun");
			 msg3="select count(*) as rcnt from guestreply where sabun=" + Gsabun;
			 //System.out.println(Gsabun);
			 ST3=CN.createStatement();
			 RS3=ST3.executeQuery(msg3);
			 if(RS3.next()==true) {   RGtotal=RS3.getInt("rcnt");   }
// 			 ========================================
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
					 <%
					 out.println(RS.getString("title"));
					 if(RGtotal>0){
					  %> <span style='color : crimson'>[<%=RGtotal%>]</span> <%} %>
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
						out.println("<a href=GuestList.jsp?"+returnpage+"&pageNum="+(startpage-10)+">[이전]</a>" );	
					for(int i=startpage; i<=endpage ; i++){			
						if(i==pageNUM){
							out.println("<font style='color:crimson'>["+i+"]");
						}else{
						out.println("<a href=GuestList.jsp?"+returnpage+"&pageNum="+i+">["+i+"]</a>" );
						}
						//pageNum : 전달자(매개변수)
						if(i==pagecount)	break;
						}
					if(endpage<pagecount)
						out.println("<a href=GuestList.jsp?"+returnpage+"&pageNum="+(endpage+1)+">[다음]</a>" );
					%>
				</td>
			</tr>
			<tr>
				<td colspan="8" align="center">					
					<form action="GuestList.jsp" name ="page">
						검색 : 
						<select name='keyfield' onchange="pagegood()">
							<option value="">검색키워드</option>
							<option value="sabun" 
								<%if(skey.equals("sabun")){out.println("selected");}%>
								>사번검색</option>
							<option value="name"
								<%if(skey.equals("name")){out.println("selected");}%>
								>이름검색</option>
							<option value="title"
								<%if(skey.equals("title")){out.println("selected");}%>
								>제목검색</option>
						</select>
						<input type="text" name="keyword" size="10" placeholder="검색어입력" value="<%=sval%>">
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
		<a href="GuestList.jsp"> [전체출력] </a>
</body>
</html>
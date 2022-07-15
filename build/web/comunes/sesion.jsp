
<%
    
    HttpSession misession = request.getSession();
    if (misession.getAttribute("usuario") == null) {
        response.sendRedirect("index.jsp");
        return;
    } 
%>

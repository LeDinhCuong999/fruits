contentType="text/html;charset=UTF-8" language="java" %>
<%
  String message = (String) request.getAttribute("message");
%>
<html>
<head>
    <title><%=message%></title>
</head>
<body>
  <h1><%=message%></h1>
  <img src="https://webdeasy.de/wp-content/uploads/2020/06/404-pages.jpg" alt="<%=message%>">
</body>
</html>

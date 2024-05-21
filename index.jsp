<!-- index.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Catálogo de Livros</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <h1>Catálogo de Livros</h1>
    <form method="GET" action="index.jsp">
        <input type="text" name="search" placeholder="Pesquisar por título">
        <input type="submit" value="Pesquisar">
    </form>
    <div class="login">
        <form method="POST" action="admin.html">
            <input type="text" name="nome" placeholder="Nome" required>
            <input type="password" name="password" placeholder="Senha" required>
            <input type="submit" value="Login">
        </form>
    </div>
    <div class="book-list">
        <%-- Lista de livros aqui --%>
    </div>
    
    <%
        String nome = request.getParameter("nome");
        String password = request.getParameter("password");

        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/catalogo", "root", "password");
             PreparedStatement stmt = conn.prepareStatement("SELECT * FROM Usuario WHERE nome = ? AND senha = ? AND admin = TRUE")) {
            stmt.setString(1, nome);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                HttpSession userSession = request.getSession();
                userSession.setAttribute("user", rs.getString("nome"));
        %>
                <script>
                    window.location.href = "admin.html";
                </script>
        <%
            } else {
                out.println("Credenciais inválidas");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    %>
</body>
</html>

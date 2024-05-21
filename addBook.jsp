<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*, javax.servlet.*, javax.servlet.http.*" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Adicionar Novo Livro</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <%
        // Recuperando os parâmetros do formulário
        String titulo = request.getParameter("titulo");
        String autor = request.getParameter("autor");
        int ano = Integer.parseInt(request.getParameter("ano"));
        double preco = Double.parseDouble(request.getParameter("preco"));
        String foto = request.getParameter("foto");
        int idEditora = Integer.parseInt(request.getParameter("idEditora"));

        // Configurações do banco de dados
        String url = "jdbc:mysql://localhost:3306/catalogo";
        String user = "root";
        String password = "password";

        try {
            // Estabelecendo a conexão com o banco de dados
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, user, password);

            // Inserindo os dados na tabela de livros
            String sql = "INSERT INTO livro (titulo, autor, ano, preco, foto, idEditora) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, titulo);
            statement.setString(2, autor);
            statement.setInt(3, ano);
            statement.setDouble(4, preco);
            statement.setString(5, foto);
            statement.setInt(6, idEditora);
            statement.executeUpdate();

            // Fechando a conexão com o banco de dados
            conn.close();

            // Redirecionando de volta para a página de administração após a inserção bem-sucedida
            response.sendRedirect("admin.html");
        } catch (Exception e) {
            out.println("Erro ao adicionar livro: " + e.getMessage());
        }
    %>
</body>
</html>

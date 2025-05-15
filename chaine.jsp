<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String bonjour = "salut la compagnie";
    String bonjourMaj = bonjour.toUpperCase();
    String bonjourCapitalized = bonjour.substring(0, 1).toUpperCase() + bonjour.substring(1);
%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Chaine Java</title>
</head>
<body>
    <h2>Texte original :</h2>
    <p><%= bonjour %></p>

    <h2>Texte en majuscules :</h2>
    <p><%= bonjourMaj %></p>

    <h2>Texte avec première lettre en majuscule :</h2>
    <p><%= bonjourCapitalized %></p>
</body>
</html>

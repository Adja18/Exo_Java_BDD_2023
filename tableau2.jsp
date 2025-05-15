<%@ page import="java.io.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
    <title>Exercice Chaine</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 40px;
            color: #333;
        }

        h1 {
            color: #444;
        }

        .resultat {
            background-color: #fff;
            padding: 15px;
            margin-bottom: 15px;
            border-left: 5px solid #007BFF;
            box-shadow: 0 0 5px rgba(0,0,0,0.1);
        }

        .info {
            color: green;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <h1>Manipulation de chaînes</h1>

    <%
        String bonjour = "salut la compagnie";
        String messageOriginal = "Chaîne d'origine enregistrée avec succès.";

        String majuscules = bonjour.toUpperCase();
        String messageMaj = "Conversion en majuscules effectuée.";

        String capitalise = "";
        String messageCap = "";

        if (bonjour != null && !bonjour.isEmpty()) {
            capitalise = bonjour.substring(0, 1).toUpperCase() + bonjour.substring(1).toLowerCase();
            messageCap = "Première lettre mise en majuscule avec succès.";
        } else {
            messageCap = "Chaîne vide. Aucune transformation effectuée.";
        }
    %>

    <div class="resultat">
        <h2>Chaîne originale : <%= bonjour %></h2>
        <p class="info"><%= messageOriginal %></p>
    </div>

    <div class="resultat">
        <h2>En majuscules : <%= majuscules %></h2>
        <p class="info"><%= messageMaj %></p>
    </div>

    <div class="resultat">
        <h2>Première lettre en majuscule : <%= capitalise %></h2>
        <p class="info"><%= messageCap %></p>
    </div>

</body>
</html>

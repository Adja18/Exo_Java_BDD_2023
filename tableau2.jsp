<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
    HttpSession session = request.getSession();

    // Initialisation du tableau si nécessaire
    ArrayList<Integer> tableau = (ArrayList<Integer>) session.getAttribute("tableau");
    if (tableau == null) {
        tableau = new ArrayList<Integer>();
        session.setAttribute("tableau", tableau);
    }

    String message = "";
    String action = request.getParameter("action");

    if ("ajouter".equals(action)) {
        try {
            int valeur = Integer.parseInt(request.getParameter("valeur"));
            if (tableau.size() < 10) {
                tableau.add(valeur);
                message = "✅ Valeur ajoutée avec succès.";
            } else {
                message = "❌ Le tableau est plein (10 éléments max).";
            }
        } catch (Exception e) {
            message = "❌ Entrée invalide. Veuillez entrer un entier.";
        }
    } else if ("supprimer".equals(action)) {
        if (!tableau.isEmpty()) {
            tableau.remove(tableau.size() - 1);
            message = "✅ Dernière valeur supprimée.";
        } else {
            message = "❌ Le tableau est déjà vide.";
        }
    } else if ("vider".equals(action)) {
        tableau.clear();
        message = "✅ Tableau vidé avec succès.";
    }
%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Tableau Interactif</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
            background-color: #f4f4f4;
        }
        .container {
            background: white;
            padding: 25px;
            border-radius: 8px;
            width: 400px;
            box-shadow: 0 0 10px rgba(0,0,0,0.2);
        }
        input[type="number"], input[type="submit"] {
            padding: 8px;
            margin-top: 10px;
            margin-bottom: 10px;
            width: 100%;
            font-size: 16px;
        }
        .message {
            padding: 10px;
            margin-bottom: 10px;
            background: #e6f7ff;
            border-left: 4px solid #1890ff;
        }
        .tableau {
            background: #fff3cd;
            padding: 10px;
            border-left: 4px solid #ffc107;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Manipulation du tableau</h2>

    <% if (!message.isEmpty()) { %>
        <div class="message"><%= message %></div>
    <% } %>

    <form method="post">
        <label>Ajouter une valeur :</label>
        <input type="number" name="valeur" required />
        <input type="submit" name="action" value="ajouter" />
    </form>

    <form method="post">
        <input type="submit" name="action" value="supprimer" />
        <input type="submit" name="action" value="vider" />
    </form>

    <div class="tableau">
        <strong>Contenu actuel du tableau :</strong><br/>
        <% if (tableau.isEmpty()) { %>
            (Le tableau est vide)
        <% } else { %>
            <ul>
                <% for (Integer val : tableau) { %>
                    <li><%= val %></li>
                <% } %>
            </ul>
        <% } %>
    </div>
</div>
</body>
</html>

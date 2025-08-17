<%@ page language="java" contentType="text/html; charset=UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Authority Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
    <!-- Tailwind CSS CDN -->
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        body { font-family: 'Inter', sans-serif; }
        .error { color: red; margin-bottom: 10px; font-size: 14px; }
    </style>
</head>
<body class="bg-gray-50">

    <!-- Navbar -->
    <nav class="flex justify-between items-center px-8 py-4 shadow" style="background-color:#0f766e;">
        <div class="flex items-center space-x-2">
            <div class="bg-white text-[#0f766e] px-2 py-1 rounded-lg font-bold">CA</div>
            <span class="text-xl font-bold text-white">CleanAir</span>
        </div>
        <div class="space-x-4">
            <a href="<c:url value='/admin/dashboard' />" class="text-white hover:text-gray-200">Dashboard</a>
            <a href="<c:url value='/citizen/login' />" class="text-white hover:text-gray-200">Citizen</a>
            <a href="<c:url value='/authority/login' />" class="text-white hover:text-gray-200">Authority</a>
        </div>
    </nav>

    <!-- Login Card -->
    <div class="flex justify-center items-center min-h-[calc(100vh-160px)] px-4">
        <div class="bg-white p-8 rounded-2xl shadow-md w-full max-w-sm text-center">
            <div class="w-16 h-16 bg-[#0f766e] rounded-full flex items-center justify-center mx-auto mb-4 text-2xl font-bold text-white">A</div>
            <h2 class="text-2xl font-bold text-[#0f766e] mb-1">Authority Login</h2>
            <p class="text-gray-600 mb-6">Access specialized environmental monitoring tools</p>

            <c:if test="${not empty error}">
                <p class="error">${error}</p>
            </c:if>

            <!-- Form -->
            <form method="post" action="<c:url value='/authority/login'/>" class="space-y-4">
                <input type="email" name="email" placeholder="Enter your email" required
                       class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-[#0f766e] focus:outline-none"/>
                <input type="password" name="password" placeholder="Enter your password" required
                       class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-[#0f766e] focus:outline-none"/>
                <button type="submit" class="w-full bg-[#0f766e] text-white py-2.5 rounded-lg hover:bg-teal-700 transition">
                    Sign In
                </button>
            </form>

            <!-- ✅ Back to Home link -->
            <div class="mt-4">
                <a href="<c:url value='/'/>" 
                   class="text-sm text-[#0f766e] hover:underline">
                    ← Back to Home
                </a>
            </div>

        </div>
    </div>

    <!-- Footer -->
    <footer class="bg-gray-100 text-center py-6 mt-12">
        <p class="text-gray-600 text-sm">
            © 2024 CleanAir Pollution Reporting System. All rights reserved.
        </p>
    </footer>

</body>
</html>

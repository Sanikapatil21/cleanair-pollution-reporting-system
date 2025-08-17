<%@ page language="java" contentType="text/html; charset=UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Citizen Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50 font-[Inter]">

    <!-- Navbar -->
    <nav class="flex justify-between items-center px-8 py-4 shadow" style="background-color:#0f766e;">
        <div class="flex items-center space-x-2">
            <div class="bg-white text-[#0f766e] px-2 py-1 rounded-lg font-bold">CA</div>
            <span class="text-xl font-bold text-white">CleanAir</span>
        </div>
        <div class="space-x-4">
            <a href="<c:url value='/admin/dashboard' />" class="text-white hover:text-gray-200">Dashboard</a>
            <a href="<c:url value='/citizen/login' />" class="bg-white text-[#0f766e] px-3 py-1 rounded-lg font-medium shadow-md">Citizen</a>
            <a href="<c:url value='/authority/login' />" class="text-white hover:text-gray-200">Authority</a>
        </div>
    </nav>

    <!-- Centered Login Card -->
    <div class="flex justify-center items-center min-h-[80vh] px-4">
        <div class="bg-white p-8 rounded-2xl shadow-lg w-full max-w-md border border-gray-200">
            
            <div class="text-center mb-6">
                <h2 class="text-3xl font-bold text-gray-800">Citizen Login</h2>
                <p class="text-gray-500">Sign in to report and track pollution cases</p>
            </div>

            <c:if test="${not empty error}">
                <div class="bg-red-50 border border-red-200 text-red-600 px-3 py-2 rounded-lg text-sm mb-4">
                    ${error}
                </div>
            </c:if>

            <form method="post" action="<c:url value='/citizen/login'/>" class="space-y-4">
                <div>
                    <label class="block text-left text-sm font-medium text-gray-700 mb-1">Email</label>
                    <input type="email" name="email" placeholder="Enter your email" required 
                           class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-teal-500"/>
                </div>
                <div>
                    <label class="block text-left text-sm font-medium text-gray-700 mb-1">Password</label>
                    <input type="password" name="password" placeholder="Enter your password" required 
                           class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-teal-500"/>
                </div>
                <button type="submit" 
                        class="w-full bg-[#0f766e] text-white py-2 rounded-lg font-semibold hover:bg-[#115e59] transition shadow-md">
                    Sign In
                </button>
            </form>

            <div class="mt-6 text-sm text-gray-600 text-center space-y-2">
                
                <p>Don’t have an account? 
                   <a href="<c:url value='/citizen/register' />" class="text-[#0f766e] hover:underline font-medium">Register here</a>
                </p>
            </div>

            <!-- Back to Home Link -->
            <div class="mt-6 text-center">
                <a href="<c:url value='/'/>" class="text-[#0f766e] font-medium hover:underline">
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

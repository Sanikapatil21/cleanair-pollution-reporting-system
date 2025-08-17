<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Citizen Register</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
    <!-- Tailwind CSS CDN -->
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
            <a href="<c:url value='/citizen/login' />" class="text-white hover:text-gray-200">Citizen</a>
            <a href="<c:url value='/authority/login' />" class="text-white hover:text-gray-200">Authority</a>
        </div>
    </nav>

    <!-- Page content -->
    <div class="flex flex-col items-center py-12 px-4">
        <div class="bg-white rounded-2xl shadow-md border border-gray-200 p-8 w-full max-w-lg">
            
            <!-- Title -->
            <h2 class="text-2xl font-bold text-center text-gray-800">Citizen Register</h2>
            <p class="text-center text-gray-600 mb-6">Join CleanAir and help protect your community</p>

            <!-- Form -->
            <form method="post" action="<c:url value='/citizen/register'/>" class="space-y-4">
                <div>
                    <label class="block text-sm font-medium text-gray-700">Contact (PK)</label>
                    <input type="text" name="contact" placeholder="Enter contact number" required
                           class="mt-1 w-full p-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-[#0f766e]" />
                </div>

                <div>
                    <label class="block text-sm font-medium text-gray-700">Name</label>
                    <input type="text" name="name" placeholder="Enter your full name" required
                           class="mt-1 w-full p-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-[#0f766e]" />
                </div>

                <div>
                    <label class="block text-sm font-medium text-gray-700">Address</label>
                    <input type="text" name="address" placeholder="Enter your address" required
                           class="mt-1 w-full p-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-[#0f766e]" />
                </div>

                <div>
                    <label class="block text-sm font-medium text-gray-700">Email</label>
                    <input type="email" name="email" placeholder="Enter your email" required
                           class="mt-1 w-full p-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-[#0f766e]" />
                </div>

                <div>
                    <label class="block text-sm font-medium text-gray-700">Password</label>
                    <input type="password" name="password" placeholder="Create a password" required
                           class="mt-1 w-full p-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-[#0f766e]" />
                </div>

                <button type="submit"
                        class="w-full bg-[#0f766e] text-white py-2 rounded-lg font-semibold hover:bg-[#0c5e56] transition">
                    Create Account
                </button>
            </form>

            <!-- Links -->
            <p class="text-center text-sm text-gray-600 mt-4">
                Already have an account? 
                <a href="<c:url value='/citizen/login'/>" class="text-[#0f766e] hover:underline">Sign In</a>
            </p>

            <p class="text-center text-sm text-gray-600 mt-2">
                <a href="<c:url value='/'/>" class="text-[#0f766e] hover:underline">← Back to Home</a>
            </p>
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

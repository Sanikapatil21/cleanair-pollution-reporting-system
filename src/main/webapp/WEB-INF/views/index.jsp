<%@ page language="java" contentType="text/html; charset=UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>

<html>
<head>
    <title>CleanAir</title>
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

    <!-- Hero Section -->
    <section class="text-center py-16 bg-gradient-to-r from-blue-50 to-teal-50">
        <span class="px-4 py-1 bg-teal-100 text-teal-700 rounded-full text-sm font-medium">
            Environmental Monitoring System
        </span>
        <h1 class="mt-6 text-4xl md:text-5xl font-bold text-gray-800">
            Breathe Easy with <span class="text-teal-600">CleanAir</span>
        </h1>
        <p class="mt-4 max-w-2xl mx-auto text-gray-600 text-lg">
            A comprehensive pollution reporting system that empowers citizens, 
            authorities, and administrators to monitor air quality, report 
            environmental issues, and take action for cleaner communities.
        </p>
        <div class="mt-6 space-x-4">
            <a href="<c:url value='/admin/dashboard' />" 
               class="bg-teal-600 text-white px-6 py-3 rounded-xl shadow hover:bg-teal-700">
               View Dashboard
            </a>
            <a href="#" 
               class="bg-white border border-gray-300 px-6 py-3 rounded-xl shadow hover:bg-gray-100">
               Learn More
            </a>
        </div>
    </section>

    <!-- Access Levels Section -->
    <section class="py-16 px-8 bg-white">
        <h2 class="text-center text-3xl font-bold text-gray-800 mb-12">Multiple Access Levels</h2>
        <div class="grid md:grid-cols-3 gap-8 max-w-6xl mx-auto">
            <!-- Admin -->
            <div class="p-6 bg-gray-50 rounded-2xl shadow hover:shadow-lg transition">
                <h3 class="text-xl font-semibold text-teal-600">Admin Dashboard</h3>
                <p class="mt-2 text-gray-600">
                   System-wide management, data analytics, and platform configuration.
                </p>
                <a href="<c:url value='/admin/dashboard' />" 
                   class="mt-4 inline-block bg-teal-600 text-white px-5 py-2 rounded-lg hover:bg-teal-700">
                   Access Admin Panel
                </a>
            </div>

            <!-- Citizen -->
            <div class="p-6 bg-gray-50 rounded-2xl shadow hover:shadow-lg transition">
                <h3 class="text-xl font-semibold text-teal-600">Citizen Portal</h3>
                <p class="mt-2 text-gray-600">
                    Report environmental issues, view air quality data, and track community health metrics
                </p>
                <a href="<c:url value='/citizen/login' />" 
                   class="mt-4 inline-block bg-teal-600 text-white px-5 py-2 rounded-lg hover:bg-teal-700">
                   Citizen Login
                </a>
            </div>

            <!-- Authority -->
            <div class="p-6 bg-gray-50 rounded-2xl shadow hover:shadow-lg transition">
                <h3 class="text-xl font-semibold text-teal-600">Authority Access</h3>
                <p class="mt-2 text-gray-600">
                    Monitor regional data, respond to reports, and implement environmental policies.
                </p>
                <a href="<c:url value='/authority/login' />" 
                   class="mt-4 inline-block bg-teal-600 text-white px-5 py-2 rounded-lg hover:bg-teal-700">
                   Authority Login
                </a>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="bg-gray-100 text-center py-6 mt-12">
        <p class="text-gray-600 text-sm">
            © 2024 CleanAir Pollution Reporting System. All rights reserved.
        </p>
    </footer>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>

<html>
<head>
    <title>New Report</title>
    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50 font-sans">

    <!-- Tailwind Navbar -->
    <nav class="flex justify-between items-center px-8 py-4 shadow bg-teal-700">
        <div class="flex items-center space-x-2">
            <div class="bg-white text-teal-700 px-2 py-1 rounded-lg font-bold">CA</div>
            <span class="text-xl font-bold text-white">CleanAir</span>
        </div>
        <div class="space-x-6">
            <a href="<c:url value='/admin/dashboard' />" class="text-white hover:text-gray-200">Dashboard</a>
            <a href="<c:url value='/citizen/login' />" class="text-white hover:text-gray-200">Citizen</a>
            <a href="<c:url value='/authority/login' />" class="text-white hover:text-gray-200">Authority</a>
        </div>
    </nav>

    <!-- Main Form Section -->
    <div class="container mx-auto max-w-xl mt-10 px-4">
        <div class="bg-white rounded-2xl shadow border border-gray-200">
            <!-- Card Header -->
            <div class="bg-teal-700 text-white text-center font-semibold text-lg rounded-t-2xl py-3">
                File Pollution Report
            </div>
            
            <!-- Card Body -->
            <div class="p-6 space-y-4">
                <form method="post" action="<c:url value='/citizen/report/new'/>" class="space-y-4">
                    <input type="hidden" name="citizenContactId" value="${citizenContactId}"/>

                    <!-- Location -->
                    <div>
                        <label class="block font-medium text-gray-700 mb-1">Location</label>
                        <input type="text" name="location" required 
                               class="w-full border border-gray-300 rounded-lg p-2 focus:ring-2 focus:ring-teal-600 focus:outline-none"/>
                    </div>

                    <!-- Pollution Type -->
                    <div>
                        <label class="block font-medium text-gray-700 mb-1">Pollution Type</label>
                        <input type="text" name="pollutionType" required 
                               class="w-full border border-gray-300 rounded-lg p-2 focus:ring-2 focus:ring-teal-600 focus:outline-none"/>
                    </div>

                    <!-- Description -->
                    <div>
                        <label class="block font-medium text-gray-700 mb-1">Description</label>
                        <textarea name="description" rows="5" 
                                  class="w-full border border-gray-300 rounded-lg p-2 focus:ring-2 focus:ring-teal-600 focus:outline-none"></textarea>
                    </div>

                    <!-- Submit Button -->
                    <button type="submit" 
                            class="w-full bg-teal-700 hover:bg-teal-800 text-white font-medium py-2 rounded-lg transition">
                        Submit Report
                    </button>
                </form>

                <!-- Back to Home -->
                <div class="text-center mt-4">
                    <a href="<c:url value='/'/>" class="text-teal-700 font-medium hover:underline">
                        🏠 Back to Home
                    </a>
                </div>
            </div>
        </div>
    </div>

    <!-- Tailwind Footer -->
    <footer class="bg-gray-100 text-center py-6 mt-12">
        <p class="text-gray-600 text-sm">
            © 2024 CleanAir Pollution Reporting System. All rights reserved.
        </p>
    </footer>

</body>
</html>

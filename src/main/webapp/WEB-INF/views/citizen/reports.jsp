<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>
<head>
    <title>Citizen Report Dashboard</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        body {
            background-color: #f9fafb;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <nav class="flex justify-between items-center px-8 py-4 shadow" style="background-color:#0f766e;">
        <div class="flex items-center space-x-2">
            <div class="bg-white text-[#0f766e] px-2 py-1 rounded-lg font-bold">CA</div>
            <span class="text-xl font-bold text-white">CleanAir</span>
        </div>
        <div class="space-x-4">
            <a href="${pageContext.request.contextPath}/admin/dashboard" class="text-white hover:text-gray-200">Dashboard</a>
            <a href="${pageContext.request.contextPath}/citizen/login" class="text-white hover:text-gray-200">Citizen</a>
            <a href="${pageContext.request.contextPath}/authority/login" class="text-white hover:text-gray-200">Authority</a>
        </div>
    </nav>

    <!-- Dashboard Header -->
    <div class="container mx-auto mt-6 px-6">
        <div class="bg-white p-6 rounded-2xl shadow">
            <h2 class="text-2xl font-bold text-gray-800 mb-2 text-center">Citizen Report Dashboard</h2>
            <p class="text-gray-600 text-center">
                Track and manage your environmental reports. Help us maintain cleaner communities by reporting pollution issues and monitoring their resolution status.
            </p>
            
            <!-- Buttons -->
            <div class="flex justify-center gap-4 mt-6">
                <a href="${pageContext.request.contextPath}/citizen/report/new?contact=${citizen.contact}" 
                   class="bg-[#0f766e] text-white px-5 py-2 rounded-2xl shadow hover:bg-[#0c5d56] transition">
                    + File New Report
                </a>
                <a href="${pageContext.request.contextPath}/" 
                   class="bg-gray-200 text-gray-800 px-5 py-2 rounded-2xl shadow hover:bg-gray-300 transition">
                    Home
                </a>
            </div>
        </div>

        <!-- Reports Table -->
        <div class="mt-8 bg-white shadow rounded-2xl overflow-hidden">
            <h5 class="px-6 py-4 font-semibold text-gray-700 border-b">My Reports</h5>
            <div class="overflow-x-auto">
                <table class="min-w-full divide-y divide-gray-200 text-sm text-center">
                    <thead class="bg-gray-100 text-gray-700">
                        <tr>
                            <th class="px-6 py-3 font-semibold">ID</th>
                            <th class="px-6 py-3 font-semibold">Type</th>
                            <th class="px-6 py-3 font-semibold">Location</th>
                            <th class="px-6 py-3 font-semibold">Status</th>
                            <th class="px-6 py-3 font-semibold">Comment</th>
                            <th class="px-6 py-3 font-semibold">Date</th>
                            <th class="px-6 py-3 font-semibold">Image</th>
                            <th class="px-6 py-3 font-semibold">Action</th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-gray-100">
                        <c:forEach items="${reports}" var="r">
                            <tr class="hover:bg-gray-50">
                                <td class="px-6 py-3 font-medium text-gray-800">#${r.id}</td>
                                <td class="px-6 py-3 text-gray-600">${r.pollutionType}</td>
                                <td class="px-6 py-3 text-gray-600">${r.location}</td>
                                <td class="px-6 py-3">
                                    <c:choose>
                                        <c:when test="${r.status eq 'NEW'}">
                                            <span class="px-3 py-1 rounded-full text-xs font-semibold bg-blue-100 text-blue-700">
                                                Pending
                                            </span>
                                        </c:when>
                                        <c:when test="${r.status eq 'IN_PROGRESS'}">
                                            <span class="px-3 py-1 rounded-full text-xs font-semibold bg-yellow-100 text-yellow-700">
                                                Under Review
                                            </span>
                                        </c:when>
                                        <c:when test="${r.status eq 'ACTION_COMPLETE'}">
                                            <span class="px-3 py-1 rounded-full text-xs font-semibold bg-green-100 text-green-700">
                                                Resolved
                                            </span>
                                        </c:when>
                                    </c:choose>
                                </td>
                                <td class="px-6 py-3 text-gray-600">${r.authorityComment}</td>
                                <td class="px-6 py-3 text-gray-600">${r.date}</td>

                                <!-- ✅ Fixed Image column -->
                                <td class="px-6 py-3">
                                    <c:choose>
                                        <c:when test="${not empty r.reportImage}">
                                            <c:set var="imgPath" value="${r.reportImage}" />
                                            
                                            <!-- If it doesn't already contain 'uploads/', prepend -->
                                            <c:if test="${not fn:contains(imgPath, 'uploads/')}">
                                                <c:set var="imgPath" value="uploads/${imgPath}" />
                                            </c:if>

                                            <a href="${pageContext.request.contextPath}/${imgPath}" target="_blank">
                                                <img src="${pageContext.request.contextPath}/${imgPath}" 
                                                     alt="Report Image" 
                                                     class="h-16 w-16 object-cover rounded shadow-md border hover:scale-105 transition"/>
                                            </a>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="text-xs text-gray-400">No Image</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>

                                <!-- Delete Button -->
                                <td class="px-6 py-3">
                                    <form method="post" action="${pageContext.request.contextPath}/citizen/report/delete">
                                        <input type="hidden" name="id" value="${r.id}"/>
                                        <input type="hidden" name="citizenContactId" value="${citizen.contact}"/>
                                        <button type="submit" 
                                                class="px-3 py-1 rounded-md text-sm border border-[#0f766e] text-[#0f766e] bg-white hover:bg-[#0f766e] hover:text-white transition">
                                            Delete
                                        </button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
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

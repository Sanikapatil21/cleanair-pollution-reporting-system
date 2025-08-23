<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>

<html>
<head>
    <title>Admin Dashboard</title>
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
            <span class="text-xl font-bold text-white">CleanAir Admin</span>
        </div>
        <div class="space-x-4">
            <a href="${pageContext.request.contextPath}/admin/authority/new" class="text-white hover:text-gray-200">+ Add Authority</a>
            <a href="${pageContext.request.contextPath}/admin/authorities" class="text-white hover:text-gray-200">List Authorities</a>
            <a href="${pageContext.request.contextPath}/" class="text-white hover:text-gray-200">Home</a>
        </div>
    </nav>

    <!-- Content -->
    <section class="p-8">
        <h2 class="text-2xl font-bold text-gray-800 mb-6">Recent Reports</h2>

        <div class="bg-white rounded-xl shadow overflow-hidden">
            <table class="min-w-full border-collapse">
                <thead class="bg-gray-100">
                    <tr>
                        <th class="px-6 py-3 text-left text-sm font-semibold text-gray-700">ID</th>
                        <th class="px-6 py-3 text-left text-sm font-semibold text-gray-700">Citizen</th>
                        <th class="px-6 py-3 text-left text-sm font-semibold text-gray-700">Type</th>
                        <th class="px-6 py-3 text-left text-sm font-semibold text-gray-700">Location</th>
                        <th class="px-6 py-3 text-left text-sm font-semibold text-gray-700">Status</th>
                        <th class="px-6 py-3 text-left text-sm font-semibold text-gray-700">Date</th>
                        <th class="px-6 py-3 text-left text-sm font-semibold text-gray-700">Image</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${reports}" var="r">
                        <tr class="border-t hover:bg-gray-50">
                            <td class="px-6 py-3 text-sm text-gray-700">${r.id}</td>
                            <td class="px-6 py-3 text-sm text-gray-700">${r.citizenContactId}</td>
                            <td class="px-6 py-3 text-sm text-gray-700">${r.pollutionType}</td>
                            <td class="px-6 py-3 text-sm text-gray-700">${r.location}</td>
                            <td class="px-6 py-3">
                                <span class="
                                    px-3 py-1 rounded-full text-xs font-medium
                                    <c:choose>
                                        <c:when test='${r.status eq "NEW"}'> bg-yellow-100 text-yellow-800</c:when>
                                        <c:when test='${r.status eq "IN_PROGRESS"}'> bg-blue-100 text-blue-800</c:when>
                                        <c:when test='${r.status eq "ACTION_COMPLETE"}'> bg-green-100 text-green-800</c:when>
                                        <c:otherwise> bg-gray-100 text-gray-700</c:otherwise>
                                    </c:choose>
                                ">
                                    ${r.status}
                                </span>
                            </td>
                            <td class="px-6 py-3 text-sm text-gray-700">${r.date}</td>
                            <td class="px-6 py-3 text-sm">
                                <c:choose>
                                    <c:when test="${not empty r.reportImage}">
                                        <a href="${pageContext.request.contextPath}/uploads/${r.reportImage}" target="_blank">
                                            <img src="${pageContext.request.contextPath}/uploads/${r.reportImage}"
                                                 alt="Report Image"
                                                 class="h-16 w-16 object-cover rounded shadow border hover:scale-105 transition"/>
                                        </a>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="text-xs text-gray-400">No Image</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
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

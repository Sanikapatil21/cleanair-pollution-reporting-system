<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>
<head>
    <title>All Reports</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
    <!-- Tailwind CSS CDN -->
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-50 font-[Inter]">

    <!-- ✅ Navbar -->
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

    <!-- ✅ Content -->
    <div class="max-w-7xl mx-auto px-6 py-10">
        <h2 class="text-2xl font-bold text-gray-800 mb-2">All Pollution Reports</h2>
        <p class="text-gray-600 mb-6">Manage and update environmental incident reports</p>
        <a href="${pageContext.request.contextPath}/" 
           class="inline-block mb-6 px-4 py-2 bg-white border border-gray-300 rounded-lg text-gray-700 text-sm hover:bg-gray-100">
           ← Back to Home
        </a>

        <div class="overflow-x-auto bg-white rounded-xl shadow">
            <table class="min-w-full text-sm text-left text-gray-600">
                <thead class="bg-gray-100 text-gray-700 uppercase text-xs">
                    <tr>
                        <th class="px-6 py-3">ID</th>
                        <th class="px-6 py-3">Citizen</th>
                        <th class="px-6 py-3">Type</th>
                        <th class="px-6 py-3">Location</th>
                        <th class="px-6 py-3">Image</th>
                        <th class="px-6 py-3">Status</th>
                        <th class="px-6 py-3">Comment</th>
                        <th class="px-6 py-3">Update</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-gray-200">
                    <c:forEach items="${reports}" var="r">
                        <tr class="hover:bg-gray-50">
                            <td class="px-6 py-4 font-medium">#${r.id}</td>
                            <td class="px-6 py-4">${r.citizenContactId}</td>
                            <td class="px-6 py-4">${r.pollutionType}</td>
                            <td class="px-6 py-4">${r.location}</td>

                            <!-- ✅ Fixed Image Display -->
                            <td class="px-6 py-4">
                                <c:choose>
                                    <c:when test="${not empty r.reportImage}">
                                        <c:set var="cleanImage" value="${r.reportImage}" />
                                        <!-- Strip leading 'uploads/' if present -->
                                        <c:if test="${fn:startsWith(cleanImage, 'uploads/')}">
                                            <c:set var="cleanImage" value="${fn:substringAfter(cleanImage, 'uploads/')}" />
                                        </c:if>
                                        <a href="${pageContext.request.contextPath}/uploads/${cleanImage}" target="_blank">
                                            <img src="${pageContext.request.contextPath}/uploads/${cleanImage}"
                                                 alt="Report Image"
                                                 class="w-20 h-20 object-cover rounded-md border shadow hover:scale-105 transition"/>
                                        </a>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="text-gray-400 text-xs italic">No Image</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>

                            <!-- ✅ Status -->
                            <td class="px-6 py-4">
                                <c:choose>
                                    <c:when test="${r.status == 'NEW'}">
                                        <span class="px-2 py-1 text-xs font-semibold rounded bg-yellow-100 text-yellow-800">NEW</span>
                                    </c:when>
                                    <c:when test="${r.status == 'IN_PROGRESS'}">
                                        <span class="px-2 py-1 text-xs font-semibold rounded bg-blue-100 text-blue-800">IN PROGRESS</span>
                                    </c:when>
                                    <c:when test="${r.status == 'ACTION_COMPLETE'}">
                                        <span class="px-2 py-1 text-xs font-semibold rounded bg-green-100 text-green-800">COMPLETE</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="px-2 py-1 text-xs font-semibold rounded bg-gray-100 text-gray-800">${r.status}</span>
                                    </c:otherwise>
                                </c:choose>
                            </td>

                            <!-- ✅ Comment -->
                            <td class="px-6 py-4">${r.authorityComment}</td>

                            <!-- ✅ Update Form -->
                            <td class="px-6 py-4">
                                <form method="post" action="${pageContext.request.contextPath}/authority/report/update" class="flex items-center space-x-2">
                                    <input type="hidden" name="id" value="${r.id}"/>
                                    <select name="status" class="px-2 py-1 border rounded-lg text-sm">
                                        <option value="NEW" ${r.status=='NEW'?'selected':''}>NEW</option>
                                        <option value="IN_PROGRESS" ${r.status=='IN_PROGRESS'?'selected':''}>IN PROGRESS</option>
                                        <option value="ACTION_COMPLETE" ${r.status=='ACTION_COMPLETE'?'selected':''}>COMPLETE</option>
                                    </select>
                                    <input type="text" name="comment" placeholder="Comment" value="${r.authorityComment}" 
                                           class="px-2 py-1 border rounded-lg text-sm"/>
                                    <button type="submit" class="px-3 py-1 bg-[#0f766e] text-white rounded-lg text-sm hover:bg-[#0d5d58]">Save</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <!-- ✅ Footer -->
    <footer class="bg-gray-100 text-center py-6 mt-12">
        <p class="text-gray-600 text-sm">
            © 2024 CleanAir Pollution Reporting System. All rights reserved.
        </p>
    </footer>

</body>
</html>

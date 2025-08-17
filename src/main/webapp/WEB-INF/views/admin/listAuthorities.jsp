<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>

<html>
<head>
  <title>Authorities</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
  <!-- Tailwind CSS -->
  <script src="https://cdn.tailwindcss.com"></script>
  <style>
    body { font-family: 'Inter', sans-serif; }
  </style>
</head>
<body class="bg-gray-50">

  <!-- Navbar (CleanAir style) -->
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

  <!-- Page Wrapper -->
  <div class="max-w-6xl mx-auto p-6">
    <a href="${pageContext.request.contextPath}/admin/dashboard" class="text-[#0f766e] hover:underline text-sm block mb-4">← Back to Dashboard</a>

    <h2 class="text-2xl font-bold mb-1">Authorities</h2>
    <p class="text-gray-600 mb-6">Contact information for environmental monitoring authorities</p>

    <!-- Card -->
    <div class="bg-white shadow rounded-xl overflow-hidden">
      <div class="px-6 py-4 border-b border-gray-200">
        <h3 class="text-lg font-semibold text-gray-800">Authority Directory</h3>
      </div>
      <div class="overflow-x-auto">
        <table class="w-full text-sm text-left text-gray-600">
          <thead class="bg-gray-100 text-gray-700 text-sm uppercase">
            <tr>
              <th scope="col" class="px-6 py-3">Contact</th>
              <th scope="col" class="px-6 py-3">Name</th>
              <th scope="col" class="px-6 py-3">Department</th>
              <th scope="col" class="px-6 py-3">Email</th>
            </tr>
          </thead>
          <tbody class="divide-y divide-gray-200">
            <c:forEach items="${authorities}" var="a">
              <tr class="hover:bg-gray-50">
                <td class="px-6 py-4">${a.contact}</td>
                <td class="px-6 py-4">${a.name}</td>
                <td class="px-6 py-4">${a.department}</td>
                <td class="px-6 py-4">
                  <a href="mailto:${a.email}" class="text-[#0f766e] hover:underline">${a.email}</a>
                </td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
    </div>
  </div>

  <!-- Footer (CleanAir style) -->
  <footer class="bg-gray-100 text-center py-6 mt-12">
      <p class="text-gray-600 text-sm">
          © 2024 CleanAir Pollution Reporting System. All rights reserved.
      </p>
  </footer>

</body>
</html>

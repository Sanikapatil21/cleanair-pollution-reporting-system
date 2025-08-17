<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page isELIgnored="false" %>

<html>
<head>
  <title>Add Authority</title>
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
          <span class="text-xl font-bold text-white">CleanAir Admin</span>
      </div>
      <div class="space-x-4">
          <a href="${pageContext.request.contextPath}/admin/dashboard" class="text-white hover:text-gray-200">Dashboard</a>
          <a href="${pageContext.request.contextPath}/citizen/login" class="text-white hover:text-gray-200">Citizen</a>
          <a href="${pageContext.request.contextPath}/authority/login" class="text-white hover:text-gray-200">Authority</a>
          <a href="${pageContext.request.contextPath}/admin/dashboard" class="text-white hover:text-gray-200">Logout</a>
      </div>
  </nav>

  <!-- Page Content -->
  <div class="max-w-xl mx-auto bg-white mt-12 p-8 rounded-2xl shadow">
    <h2 class="text-2xl font-bold text-gray-800 text-center">Add Authority</h2>
    <p class="text-gray-500 text-center text-sm mb-6">
      Add a new environmental authority to the CleanAir monitoring system.
    </p>
    
    <form method="post" class="space-y-4">
      <div>
        <label class="block font-medium text-gray-700">Contact (PK) *</label>
        <input type="text" name="contact" required
               class="w-full border rounded-lg px-3 py-2 focus:outline-none focus:ring-2 focus:ring-teal-600"/>
      </div>

      <div>
        <label class="block font-medium text-gray-700">Name *</label>
        <input type="text" name="name" required
               class="w-full border rounded-lg px-3 py-2 focus:outline-none focus:ring-2 focus:ring-teal-600"/>
      </div>

      <div>
        <label class="block font-medium text-gray-700">Department *</label>
        <input type="text" name="department" required
               class="w-full border rounded-lg px-3 py-2 focus:outline-none focus:ring-2 focus:ring-teal-600"/>
      </div>

      <div>
        <label class="block font-medium text-gray-700">Email *</label>
        <input type="email" name="email" required
               class="w-full border rounded-lg px-3 py-2 focus:outline-none focus:ring-2 focus:ring-teal-600"/>
      </div>

      <div>
        <label class="block font-medium text-gray-700">Password *</label>
        <input type="password" name="password" required
               class="w-full border rounded-lg px-3 py-2 focus:outline-none focus:ring-2 focus:ring-teal-600"/>
      </div>

      <div class="flex gap-4">
        <button type="submit" class="bg-teal-600 text-white px-5 py-2 rounded-lg hover:bg-teal-700">
          Save Authority
        </button>
        <button type="reset" class="bg-gray-200 text-gray-700 px-5 py-2 rounded-lg hover:bg-gray-300">
          Cancel
        </button>
      </div>
    </form>

    <a href="${pageContext.request.contextPath}/admin/dashboard" 
       class="block mt-6 text-teal-600 text-sm hover:underline">
      ← Back to Admin Dashboard
    </a>
  </div>

  <!-- Footer -->
  <footer class="bg-gray-100 text-center py-6 mt-12">
      <p class="text-gray-600 text-sm">
          © 2024 CleanAir Pollution Reporting System. All rights reserved.
      </p>
  </footer>

</body>
</html>

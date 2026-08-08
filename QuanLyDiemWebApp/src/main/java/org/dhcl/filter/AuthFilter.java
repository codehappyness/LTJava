package org.dhcl.filter;

import org.dhcl.model.User;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

// Áp dụng filter cho mọi request
@WebFilter("/*")
public class AuthFilter implements Filter {

	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) res;
		HttpSession session = request.getSession(false); // chỉ lấy session nếu đã tồn tại, không tạo mới nếu chưa có

		String loginURI = request.getContextPath() + "/login";
		String requestURI = request.getRequestURI();

		// 1. Cho phép các file tĩnh (CSS, JS, Images) và trang Login đi qua
		boolean loggedIn = (session != null && session.getAttribute("currentUser") != null);
		boolean loginRequest = requestURI.equals(loginURI) || requestURI.endsWith("login.jsp");
		boolean resourceRequest = requestURI.matches(".*(css|jpg|png|gif|js)");

		if (loggedIn || loginRequest || resourceRequest) {
			// 2. PHÂN QUYỀN (AUTHORIZATION)
			if (loggedIn) {
				User user = (User) session.getAttribute("currentUser");
				String role = user.getRole();

				// Nếu truy cập vào quản lý User mà không phải Admin -> Chặn
				if (requestURI.contains("/user") && !role.equals("admin")) {
					response.sendError(HttpServletResponse.SC_FORBIDDEN, "Bạn không có quyền truy cập trang này!");
					return;
				}

				// (Mở rộng) Nếu là Student, chặn các hành động chỉnh sửa (nếu muốn chặn từ
				// server)
				// Ví dụ: if (role.equals("student") && request.getParameter("action") != null)
				// ...
				// Bảo vệ Subject và Grade (Student chỉ được xem, không được sửa)
				// Nếu URL chứa /subject hoặc /grade VÀ role là student
				System.out.println(requestURI.toString());
				System.out.println(role);
				if ((requestURI.contains("/subject") || requestURI.contains("/grade")
						|| requestURI.contains("/student")) && role.equals("student")) {

					// Kiểm tra xem có đang cố thực hiện hành động sửa đổi không?
					String action = request.getParameter("action");
					String method = request.getMethod(); // GET hoặc POST

					// Nếu method là POST (thường là submit form thêm/sửa)
					// HOẶC action khác null (ví dụ: ?action=new, ?action=delete)
					if (method.equalsIgnoreCase("POST") || (action != null && !action.isEmpty())) {

						response.sendError(HttpServletResponse.SC_FORBIDDEN,
								"Sinh viên chỉ được quyền xem, không được chỉnh sửa!");
						return; // Dừng lại ngay, không cho đi tiếp xuống Servlet
					}
				}
			}

			chain.doFilter(request, response); // Cho phép đi tiếp
		} else {
			// Chưa đăng nhập -> Đá về trang login
			response.sendRedirect(loginURI);
		}
	}
}
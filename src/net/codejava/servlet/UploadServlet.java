package net.codejava.servlet;

import java.io.File;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/UploadServlet")
@MultipartConfig(fileSizeThreshold=1024*1024*2,	// 2MB 
				 maxFileSize=1024*1024*10,		// 10MB
				 maxRequestSize=1024*1024*50)	// 50MB
public class UploadServlet extends HttpServlet
{
  private static final String SAVE_DIR = "uploadFiles";

  protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
  {
    String appPath = request.getServletContext().getRealPath("");
    appPath = appPath + "/image";

    String savePath = appPath + File.separator + "uploadFiles";

    File fileSaveDir = new File(savePath);
    if (!fileSaveDir.exists()) {
      fileSaveDir.mkdir();
    }

    for (Part part : request.getParts()) {
      String fileName = extractFileName(part);
      part.write(savePath + File.separator + fileName);
    }

    request.setAttribute("message", "Upload has been done successfully!");
    getServletContext().getRequestDispatcher("/reg.jsp?choice=13").forward(
      request, response);
  }

  private String extractFileName(Part part)
  {
    String contentDisp = part.getHeader("content-disposition");
    String[] items = contentDisp.split(";");
    for (String s : items) {
      if (s.trim().startsWith("filename")) {
        return s.substring(s.indexOf("=") + 2, s.length() - 1);
      }
    }
    return "";
  }
}
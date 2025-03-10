<%@page contentType="text/html" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Gọi API Gemini từ JSP</title>
  </head>
  <body>
    <h2>Kết quả từ API Gemini</h2>
    <input type="text" id="userInput" placeholder="Nhập câu hỏi của bạn..." />
    <button onclick="fetchGeminiResponse()">Gọi API</button>
    <pre id="response"></pre>
  </body>

  <script>
    async function fetchGeminiResponse() {
      // Lấy nội dung từ ô input
      let userText = document.getElementById("userInput").value.trim();
      if (!userText) {
        alert("Vui lòng nhập câu hỏi!");
        return;
      }

      // Thêm phần text yêu cầu
      let fullText =
        userText + " Viết thành 1 đoạn văn, 15 từ trên 1 dòng, bỏ những ký tự";

      const requestBody = {
        contents: [
          {
            parts: [
              {
                text: fullText,
              },
            ],
          },
        ],
      };

      try {
        const response = await fetch("/gemini-proxy", {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify(requestBody),
        });

        if (!response.ok) {
          throw new Error("Lỗi kết nối API");
        }

        const data = await response.text();
        console.log(data);
        document.getElementById("response").innerText = JSON.stringify(
          data,
          null,
          2
        );
      } catch (error) {
        document.getElementById("response").innerText = "Lỗi: " + error.message;
      }
    }
  </script>
</html>

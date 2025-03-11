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
    function formatText(text, wordsPerLine = 10) {
      const words = text.split(/\s+/); // Tách thành mảng các từ
      let formattedText = words.reduce((acc, word, index) => {
        if (index % wordsPerLine === 0 && index !== 0) {
          acc += "<br>"; // Xuống dòng sau mỗi 10 từ
        }
        acc += (index % wordsPerLine === 0 ? "" : " ") + word;
        return acc;
      }, "");

      return formattedText;
    }
    async function fetchGeminiResponse() {
      // Lấy nội dung từ ô input
      let userText = document.getElementById("userInput").value.trim();
      if (!userText) {
        alert("Vui lòng nhập câu hỏi!");
        return;
      }

      // Thêm phần text yêu cầu
      let fullText = userText + " Viết thành 1 đoạn văn, 15 từ trên 1 dòng.";

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
        const formattedData = formatText(data, 10);
        document.getElementById("response").innerHTML = formattedData;
      } catch (error) {
        document.getElementById("response").innerHTML = "Lỗi: " + error.message;
      }
    }
  </script>
</html>

<!DOCTYPE html>
<html>
  <head>
    <title>Gọi API Gemini từ JSP</title>
  </head>
  <body>
    <h2>Kết quả từ API Gemini</h2>
    <button onclick="fetchGeminiResponse()">Gọi API</button>
    <pre id="response"></pre>
  </body>
  <script>
    async function fetchGeminiResponse() {
      const requestBody = {
        contents: [
          {
            parts: [
              {
                text: "Tôi là phụ nữ có thai, tôi nên bổ sung những thực phẩm dinh dưỡng nào để tốt cho sức khỏe của mẹ và bé. Viết thành 1 đoạn văn, không có ký tự đặc biệt",
              },
            ],
          },
        ],
      };

      const response = await fetch("/gemini-proxy", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify(requestBody),
      });

      const data = await response.json();
      console.log(data);
      document.getElementById("response").innerText = JSON.stringify(
        data,
        null,
        2
      );
    }
  </script>
</html>

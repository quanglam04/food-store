<%@page contentType="text/html" pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Chat-bot AI</title>
    <style>
      body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
      }

      .chat-button {
        position: fixed;
        bottom: 20px;
        right: 20px;
        width: 60px;
        height: 60px;
        background-color: #0078ff;
        border-radius: 50%;
        display: flex;
        justify-content: center;
        align-items: center;
        cursor: pointer;
        color: white;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
        z-index: 1000;
      }

      .chat-icon {
        font-size: 24px;
      }

      .chat-container {
        position: fixed;
        bottom: 20px;
        right: 20px;
        width: 350px;
        height: 500px;
        border-radius: 15px;
        background-color: white;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        display: flex;
        flex-direction: column;
        overflow: hidden;
        z-index: 1000;
        display: none;
      }

      .chat-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 15px;
        background-color: white;
        border-bottom: 1px solid #eaeaea;
      }

      .chat-title {
        display: flex;
        align-items: center;
        font-weight: bold;
        font-size: 18px;
      }

      .chat-title img {
        width: 30px;
        height: 30px;
        margin-right: 10px;
      }

      .close-chat {
        cursor: pointer;
        font-size: 24px;
        color: #333;
      }

      .chat-box {
        flex: 1;
        overflow-y: auto;
        padding: 15px;
        background-color: #f5f5f5;
      }

      .message {
        margin-bottom: 15px;
        max-width: 80%;
        padding: 10px 15px;
        border-radius: 18px;
        position: relative;
        clear: both;
        line-height: 1.4;
      }

      .user-message {
    font-weight: bold;
    background-color: #F1F302;
    float: right;
    border-bottom-right-radius: 5px;
}

      .bot-message {
        background-color: #0078ff;
        color: white;
        float: right;
        border-bottom-left-radius: 5px;
      }

      .user-avatar {
        width: 30px;
        height: 30px;
        border-radius: 50%;
        position: absolute;
        right: -40px;
        bottom: 0;
      }

      .bot-avatar {
    width: 38px;
    height: 37px;
    border-radius: 50%;
    background-color: #0078ff;
    color: white;
    display: flex;
    justify-content: center;
    align-items: center;
    position: absolute;
    left: -57px;
    bottom: 0;
}

      .answered-by {
        text-align: center;
        font-size: 12px;
        color: #666;
        margin-top: 5px;
        clear: both;
        padding-top: 40px;
      }

      .chat-input-container {
        display: flex;
        align-items: center;
        padding: 10px 15px;
        background-color: white;
        border-top: 1px solid #eaeaea;
      }

      .chat-input {
        flex: 1;
        padding: 10px 15px;
        border: 1px solid #ddd;
        border-radius: 20px;
        outline: none;
        font-size: 14px;
      }

      .chat-send {
        margin-left: 10px;
        padding: 10px 20px;
        background-color: #0078ff;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 14px;
      }

      .chat-collapsed {
        position: fixed;
        bottom: 0;
        right: 0;
        width: 125px;
        height: 100vh;
        background-color: #0078ff;
        color: white;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: space-between;
        padding: 15px 0;
        box-shadow: -2px 0 10px rgba(0, 0, 0, 0.1);
        z-index: 999;
        display: none;
      }

      .chat-collapsed-header {
        width: 100%;
        text-align: center;
        padding: 10px 0;
        font-weight: bold;
        display: flex;
        flex-direction: column;
        align-items: center;
      }

      .chat-collapsed-header span {
        margin-top: 5px;
      }

      .close-collapsed {
        font-size: 20px;
        cursor: pointer;
      }

      @media (max-width: 600px) {
        .chat-container {
          width: 100%;
          height: 100%;
          bottom: 0;
          right: 0;
          border-radius: 0;
        }
      }
    </style>
  </head>
  <body>
    <div class="chat-button" id="chatButton" onclick="openChat()">
      <div class="chat-icon">💬</div>
    </div>

    <div class="chat-container" id="chatContainer">
      <div class="chat-header">
        <div class="chat-title">
          <img
            src="https://img.freepik.com/free-vector/chatbot-chat-message-vectorart_78370-4104.jpg"
            alt="AI Icon"
          />
          AI ChatBot
        </div>
        <div class="close-chat" onclick="toggleChatView('button')">&times;</div>
      </div>

      <div class="chat-box" id="chatBox">
        <!-- Phần tin nhắn sẽ được thêm động vào đây -->
      </div>

      <div class="chat-input-container">
        <input
          type="text"
          class="chat-input"
          id="userInput"
          placeholder="Nhập câu hỏi..."
          onkeypress="handleKeyPress(event)"
        />
        <button class="chat-send" onclick="sendMessage()">Gửi</button>
      </div>
    </div>

    <!-- trò chuyện thu gọn chế độ xem ( thanh lướt ) -->
    <div class="chat-collapsed" id="chatCollapsed">
      <div class="chat-collapsed-header">
        Chat-<br />bot AI
        <span class="close-collapsed" onclick="toggleChatView('none')">×</span>
      </div>

      <div class="chat-input-container" style="width: 90%; padding: 5px">
        <input
          type="text"
          class="chat-input"
          id="collapsedInput"
          placeholder="Nhập câu hỏi..."
          style="padding: 8px; width: 100%"
        />
        <button
          class="chat-send"
          onclick="sendCollapsedMessage()"
          style="margin-top: 5px; width: 100%"
        >
          Gửi
        </button>
      </div>
    </div>

    <script>
      // chuyển đổi giữa các chế độ
      function toggleChatView(view) {
        const chatButton = document.getElementById("chatButton");
        const chatContainer = document.getElementById("chatContainer");
        const chatCollapsed = document.getElementById("chatCollapsed");

        // ấn các phần tử
        chatButton.style.display = "none";
        chatContainer.style.display = "none";
        chatCollapsed.style.display = "none";

        // hiển thị chế độ xem được yêu cầu
        if (view === "button") {
          chatButton.style.display = "flex";
        } else if (view === "expanded") {
          chatContainer.style.display = "flex";
        } else if (view === "collapsed") {
          chatCollapsed.style.display = "flex";
        }
      }

      // mở cửa sổ trò chuyện khi nhấn vào nút
      function openChat() {
        toggleChatView("expanded");
        // thêm tin nhắn chào mừng nếu cuộc trò chuyện đang trống
        if (document.getElementById("chatBox").innerHTML === "") {
          addBotMessage("Chào bạn! Tôi có thể giúp gì cho bạn hôm nay?");
        }
      }

      // thêm tin nhắn của người dùng vào cuộc trò chuyện
        function addUserMessage(message) {
          const chatBox = document.getElementById("chatBox");
          const messageDiv = document.createElement("div");
          messageDiv.className = "message user-message";
          messageDiv.innerHTML = message;

          // Optional: thêm avatar người dùng
          const avatar = document.createElement("div");
          avatar.className = "user-avatar";
          avatar.style.backgroundImage = "url('https://cdn-icons-png.flaticon.com/512/6596/6596121.png')";
          messageDiv.appendChild(avatar);

          chatBox.appendChild(messageDiv);
          chatBox.scrollTop = chatBox.scrollHeight;
        }

      // thêm tin nhắn bot vào cuộc trò chuyện
      function addBotMessage(message) {
        const chatBox = document.getElementById("chatBox");
        const messageDiv = document.createElement("div");
        messageDiv.className = "message bot-message";
        messageDiv.innerHTML = message;

        const avatar = document.createElement("div");
        avatar.className = "bot-avatar";
        avatar.innerHTML = "AI";
        messageDiv.appendChild(avatar);

        chatBox.appendChild(messageDiv);

        // thêm đoạn text: trả lời bởi FoodStore-AI
        const answeredBy = document.createElement("div");
        answeredBy.className = "answered-by";
        answeredBy.innerHTML = "Answered by FoodStore-AI";
        chatBox.appendChild(answeredBy);

        chatBox.scrollTop = chatBox.scrollHeight;
      }

      // xử lý và call API với input người dùng nhập vào
      function sendMessage() {
        const userInput = document.getElementById("userInput");
        const message = userInput.value.trim();
        const messageCallAPI =
          message +
          ".Vui lòng viết thành đoạn văn và không chứa ký tự đặc biệt.";
        if (message === "") return;

        addUserMessage(message);
        userInput.value = "";

        // hiển thị hiệu ứng đang nhập
        const typingIndicator = document.createElement("div");
        typingIndicator.className = "message bot-message";
        typingIndicator.id = "typingIndicator";
        typingIndicator.innerHTML = "Đang nhập...";
        document.getElementById("chatBox").appendChild(typingIndicator);

        // gọi API của gemini để lấy kết quả trả về
        fetchGeminiResponse(messageCallAPI);
      }

      // gửi tin nhắn từ chế độ xem trò chuyện đã thu gọn
      function sendCollapsedMessage() {
        const collapsedInput = document.getElementById("collapsedInput");
        const message = collapsedInput.value.trim();

        if (message === "") return;

        collapsedInput.value = "";
        toggleChatView("expanded");

        // thêm tin nhắn rồi gửi
        document.getElementById("userInput").value = message;
        sendMessage();
      }

      // xử lý nếu người dùng bấm enter thay vì gửi
      function handleKeyPress(event) {
        if (event.key === "Enter") {
          sendMessage();
        }
      }

      // lấy Data từ API của gemini
      async function fetchGeminiResponse(userText) {
        try {
          const requestBody = {
            contents: [{ parts: [{ text: userText }] }],
          };

          const response = await fetch("/gemini-proxy", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify(requestBody),
          });

          // xóa thông báo đang nhập
          const typingIndicator = document.getElementById("typingIndicator");
          if (typingIndicator) {
            typingIndicator.remove();
          }

          if (!response.ok) throw new Error("Lỗi kết nối API");

          const data = await response.text();
          addBotMessage(data);
        } catch (error) {
          // xóa thông báo đang nhập
          const typingIndicator = document.getElementById("typingIndicator");
          if (typingIndicator) {
            typingIndicator.remove();
          }

          addBotMessage("Lỗi: " + error.message);
        }
      }

      // khởi tạo trò chuyện bằng chế độ xem nút
      document.addEventListener("DOMContentLoaded", function () {
        toggleChatView("button");
      });
    </script>
  </body>
</html>

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

      /* Chat button styles */
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

      /* Chat window styles */
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

      /* Header styles */
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

      /* Message area styles */
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
        background-color: #f1f1f1;
        float: right;
        border-bottom-right-radius: 5px;
      }

      .bot-message {
        background-color: #0078ff;
        color: white;
        float: left;
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
        width: 30px;
        height: 30px;
        border-radius: 50%;
        background-color: #0078ff;
        color: white;
        display: flex;
        justify-content: center;
        align-items: center;
        position: absolute;
        left: -40px;
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

      /* Input area styles */
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

      /* Collapsed version styles */
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
    <!-- Chat Button -->
    <div class="chat-button" id="chatButton" onclick="openChat()">
      <div class="chat-icon">💬</div>
    </div>

    <!-- Chat Container (Expanded) -->
    <div class="chat-container" id="chatContainer">
      <div class="chat-header">
        <div class="chat-title">
          <img
            src="https://via.placeholder.com/30/0078FF/FFFFFF?text=AI"
            alt="AI Icon"
          />
          AI ChatBot
        </div>
        <div class="close-chat" onclick="toggleChatView('button')">&times;</div>
      </div>

      <div class="chat-box" id="chatBox">
        <!-- Messages will be added here dynamically -->
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

    <!-- Chat Collapsed View (Side Bar) -->
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
      // Toggle between different chat views: 'expanded', 'collapsed', 'button', 'none'
      function toggleChatView(view) {
        const chatButton = document.getElementById("chatButton");
        const chatContainer = document.getElementById("chatContainer");
        const chatCollapsed = document.getElementById("chatCollapsed");

        // Hide all elements first
        chatButton.style.display = "none";
        chatContainer.style.display = "none";
        chatCollapsed.style.display = "none";

        // Show the requested view
        if (view === "button") {
          chatButton.style.display = "flex";
        } else if (view === "expanded") {
          chatContainer.style.display = "flex";
        } else if (view === "collapsed") {
          chatCollapsed.style.display = "flex";
        }
      }

      // Open the chat window when button is clicked
      function openChat() {
        toggleChatView("expanded");
        // Add a welcome message if the chat is empty
        if (document.getElementById("chatBox").innerHTML === "") {
          addBotMessage("Chào bạn! Tôi có thể giúp gì cho bạn hôm nay?");
        }
      }

      // Add a user message to the chat
      function addUserMessage(message) {
        const chatBox = document.getElementById("chatBox");
        const messageDiv = document.createElement("div");
        messageDiv.className = "message user-message";
        messageDiv.innerHTML = message;

        // Optional: Add user avatar
        // const avatar = document.createElement("div");
        // avatar.className = "user-avatar";
        // avatar.style.backgroundImage = "url('user-avatar.jpg')";
        // messageDiv.appendChild(avatar);

        chatBox.appendChild(messageDiv);
        chatBox.scrollTop = chatBox.scrollHeight;
      }

      // Add a bot message to the chat
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

        // Add "Answered by AI" text
        const answeredBy = document.createElement("div");
        answeredBy.className = "answered-by";
        answeredBy.innerHTML = "Answered by AI";
        chatBox.appendChild(answeredBy);

        chatBox.scrollTop = chatBox.scrollHeight;
      }

      // Process and send user message
      function sendMessage() {
        const userInput = document.getElementById("userInput");
        const message = userInput.value.trim();

        if (message === "") return;

        addUserMessage(message);
        userInput.value = "";

        // Show typing indicator
        const typingIndicator = document.createElement("div");
        typingIndicator.className = "message bot-message";
        typingIndicator.id = "typingIndicator";
        typingIndicator.innerHTML = "Đang nhập...";
        document.getElementById("chatBox").appendChild(typingIndicator);

        // Call API to get response
        fetchGeminiResponse(message);
      }

      // Send message from collapsed chat view
      function sendCollapsedMessage() {
        const collapsedInput = document.getElementById("collapsedInput");
        const message = collapsedInput.value.trim();

        if (message === "") return;

        collapsedInput.value = "";
        toggleChatView("expanded");

        // Add the message to the expanded chat and send it
        document.getElementById("userInput").value = message;
        sendMessage();
      }

      // Handle enter key press in the input field
      function handleKeyPress(event) {
        if (event.key === "Enter") {
          sendMessage();
        }
      }

      // Fetch response from Gemini API
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

          // Remove typing indicator
          const typingIndicator = document.getElementById("typingIndicator");
          if (typingIndicator) {
            typingIndicator.remove();
          }

          if (!response.ok) throw new Error("Lỗi kết nối API");

          const data = await response.text();
          addBotMessage(data);
        } catch (error) {
          // Remove typing indicator
          const typingIndicator = document.getElementById("typingIndicator");
          if (typingIndicator) {
            typingIndicator.remove();
          }

          addBotMessage("Lỗi: " + error.message);
        }
      }

      // Initialize the chat with the button view
      document.addEventListener("DOMContentLoaded", function () {
        toggleChatView("button");
      });
    </script>
  </body>
</html>

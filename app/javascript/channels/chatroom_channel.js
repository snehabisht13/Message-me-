import consumer from "channels/consumer"

consumer.subscriptions.create("ChatroomChannel", {
  connected() {
    console.log("Connected to chatroom channel!");
  },

  disconnected() {
    console.log("Disconnected from chatroom channel!");
  },

  received(data) {
    console.log("Received data:", data);

    if (window.jQuery && $("#messages-container").length === 0) {
      console.error("Messages container not found");
      return;
    }

    if (data.message) {
      const messageElement = $("<div>").addClass("message").text(data.message);
      $("#messages-container").append(messageElement);
    } else {
      console.error("Message not found in data:", data);
    }
  }

});
    console.error("Message not found in data:", data);


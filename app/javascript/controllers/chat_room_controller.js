import { Controller } from "@hotwired/stimulus";
import createChatRoomChannel from "channels/chat_room_channel";

export default class extends Controller {
  static targets = ["chatMessage", "receivedChatMessages"];

  connected() {
    console.log("stimulus connected callback");
  }

  disconnected() {
    console.log("stimulus disconnected callback");
  }

  received(data) {
    // console.log("stimulus received callback", data);
    const appendMessage = document.createElement("p");
    appendMessage.textContent = `${data.from} says: ${data.message}`;
    this.receivedChatMessagesTarget.insertAdjacentElement(
      "beforeend",
      appendMessage
    );

    console.log(
      "receivedChatMessagesTarget.children.length",
      this.receivedChatMessagesTarget.children.length
    );
    while (this.receivedChatMessagesTarget.children.length > 7) {
      this.receivedChatMessagesTarget.children[1].remove();
    }
  }

  connect() {
    // this.element.textContent = "Hello World!";
    // console.log("Hello, Stimulus!", this.element);
    console.log("Hello, Stimulus!");
    this.channel = createChatRoomChannel({
      connected: this.connected.bind(this),
      disconnected: this.disconnected.bind(this),
      received: this.received.bind(this),
    });

    this.personalChannel = createChatRoomChannel({
      payload: { personal: true },
      connected: this.connected.bind(this),
      disconnected: this.disconnected.bind(this),
      received: this.received.bind(this),
    });
    // console.log("channel", this.channel);
  }

  disconnect() {
    // console.log("Goodbye, Stimulus!", this.element);
    console.log("Goodbye, Stimulus!");
    this.channel.unsubscribe();
  }

  sendMessage() {
    const message = this.chatMessageTarget.value;
    if (message === null || String(message).trim() === "") {
      // console.warn("Message is empty");
      return;
    }
    this.chatMessageTarget.value = "";
    this.channel.send({ message });
    // console.log(`Sending message: ${message}`);
    // const appendMessage = document.createElement("p");
    // appendMessage.textContent = message;
    // this.receivedChatMessagesTarget.insertAdjacentElement(
    //   "beforeend",
    //   appendMessage
    // );

    // while (this.receivedChatMessagesTarget.children.length > 7) {
    //   this.receivedChatMessagesTarget.children[1].remove();
    // }
  }
}

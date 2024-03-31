import consumer from "channels/consumer";

export default ({ connected, disconnected, received, payload = {} }) => {
  console.warn(payload);
  return consumer.subscriptions.create(
    { channel: "ChatRoomChannel", ...payload },
    {
      connected() {
        if (!connected) return console.error("connected callback is required");

        // console.warn("channel says: connected to chat room channel");
        connected();
      },

      disconnected() {
        if (!disconnected)
          return console.error("disconnected callback is required");

        console.warn("channel says: disconnected from chat room channel");
        disconnected();
      },

      received(data) {
        if (!received) return console.error("received callback is required");

        // console.log(data);
        received(data);
      },
    }
  );
};

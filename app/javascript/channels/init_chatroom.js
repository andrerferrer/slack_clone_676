import consumer from "./consumer";

// create a fucntion
const initChatroom = () => {
  // find an element in the DOM
  const messagesContainer = document.getElementById('messages');
  // run the code only if that element is there
  if (messagesContainer) {
    const id = messagesContainer.dataset.chatroomId;
    console.log(`We are connected to the Channel for Chatroom ${id}`);

    consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
      received(data) {
        // console.log(data); // called when data is broadcast in the cable
        messagesContainer.insertAdjacentHTML('beforeend', data)
      },
    });
  }

};
// export a function
export { initChatroom }

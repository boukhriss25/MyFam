function scrollLastMessageIntoView() {
  const messages = document.querySelectorAll('.my-message');
  const lastMessage = messages[messages.length - 1];

  if (lastMessage !== undefined) {
    lastMessage.scrollIntoView();
  }
}

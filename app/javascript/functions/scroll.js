function scrollLastMessageIntoView() {
  const container = document.querySelector(".container-messages")
  if (container)
  {
    container.scrollTop = container.scrollHeight;
    container.addEventListener("DOMSubtreeModified", () => {
      container.scrollTop = container.scrollHeight;
    })
  }
}

export {scrollLastMessageIntoView}

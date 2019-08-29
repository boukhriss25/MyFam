
const initButtonDisable = () => {
    const form = document.querySelector('.send-media-form-real-thistime')
    if ( form )
    {
      const selectInput = form.querySelector('#message_conversation_id')
      const submitBtn = document.querySelector('.submit-btn')
      submitBtn.disabled = true
      selectInput.addEventListener("change", () => {
        submitBtn.disabled = selectInput.value == "" ? true : false
      })
    }
}

export { initButtonDisable }

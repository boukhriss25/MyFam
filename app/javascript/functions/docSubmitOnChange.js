
const submitOnChange = () => {
  const docUpload = document.querySelector("#upload_document_js")
  if (docUpload) {
    const input = document.querySelector("#document_content")
    docUpload.addEventListener("click", () => {
      input.click();
    });
    input.onchange = function() {
      document.getElementById("new_document").submit();
    };
  }
}

export { submitOnChange }

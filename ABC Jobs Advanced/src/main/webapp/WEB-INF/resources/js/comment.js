/**
 * Comment validator
 */
 
 
const comment = document.getElementById("comment");

function checkValidation() {
  const inputComment = comment.value.trim();

  if (inputComment === null || inputComment === "") {
    document.querySelector(".error").style.display = "block";
    comment.classList.add("error-border");
    return false;
  } else {
    document.querySelector(".error").style.display = "none";
    comment.classList.remove("error-border");
  }

  return true;
}
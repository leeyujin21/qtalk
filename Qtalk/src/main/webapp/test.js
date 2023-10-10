const crtBtn = document.querySelector(".category-btn");
const crtCon = document.querySelector(".category-box-container");


function displayHidden(){
    crtCon.classList.toggle("hidden");
};


crtBtn.addEventListener("click",displayHidden);
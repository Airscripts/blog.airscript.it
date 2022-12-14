console.log("Attaching events to menu...");

let efMenu = document.querySelector(".menu");
let efTrigger = document.querySelector("#menu-trigger");

efTrigger.addEventListener("click", function () {
  efMenu.classList.toggle("hidden");
});

document.body.addEventListener('click', function (event) {
  if (!efTrigger.contains(event.target)) {
    efMenu.classList.add("hidden");
  }
});

console.log("Events attached!");
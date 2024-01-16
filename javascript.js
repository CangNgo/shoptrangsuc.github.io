var times = document.querySelectorAll(".user__time");
var t = new Date();
for (let i = 0; i < times.length; i++) {
  times[i].innerHTML = t.getHours() + ":" + t.getMinutes();
}

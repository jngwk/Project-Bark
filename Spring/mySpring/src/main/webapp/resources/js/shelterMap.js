window.onload = function () {
  // 검색 필터
  let nametab = document.querySelector(".shelter-name");
  let namelist = document.querySelector(".name-search");
  let areatab = document.querySelector(".shelter-area");
  let arealist = document.querySelector(".area-search");

  nametab.onclick = nameSearch;
  areatab.onclick = areaSearch;

  function nameSearch() {
    arealist.style.display = "none";
    namelist.style.display = "block";
  }
  function areaSearch() {
    namelist.style.display = "none";
    arealist.style.display = "block";
  }

  // 지역 필터
  let main = document.querySelector(".main-city");

  main.onchange = function () {
    let sub = document.querySelector(".sub-city");
    let mainOption = main.options[main.selectedIndex].innerText;

    const seoul = ["강남구", "강동구", "강북구", "강서구", "관악구"];
    const gyeonggi = ["가평시", "고양시", "과천시", "광명시", "광주시"];

    let subOption = "";
    if (main.value == "seoul") {
      subOption = seoul;
    } else if (main.value == "gyeonggi") {
      subOption = gyeonggi;
    }

    sub.options.length = 1;

    for (let i = 0; i < subOption.length; i++) {
      const opt = document.createElement("option");
      opt.innerHTML = subOption[i];
      sub.appendChild(opt);
    }
  };

  //보호소 정보
  let listContainer = document.querySelector(".shelter-ul");
  let shelterLists = listContainer.querySelectorAll("li");
  console.log(listContainer);
  console.log(shelterLists);
  shelterLists.forEach((list) => {
    list.onclick = function () {
    if(!list.classList.contains("liExpand")){
    	shelterLists.forEach((el) => {
    		el.classList.remove("liExpand");
    	});
    	list.classList.toggle("liExpand");
    }
    else{
      list.classList.toggle("liExpand");
    }};
  });
};


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

    const seoul = ["강남구", "강동구", "강북구", "강서구", "관악구", "광진구", "구로구", "금천구", "노원구", "도봉구", "동대문구", "동작구", "마포구", "서대문구", "서초구", "성동구", "성북구", "송파구", "양천구", "영등포구", "용산구", "은평구", "종로구", "중구", "중랑구"];
	const gyeonggi = ["가평군","고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","양평군","여주시","연천군","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시"];

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
      opt.value=subOption[i];
      sub.appendChild(opt);
      console.log(opt.value);
    }
  };
	
	
	//보호소 조회 메뉴 탭
$(".shelter-name").on("click", function () {
	$(this).removeClass('notselect');
  	$(".shelter-area").removeClass('select');
	$(this).addClass('select');
  	$(".shelter-area").addClass('notselect');
  	
});

$(".shelter-area").on("click", function () {
	$(this).removeClass('notselect');
  	$(".shelter-name").removeClass('select');
	$(this).addClass('select');
  	$(".shelter-name").addClass('notselect');
});


};


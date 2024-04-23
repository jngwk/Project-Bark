$(".expand-btn").on("click", () => {
  $(".adoption-form").toggleClass("show");
  if ($(".adoption-form").hasClass("show")) {
    $(".adoption-form").one("transitionend", function () {
      $("html, body").animate(
        {
          scrollTop: $(".form-container").offset().top,
        },
        1000
      );
    });
  }
});

$(".fold-btn").on("click", () => {
  $(".adoption-form").removeClass("show");
});

$("#consent").on("change", function () {
  if ($("#consent").is(":checked")) {
    $(".consent-msg").hide();
  }
  $(".submit-adoption-form").toggleClass("inactive secondary-btn brown-btn");
});

$(".submit-adoption-form").on("click", function (e) {
  if ($(".submit-adoption-form").hasClass("inactive")) {
    e.preventDefault();
    $(".consent-msg").css("display", "block");
    
  }
});

window.onload = function(){
    $(document).ready(function () {
      $("#price").change(function () {
        var val = $(this).val();
        if (val.replace(/[0-9]/g, "").length > 0) {
          return $(this).val("");
        }

        if (val < 1000) {
          alert("1000원 이상 후원 가능합니다.");
          return $(this).val("");
        }
      });
    });
}
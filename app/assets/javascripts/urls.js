$(document).ready(function(){
  toggleDiv("#show-created-at",
                  "#created-at",
                  "#popular",
                  "#show-popular");
  toggleDiv("#show-popular",
                "#popular",
                "#created-at",
                "#show-created-at");

  // ("#search").keyup(function() {
    // var search = $(this).val();
    // $("td").show();
    // if (search) $("td").not(":contains("+ term +")").hide();
  // });




  function toggleDiv(buttonID, divID, divID2, buttonID2){
    $(buttonID).on("click", function(){
      $(divID2).addClass("hidden");
      $(divID).removeClass("hidden");
      $(buttonID).addClass("colorize");
      $(buttonID2).removeClass("colorize");
    });
  }
});

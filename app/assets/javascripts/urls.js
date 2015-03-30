$(document).ready(function(){
  toggleCreatedAt("#show-created-at",
                  "#created-at",
                  "#popular",
                  "#show-popular");
  togglePopular("#show-popular",
                "#popular",
                "#created-at",
                "#show-created-at");

  function toggleCreatedAt(buttonID, divID, divID2, buttonID2){
    $(buttonID).on("click", function(){
      $(divID2).addClass("hidden");
      $(divID).removeClass("hidden");
      $(buttonID).addClass("colorize");
      $(buttonID2).removeClass("colorize");
    });
  }

  function togglePopular(buttonID, divID, divID2, buttonID2){
    $(buttonID).on("click", function(){
      $(divID2).addClass("hidden");
      $(divID).removeClass("hidden");
      $(buttonID).addClass("colorize");
      $(buttonID2).removeClass("colorize");
    });
  }
});

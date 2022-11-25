function TurnDaihatsu(LinkUrl) {
    
    var Res = LinkUrl.split("?");

    if (Res[1] === "Reg=1") {
        $(document).ready(function () {
            $("#dNational").hide(500);
            $("#dRegional1").show(500);
            $("#btnNation").show();
            $("#btnRegion1").hide();
        });
    }
    else if (Res[1] === "Reg=0") {
        $(document).ready(function () {
            $("#dRegional1").hide(500);
            $("#dNational").show(500);
            $("#btnNation").hide();
            $("#btnRegion1").show();
        });
    }
}
function TurnToyota(LinkUrl) {
    var Res = LinkUrl.split("?");

    if (Res[1] === "Reg=1") {
        $(document).ready(function () {
            $("#dNational").hide(0);
            $("#dRegional1").show(0);
            $("#dRegional2").hide(0);
            $("#btnNation").show();
            $("#btnRegion1").hide();
            $("#btnRegion2").show();
            $("#btnRegion3").hide();
        });
    }
    else if (Res[1] === "Reg=2") {
        $(document).ready(function () {
            $("#dNational").hide(0);
            $("#dRegional1").hide(0);
            $("#dRegional2").show(0);
            $("#btnNation").hide();
            $("#btnRegion1").hide();
            $("#btnRegion2").hide();
            $("#btnRegion3").show();
        });
    }
    else if (Res[1] === "Reg=0") {
        $(document).ready(function () {
            $("#dNational").show(0);
            $("#dRegional1").hide(0);
            $("#dRegional2").hide(0);
            $("#btnNation").hide();
            $("#btnRegion1").show();
            $("#btnRegion2").hide();
            $("#btnRegion3").hide();
        });
    }
}
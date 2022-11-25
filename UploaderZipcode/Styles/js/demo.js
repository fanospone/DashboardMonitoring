var sources = {
    secret: "Styles/img/mobil/secret.png",
    fsdtrs: "Styles/img/mobil/fsdtrs.png",
    hr: "Styles/img/mobil/hr.png",
    risk: "Styles/img/mobil/risk.png",
    fpacct: "Styles/img/mobil/fpacct.png",
    coo: "Styles/img/mobil/coo.png",
    mkt: "Styles/img/mobil/mkt.png",
    opr1: "Styles/img/mobil/opr1.png",
    oprf: "Styles/img/mobil/oprf.png",
    opr3: "Styles/img/mobil/opr3.png",
    opr2: "Styles/img/mobil/opr2.png",
    legal: "Styles/img/mobil/legal.png",
    itga: "Styles/img/mobil/itga.png",
    cpi: "Styles/img/mobil/cpi.png",
    audit: "Styles/img/mobil/audit.png",
    recovery: "Styles/img/mobil/recovery.png",
    naq: "Styles/img/mobil/naq.png",
    nar: "Styles/img/mobil/nar.png",
};
var peringkat = [
    { x: 870, y: 230, z: -0.20 },
    { x: 820, y: 240, z: -0.20 },
    { x: 770, y: 250, z: -0.20 },
    { x: 720, y: 260, z: -0.20 },
    { x: 670, y: 270, z: -0.20 },
    { x: 620, y: 280, z: -0.20 },
    { x: 570, y: 290, z: -0.20 },
    { x: 520, y: 300, z: -0.20 },
    { x: 470, y: 310, z: -0.20 },
    { x: 420, y: 315, z: -0.10 },
    { x: 370, y: 315, z: -0.05 },
    { x: 320, y: 317, z: -0.05 },
    { x: 270, y: 319, z: -0.05 },
    { x: 220, y: 321, z: -0.05 },
    { x: 170, y: 323, z: -0.05 },
    { x: 120, y: 325, z: -0.05 },
    { x: 70, y: 327, z: -0.05 },
    { x: 20, y: 329, z: -0.05 },
]
var bulan = {
    Jan: 1,
    Feb: 2,
    Mar: 3,
    Apr: 4,
    May: 5,
    Jun: 6,
    Jul: 7,
    Aug: 8,
    Sep: 9,
    Oct: 10,
    Nov: 11,
    Dec: 12
}
jQuery.extend(jQuery.fn.dataTableExt.oSort, {
    "date-id-pre": function (a) {
        var date = a.split(' ')[0];
        var ukDatea = date.split('/');
        return (ukDatea[2] + ukDatea[1] + ukDatea[0]) * 1;
    },

    "date-id-asc": function (a, b) {
        return ((a < b) ? -1 : ((a > b) ? 1 : 0));
    },

    "date-id-desc": function (a, b) {
        return ((a < b) ? 1 : ((a > b) ? -1 : 0));
    }
});
$(function () {
    skinChanger();
    activateNotificationAndTasksScroll();

    setSkinListHeightAndScroll();
    setSettingListHeightAndScroll();
    $(window).resize(function () {
        setSkinListHeightAndScroll();
        setSettingListHeightAndScroll();
    });
});

function loadImages(sources, callback) {
    var images = {};
    var loadedImages = 0;
    var numImages = 0;
    // get num of sources
    for (var src in sources) {
        numImages++;
    }
    for (var src in sources) {
        images[src] = new Image();
        images[src].onload = function () {
            if (++loadedImages >= numImages) {
                callback(images);
            }
        };
        images[src].src = sources[src];
    }
}

function dialog(title, message, type, url) {

    swal({
        title: title,
        text: message,
        html: true,
        type: type,
        showCancelButton: false,
        closeOnConfirm: false
    },
    function () {
        window.location.replace(url);
    });
}
function divisionChart2(divisionData) {
    var ctxd = document.getElementById("div_chart2").getContext("2d");
    new Chart(ctxd, {
        //plugins: [{
        //    afterDatasetsDraw: function (chart, easing) {
        //        var ctx = chart.ctx;

        //        chart.data.datasets.forEach(function (dataset, i) {
        //            var meta = chart.getDatasetMeta(i);
        //            if (!meta.hidden) {
        //                meta.data.forEach(function (element, index) {
        //                    ctx.fillStyle = 'rgba(0, 0, 0, 1)';

        //                    var fontSize = 12;
        //                    var fontStyle = 'normal';
        //                    var fontFamily = 'Helvetica Neue';
        //                    ctx.font = Chart.helpers.fontString(fontSize, fontStyle, fontFamily);

        //                    var dataString = dataset.data[index].toString();

        //                    ctx.textAlign = 'center';
        //                    ctx.textBaseline = 'middle';

        //                    var padding = 5;
        //                    var position = element.tooltipPosition();
        //                    ctx.fillText(dataString, position.x + (fontSize / 2) + padding, position.y);
        //                });
        //            }
        //        });
        //    }
        //}],
        type: 'horizontalBar',
        data: divisionData,
        options: {
            title: {
                display: true,
                text: 'KPI POINT YTD',
                padding: 20,
                fontSize: 20
            },
            legend: {
                display: false,
                position: 'bottom',
                fullWidth: true,
                labels: {
                    fontSize: 10
                }
            },
            tooltips: {
                mode: 'index',
                intersect: false
            },
            responsive: true,
            "scales": {
                "xAxes": [{
                    "ticks": {
                        "beginAtZero": true
                    }
                }]
            }
        }
    });
}

function divisionChart(divisionData) {
    var ctx = document.getElementById("div_chart").getContext("2d");
    new Chart(ctx, {
        plugins: [{
            afterDatasetsDraw: function (chart, easing) {
                var ctx = chart.ctx;

                chart.data.datasets.forEach(function (dataset, i) {
                    var meta = chart.getDatasetMeta(i);
                    if (!meta.hidden) {
                        meta.data.forEach(function (element, index) {
                            ctx.fillStyle = 'rgba(0, 0, 0, 1)';

                            var fontSize = 12;
                            var fontStyle = 'normal';
                            var fontFamily = 'Calibri';
                            ctx.font = Chart.helpers.fontString(fontSize, fontStyle, fontFamily);

                            var dataString = dataset.data[index].toString();

                            ctx.textAlign = 'center';
                            ctx.textBaseline = 'middle';

                            var padding = 5;
                            var position = element.tooltipPosition();
                            ctx.fillText(dataString, position.x, position.y - (fontSize / 3) - padding);
                        });
                    }
                });
            }
        }],
        type: 'bar',
        data: divisionData,
        options: {
            title: {
                display: true,
                text: 'KPI POINT MTD',
                padding: 20,
                fontSize: 20
            },
            legend: {
                display: true,
                position: 'bottom',
                fullWidth: true,
                labels: {
                    fontSize: 10
                }
            },
            tooltips: {
                mode: 'index',
                intersect: false
            },
            responsive: true,
            scales: {
                xAxes: [{
                    stacked: true,
                }],
                yAxes: [{
                    stacked: true
                }]
            }
        }
    });
}

function companyChart(lineChartData) {
    var ctx = document.getElementById("company_chart").getContext("2d");
    new Chart(ctx, {
        type: 'line',
        data: lineChartData,
        options: {
            legend: {
                display: true,
                position: 'bottom',
                fullWidth: true,
                labels: {
                    fontSize: 10
                }
            },
            tooltips: {
                mode: 'index',
                intersect: false
            },
            responsive: true,
        }
    });
}
function lobChart(barChartData) {
    var ctx = document.getElementById("bar_chart").getContext("2d");
    new Chart(ctx, {
        type: 'bar',
        data: barChartData,
        options: {
            legend: {
                display: true,
                position: 'bottom'
            },
            tooltips: {
                mode: 'index',
                intersect: false
            },
            responsive: true,
            scales: {
                xAxes: [{
                    stacked: true,
                }],
                yAxes: [{
                    stacked: true
                }]
            }
        }
    });
}
//Skin changer
function skinChanger() {
    $('.right-sidebar .demo-choose-skin li').on('click', function () {
        var $body = $('body');
        var $this = $(this);

        var existTheme = $('.right-sidebar .demo-choose-skin li.active').data('theme');
        $('.right-sidebar .demo-choose-skin li').removeClass('active');
        $body.removeClass('theme-' + existTheme);
        $this.addClass('active');

        $body.addClass('theme-' + $this.data('theme'));
    });
}

//Skin tab content set height and show scroll
function setSkinListHeightAndScroll() {
    var height = $(window).height() - ($('.navbar').innerHeight() + $('.right-sidebar .nav-tabs').outerHeight());
    var $el = $('.demo-choose-skin');

    $el.slimScroll({ destroy: true }).height('auto');
    $el.parent().find('.slimScrollBar, .slimScrollRail').remove();

    $el.slimscroll({
        height: height + 'px',
        color: 'rgba(0,0,0,0.5)',
        size: '4px',
        alwaysVisible: false,
        borderRadius: '0',
        railBorderRadius: '0'
    });
}

//Setting tab content set height and show scroll
function setSettingListHeightAndScroll() {
    var height = $(window).height() - ($('.navbar').innerHeight() + $('.right-sidebar .nav-tabs').outerHeight());
    var $el = $('.right-sidebar .demo-settings');

    $el.slimScroll({ destroy: true }).height('auto');
    $el.parent().find('.slimScrollBar, .slimScrollRail').remove();

    $el.slimscroll({
        height: height + 'px',
        color: 'rgba(0,0,0,0.5)',
        size: '4px',
        alwaysVisible: false,
        borderRadius: '0',
        railBorderRadius: '0'
    });
}

//Activate notification and task dropdown on top right menu
function activateNotificationAndTasksScroll() {
    $('.navbar-right .dropdown-menu .body .menu').slimscroll({
        height: '254px',
        color: 'rgba(0,0,0,0.5)',
        size: '4px',
        alwaysVisible: false,
        borderRadius: '0',
        railBorderRadius: '0'
    });
}

//Google Analiytics ======================================================================================
//addLoadEvent(loadTracking);
//var trackingId = 'UA-30038099-6';

//function addLoadEvent(func) {
//    var oldonload = window.onload;
//    if (typeof window.onload != 'function') {
//        window.onload = func;
//    } else {
//        window.onload = function () {
//            oldonload();
//            func();
//        }
//    }
//}

//function loadTracking() {
//    (function (i, s, o, g, r, a, m) {
//        i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
//            (i[r].q = i[r].q || []).push(arguments)
//        }, i[r].l = 1 * new Date(); a = s.createElement(o),
//        m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
//    })(window, document, 'script', 'https://www.google-analytics.com/analytics.js', 'ga');

//    ga('create', trackingId, 'auto');
//    ga('send', 'pageview');
//}
//========================================================================================================
$(function() {

//    Morris.Area({
//        element: 'morris-area-chart',
//        data: [{
//            period: '2010 Q1',
//            iphone: 2666,
//            ipad: null,
//            itouch: 2647
//        }, {
//            period: '2010 Q2',
//            iphone: 2778,
//            ipad: 2294,
//            itouch: 2441
//        }, {
//            period: '2010 Q3',
//            iphone: 4912,
//            ipad: 1969,
//            itouch: 2501
//        }, {
//            period: '2010 Q4',
//            iphone: 3767,
//            ipad: 3597,
//            itouch: 5689
//        }, {
//            period: '2011 Q1',
//            iphone: 6810,
//            ipad: 1914,
//            itouch: 2293
//        }, {
//            period: '2011 Q2',
//            iphone: 5670,
//            ipad: 4293,
//            itouch: 1881
//        }, {
//            period: '2011 Q3',
//            iphone: 4820,
//            ipad: 3795,
//            itouch: 1588
//        }, {
//            period: '2011 Q4',
//            iphone: 15073,
//            ipad: 5967,
//            itouch: 5175
//        }, {
//            period: '2012 Q1',
//            iphone: 10687,
//            ipad: 4460,
//            itouch: 2028
//        }, {
//            period: '2012 Q2',
//            iphone: 8432,
//            ipad: 5713,
//            itouch: 1791
//        }],
//        xkey: 'period',
//        ykeys: ['iphone', 'ipad', 'itouch'],
//        labels: ['iPhone', 'iPad', 'iPod Touch'],
//        pointSize: 2,
//        hideHover: 'auto',
//        resize: true
//    });

//    Morris.Donut({
//        element: 'morris-donut-chart',
//        data: [{
//            label: "Download Sales",
//            value: 12
//        }, {
//            label: "In-Store Sales",
//            value: 30
//        }, {
//            label: "Mail-Order Sales",
//            value: 20
//        }],
//        resize: true
//    });

    Morris.Bar({
        element: 'main-chart-container',
        data: [{
            y: 'April',
            a: 4242100,
            b: 245290
        }, {
            y: 'May',
            a: 452475,
            b: 454265
        }, {
            y: 'June',
            a: 4525450,
            b: 242440
        }, {
            y: 'July',
            a: 245575,
            b: 2422465
        }, {
            y: 'August',
            a: 4201250,
            b: 1042210
        }, {
            y: 'September',
            a: 775275,
            b: 1216255
        }, {
            y: 'October',
            a: 7452100,
            b: 1524790
        }, {
            y: 'November',
            a: 12452475,
            b: 12452455
        }, {
            y: 'December',
            a: 2105000,
            b: 9145220
        }, {
            y: 'January',
            a: 7414500,
            b: 14452790
        }, {
            y: 'February',
            a: 1542475,
            b: 1245345
        }, {
            y: 'March',
            a: 2145000,
            b: 9120235
        }],
        xkey: 'y',
        ykeys: ['a', 'b'],
        labels: ['Year 2014', 'Year 2015'],
        hideHover: 'auto',
        resize: true
    });

});

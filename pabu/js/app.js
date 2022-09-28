// Dom7
var $ = Dom7;

// Theme
var theme = 'auto';
if (document.location.search.indexOf('theme=') >= 0) {
  theme = document.location.search.split('theme=')[1].split('&')[0];
}

// Init App
var app = new Framework7({
  id: 'io.framework7.testapp',
  root: '#app',
  theme: theme,
  data: function () {
    return {
      user: {
        firstName: 'John',
        lastName: 'Doe',
      },
    };
  },
  methods: {
    helloWorld: function () {
      app.dialog.alert('Hello World!');
    },
  },
  routes: routes,
  popup: {
    closeOnEscape: true,
  },
  sheet: {
    closeOnEscape: true,
  },
  popover: {
    closeOnEscape: true,
  },
  actions: {
    closeOnEscape: true,
  },
  vi: {
    placementId: 'pltd4o7ibb9rc653x14',
  },
  view: {
    stackPages: true,
    pushState: true,
  },
});

var pathweb = "http://localhost/apipondok/";

var simpan = pathweb + "Pabu/simpanuser";



var sql;

function tgl_in(tgl_en){
    var hari  = ['Minggu','Senin','Selasa','Rabu','Kamis','Jumat','Sabtu'];
    var bulan = ['Januari','Februari','Maret','April','Mei','Juni','Juli','Agustus','September','Oktober','November','Desember'];
    var tglct = new Date(tgl_en);
    return hari[tglct.getDay()] + ', ' + tglct.getDate() + ' ' + bulan[tglct.getMonth()] + ' ' + tglct.getFullYear();
}

function tgl_pendek(tgl_en){
    var bulan = ['Januari','Februari','Maret','April','Mei','Juni','Juli','Agustus','September','Oktober','November','Desember'];
    var tglct = new Date(tgl_en);
    return tglct.getDate() + ' ' + bulan[tglct.getMonth()] + ' ' + tglct.getFullYear();
}

function tgl_aja(tgl_en){
    var tglct = new Date(tgl_en);
    return tglct.getDate();
}

function bln_aja(tgl_en){
    var bulan = ['Jan','Feb','Mar','Apr','Mei','Jun','Jul','Aug','Sep','Okt','Nov','Des'];
    var tglct = new Date(tgl_en);
    return bulan[tglct.getMonth()];;
}
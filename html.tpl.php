<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
<!-- Built by the great vbbros! More info on vbbros.net or info@vbbros.net  -->
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>collinFontaine | Architectes</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-title" content="collinFontaine">
    <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
    <!-- build:css styles/vendor.css -->
    <!-- bower:css -->
    <link rel="stylesheet" href="sites/all/themes/angupal/app/bower_components/bootstrap/dist/css/bootstrap.css">
    <!-- endbower -->
    <!-- endbuild -->
    <!-- build:css({.tmp,app}) styles/main.css -->
    <link rel="stylesheet" href="sites/all/themes/angupal/app/styles/styles.css">
    <!-- endbuild -->
  </head>
  <body ng-app="myApp" class="initial-state">

    <!--[if lt IE 7]>
      <p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
    <![endif]-->

    <!-- Add your site or application content here -->
    <div class="">
      <ng-include src="'sites/all/themes/angupal/app/views/main.html'"></ng-include>
      </div>
    <!-- Google Analytics: change UA-XXXXX-X to be your site's ID -->
     <script>
       (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
       (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
       m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
       })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

       ga('create', 'UA-XXXXX-X');
       ga('send', 'pageview');
    </script>

    <!--[if lt IE 9]>
    <script src="/sites/all/themes/angupal/app/bower_components/es5-shim/es5-shim.js"></script>
    <script src="/sites/all/themes/angupal/app/bower_components/json3/lib/json3.min.js"></script>
    <![endif]-->

    <!-- build:js scripts/vendor.js -->
    <!-- bower:js -->
    <script src="sites/all/themes/angupal/app/bower_components/jquery/dist/jquery.js"></script>
    <script src="sites/all/themes/angupal/app/bower_components/angular/angular.js"></script>
    <script src="sites/all/themes/angupal/app/bower_components/bootstrap/dist/js/bootstrap.js"></script>
    <script src="sites/all/themes/angupal/app/bower_components/angular-resource/angular-resource.js"></script>
    <script src="sites/all/themes/angupal/app/bower_components/angular-cookies/angular-cookies.js"></script>
    <script src="sites/all/themes/angupal/app/bower_components/angular-sanitize/angular-sanitize.js"></script>
    <script src="sites/all/themes/angupal/app/bower_components/angular-route/angular-route.js"></script>
    <script src="sites/all/themes/angupal/app/bower_components/swiper/dist/idangerous.swiper.js"></script>
    <script src="sites/all/themes/angupal/app/bower_components/mousetrap/mousetrap.min.js"></script>
    <!-- endbower -->
    <!-- endbuild -->

        <!-- build:js({.tmp,app}) scripts/scripts.js -->
        <script>
          var base_path = 'http://'+location.hostname+'/';
          if(base_path == 'http://localhost/')
            base_path += 'collinfontaine/'
          var basePath = base_path;
        </script>

        <script src="sites/all/themes/angupal/app/scripts/app.js"></script>
        <script src="sites/all/themes/angupal/app/scripts/services.js"></script>
        <script src="sites/all/themes/angupal/app/scripts/controllers.js"></script>
        <script src="sites/all/themes/angupal/app/scripts/directives_base.js"></script>
        <script src="sites/all/themes/angupal/app/scripts/directives.js"></script>
        <!-- endbuild -->

</body>
</html>
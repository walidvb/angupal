// Generated by CoffeeScript 1.6.2
(function() {
  angular.module('myApp').directive("myProject", [
    function() {
      return {
        scope: {
          project: "=myProject"
        },
        replace: true,
        templateUrl: "views/project.html"
      };
    }
  ]).directive("myBio", [
    function() {
      return {
        scope: {
          bio: "=myBio"
        },
        templateUrl: "views/bio.html"
      };
    }
  ]).directive("swiper", [
    '$timeout', function($timeout) {
      return {
        priority: 500,
        link: function(scope, elem, attrs) {
          return $timeout(function() {
            var $this, initialState, options, pagination;

            $this = angular.element(elem);
            options = {
              mousewheelControl: true,
              mousewheelControlForceToAxis: true,
              keyboardControl: true,
              resizeReInit: true,
              grabCursor: true
            };
            if (attrs.swiper === 'vert') {
              initialState = true;
              pagination = $('<div class="vert-pagination"/>');
              scope.swipers.vertPagination = pagination;
              angular.element('navigation').prepend(pagination);
              options.slideClass = 'slide-vert';
              options.mode = 'vertical';
              options.pagination = '.vert-pagination';
              options.paginationElement = 'div';
              options.paginationElementClass = 'vert-pager';
              options.paginationActiveClass = 'active';
              options.paginationVisibleClass = 'visible';
              options.paginationClickable = true;
              options.initialSlide = 0;
              options.onSwiperCreated = function(swiper) {
                angular.element('navigation').css('marginTop', -pagination.height() / 2);
                return scope.initPagers();
              };
              options.onSlideChangeStart = function(swiper, direction) {
                angular.element('body').removeClass('initial-state');
                pagination.removeClass('faded');
                console.log('startChange');
                return scope.initPagers();
              };
              options.onSlideChangeEnd = function(swiper, direction) {
                if (initialState) {
                  swiper.removeSlide(0);
                  swiper.swipeTo(0, 0, false);
                  angular.element('body').addClass('ready-state');
                  initialState = false;
                }
                console.log('endChange');
                return scope.initPagers();
              };
              scope.swipers.vertical = $this.swiper(options);
              return;
            } else {
              options.slideClass = 'slide-horz';
              options.onSlideChangeStart = function() {
                return angular.element('.vert-pagination').addClass('faded');
              };
            }
            if (attrs.settings === 'bio') {
              options.scrollContainer = true;
            }
            return $this.swiper(options);
          }, 1000);
        }
      };
    }
  ]);

}).call(this);

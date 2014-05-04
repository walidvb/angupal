'use strict';

myApp = angular.module('myApp', [
  'ngCookies',
  'ngResource',
  'ngSanitize',
])

Mousetrap.bind 'a d m i n', () ->
			window.location = base_path + 'admin/content';
window.addEventListener "load", () ->
	window.scrollTo(0, 1)

window.hideAddressBar = ->
  unless window.location.hash
    document.body.style.height = (window.outerHeight + 50) + "px"  if document.height < window.outerHeight
    setTimeout (->
      window.scrollTo 0, 1
      return
    ), 50
  return
window.addEventListener "load", ->
  window.hideAddressBar()  unless window.pageYOffset
  return

window.addEventListener "orientationchange", window.hideAddressBar
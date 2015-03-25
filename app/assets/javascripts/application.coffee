# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file.
#
# Read Sprockets README (https:#github.com/sstephenson/sprockets#sprockets-directives) for details
# about supported directives.
#
#= require polymer/webcomponents
#= require jquery
#= require jquery_ujs
#= require jquery-migrate-min
#= require_tree .
#= require_tree ./static

$ ->
    $('body').addClass( if $.browser.mobile then 'mobile' else 'desktop' )
    
    $('a[data-remote]').on 'ajax:success', (e, data, status, xhr) ->
        $('#content').html(data)
        uri = this['href']
        window.history.pushState({ 'url': uri }, '', uri)
    
    window.onpopstate = (event) ->
        uri = window.location.href
        $.ajax
            url: uri
            dataType: 'html'
            success: (data, status, xhr) ->
                $('#content').html(data)
                $.ajax
                    url: uri.replace('.html', '') + '.js'
                    dataType: 'json'
                    success: (data, status, xhr) ->
                        $('#tabbar').prop('selected', data.tab)

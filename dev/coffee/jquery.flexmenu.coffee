;(($, window) ->
  'use strict'

  $.fn.flexMenu = (options) ->
    return this.each( ->
      # settings
      settings = $.extend({
        breakpoint: 767                  # Integer: The responsive breakpoint (px) of flexMenu
        responsivePattern: 'toggle'      # String: 'toggle' and 'off-canvas'
        animationSpeed: 250              # Integer: The speed of animations, in milliseconds.
      }, options)

      # cache
      $nav = $(@)
      $li = $nav.find('li')
      $window = $(window)
      timer = undefined 

      $body = $('body')
      $nav.addClass('flexmenu')
      $button = $('.fm-button')

      # init
      init = ->
        $nav.find('li').each ->
          $this = $(@)
          if $this.has('ul').length
            $this.addClass('with-ul').find('ul').hide()

        $hasUl = $nav.find('.with-ul')
        $hasUl.append('<span class="navicon"></span>')

        if (settings.responsivePattern is 'toggle')
          $nav.addClass('fm-toggle')
        else if (settings.responsivePattern is 'off-canvas')
          $nav.addClass('fm-offcanvas')
          $body.wrapInner('<div class="fm-inner" />').wrapInner('<div class="fm-outer" />')

      init()


      $navicon = $('.flexmenu .navicon')
      $inner = $('.fm-inner')
      nav_open = false

      $button.on('click', ->
        $nav = $('.flexmenu.fm-sm')

        if $nav.hasClass('fm-toggle')
          $nav.slideToggle()
        else if $nav.hasClass('fm-offcanvas')
          if nav_open
            $inner.animate({
              'left': 0
            })
            $nav.animate({
              'left': '-70%'
            })
            nav_open = false
          else # open
            $inner.animate({
              'left': '70%'
            })
            $nav.animate({
              'left': 0
            })
            nav_open = true         
      )

      # reset menu
      reset = ->
        $nav.find('li ul').slideUp(200)
        # reset off-canvas....if $nav.length
        if ( settings.responsivePattern is 'off-canvas' && $('.flexmenu.fm-sm').length)
          do ->
            $nav = $('.flexmenu.fm-sm')
            $inner.animate({
              'left': 0
            })
            $nav.animate({
              'left': '-70%'
            })
            nav_open = false

      # resize
      resize = ->
        windowWidth = $window.width()

        # click for small screen
        if windowWidth <= settings.breakpoint
          # reset()
          $nav.removeClass('fm-lg').addClass('fm-sm')

          $button.show()

          if $nav.hasClass('fm-toggle')
            $nav.slideUp(200)

          # unbind events to prevent binding same event more the once Bug
          $li.off('mouseenter mouseleave') 
          $navicon.off('click')

          $navicon.on('click', (e)->
            e.stopPropagation()
            $this = $(@)
            $sub = $this.parent('.with-ul').children('ul')
            $sub.stop(true, true).slideToggle() # stop animate queue and animate
          )
        # hover for large screen
        else
          reset()
          $nav.removeClass('fm-sm').addClass('fm-lg')
          
          $button.hide()

          if $nav.hasClass('fm-toggle')
            $nav.slideDown()

          # unbind events to prevent binding same event more the once Bug
          $li.off('mouseenter mouseleave') 
          $navicon.off('click')

          $li.on('mouseenter', ->
            $(@).children('ul').stop(true, true).slideDown(settings.animationSpeed)
          ).on('mouseleave', ->
            $(@).children('ul').stop(true, true).slideUp(settings.animationSpeed)
          )

      resize() # call resize once to set

      # on resize
      $window.resize ->
        clearTimeout(timer)
        timer = setTimeout(resize, 200)
    )

)(jQuery, window) 

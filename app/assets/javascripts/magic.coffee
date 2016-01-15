$(window).on 'scroll', ->
    if $(this).scrollTop() > 100
      $('nav').addClass 'shrink'
    else
      $('nav').removeClass 'shrink'
    return
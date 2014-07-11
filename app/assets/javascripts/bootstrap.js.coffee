jQuery ->
  $("a[rel~=popover], .has-popover").popover()
  $("a[rel~=tooltip], .has-tooltip").tooltip()

NProgress.configure
    minimum: 0.2,
    easing: 'ease',
    positionUsing: '',
    speed: 800
    trickle: true,
    trickleRate: 0.5,
    trickleSpeed: 800,
    showSpinner: true,
    parent: 'body'
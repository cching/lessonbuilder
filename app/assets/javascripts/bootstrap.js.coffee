jQuery ->
  $("a[rel~=popover], .has-popover").popover()
  $("a[rel~=tooltip], .has-tooltip").tooltip()

NProgress.configure
  showSpinner: false
  ease: 'ease'
  speed: 500
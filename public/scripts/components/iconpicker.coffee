# 图标选择器
$ = require 'jquery'
template = require '../templates/components/iconpicker.hbs'

class Iconpicker
  @DEFAULTS:
    container: $('body')
    icons: [
      'adjust', 'adn', 'align-center', 'align-justify', 'align-left', 'align-right', 'ambulance', 'anchor',
      'android', 'angellist', 'angle-double-down', 'angle-double-left', 'angle-double-right', 'angle-double-up',
      'angle-down', 'angle-left', 'angle-right', 'angle-up', 'apple', 'archive', 'area-chart', 'arrow-circle-down',
      'arrow-circle-left', 'arrow-circle-o-down', 'arrow-circle-o-left', 'arrow-circle-o-right', 'arrow-circle-o-up',
      'arrow-circle-right', 'arrow-circle-up', 'arrow-down', 'arrow-left', 'arrow-right', 'arrow-up', 'arrows',
      'arrows-alt', 'arrows-h', 'arrows-v', 'asterisk', 'at', 'automobile', 'backward', 'ban', 'bank', 'bar-chart',
      'bar-chart-o', 'barcode', 'bars', 'beer', 'behance', 'behance-square', 'bell', 'bell-o', 'bell-slash', 'bell-slash-o',
      'bicycle', 'binoculars', 'birthday-cake', 'bitbucket', 'bitbucket-square', 'bitcoin', 'bold', 'bolt', 'bomb', 'book',
      'bookmark', 'bookmark-o', 'briefcase', 'btc', 'bug', 'building', 'building-o', 'bullhorn', 'bullseye', 'bus', 'cab',
      'calculator', 'calendar', 'calendar-o', 'camera', 'camera-retro', 'car', 'caret-down', 'caret-left', 'caret-right',
      'caret-square-o-down', 'caret-square-o-left', 'caret-square-o-right', 'caret-square-o-up', 'caret-up', 'cc', 'cc-amex',
      'cc-discover', 'cc-mastercard', 'cc-paypal', 'cc-stripe', 'cc-visa', 'certificate', 'chain', 'chain-broken', 'check',
      'check-circle', 'check-circle-o', 'check-square', 'check-square-o', 'chevron-circle-down', 'chevron-circle-left', 'chevron-circle-right',
      'chevron-circle-up', 'chevron-down', 'chevron-left', 'chevron-right', 'chevron-up', 'child', 'circle', 'circle-o', 'circle-o-notch',
      'circle-thin', 'clipboard', 'clock-o', 'close', 'cloud', 'cloud-download', 'cloud-upload', 'cny', 'code', 'code-fork',
      'codepen', 'coffee', 'cog', 'cogs', 'columns', 'comment', 'comment-o', 'comments', 'comments-o', 'compass', 'compress',
      'copy', 'copyright', 'credit-card', 'crop', 'crosshairs', 'css3', 'cube', 'cubes', 'cut', 'cutlery', 'dashboard',
      'database', 'dedent', 'delicious', 'desktop', 'deviantart', 'digg', 'dollar', 'dot-circle-o', 'download', 'dribbble',
      'dropbox', 'drupal', 'edit', 'eject', 'ellipsis-h', 'ellipsis-v', 'empire', 'envelope', 'envelope-o', 'envelope-square',
      'eraser', 'eur', 'euro', 'exchange', 'exclamation', 'exclamation-circle', 'exclamation-triangle', 'expand', 'external-link',
      'external-link-square', 'eye', 'eye-slash', 'eyedropper', 'facebook', 'facebook-square', 'fast-backward', 'fast-forward',
      'fax', 'female', 'fighter-jet', 'file', 'file-archive-o', 'file-audio-o', 'file-code-o', 'file-excel-o', 'file-image-o',
      'file-movie-o', 'file-o', 'file-pdf-o', 'file-photo-o', 'file-picture-o', 'file-powerpoint-o', 'file-sound-o', 'file-text',
      'file-text-o', 'file-video-o', 'file-word-o', 'file-zip-o', 'files-o', 'film', 'filter', 'fire', 'fire-extinguisher', 'flag',
      'flag-checkered', 'flag-o', 'flash', 'flask', 'flickr', 'floppy-o', 'folder', 'folder-o', 'folder-open', 'folder-open-o',
      'font', 'forward', 'foursquare', 'frown-o', 'futbol-o', 'gamepad', 'gavel', 'gbp', 'ge', 'gear', 'gears', 'gift', 'git',
      'git-square', 'github', 'github-alt', 'github-square', 'gittip', 'glass', 'globe', 'google', 'google-plus',
      'google-plus-square', 'google-wallet', 'graduation-cap', 'group', 'h-square', 'hacker-news', 'hand-o-down', 'hand-o-left',
      'hand-o-right', 'hand-o-up', 'hdd-o', 'header', 'headphones', 'heart', 'heart-o', 'history', 'home', 'hospital-o', 'html5',
      'ils', 'image', 'inbox', 'indent', 'info', 'info-circle', 'inr', 'instagram', 'institution', 'ioxhost', 'italic', 'joomla',
      'jpy', 'jsfiddle', 'key', 'keyboard-o', 'krw', 'language', 'laptop', 'lastfm', 'lastfm-square', 'leaf', 'legal', 'lemon-o',
      'level-down', 'level-up', 'life-bouy', 'life-buoy', 'life-ring', 'life-saver', 'lightbulb-o', 'line-chart', 'link', 'linkedin',
      'linkedin-square', 'linux', 'list', 'list-alt', 'list-ol', 'list-ul', 'location-arrow', 'lock', 'long-arrow-down',
      'long-arrow-left', 'long-arrow-right', 'long-arrow-up', 'magic', 'magnet', 'mail-forward', 'mail-reply', 'mail-reply-all',
      'male', 'map-marker', 'maxcdn', 'meanpath', 'medkit', 'meh-o', 'microphone', 'microphone-slash', 'minus', 'minus-circle',
      'minus-square', 'minus-square-o', 'mobile', 'mobile-phone', 'money', 'moon-o', 'mortar-board', 'music', 'navicon',
      'newspaper-o', 'openid', 'outdent', 'pagelines', 'paint-brush', 'paper-plane', 'paper-plane-o', 'paperclip', 'paragraph',
      'paste', 'pause', 'paw', 'paypal', 'pencil', 'pencil-square', 'pencil-square-o', 'phone', 'phone-square', 'photo',
      'picture-o', 'pie-chart', 'pied-piper', 'pied-piper-alt', 'pinterest', 'pinterest-square', 'plane', 'play', 'play-circle',
      'play-circle-o', 'plug', 'plus', 'plus-circle', 'plus-square', 'plus-square-o', 'power-off', 'print', 'puzzle-piece',
      'qq', 'qrcode', 'question', 'question-circle', 'quote-left', 'quote-right', 'ra', 'random', 'rebel', 'recycle', 'reddit',
      'reddit-square', 'refresh', 'remove', 'renren', 'reorder', 'repeat', 'reply', 'reply-all', 'retweet', 'rmb', 'road',
      'rocket', 'rotate-left', 'rotate-right', 'rouble', 'rss', 'rss-square', 'rub', 'ruble', 'rupee', 'save', 'scissors',
      'search', 'search-minus', 'search-plus', 'send', 'send-o', 'share', 'share-alt', 'share-alt-square', 'share-square',
      'share-square-o', 'shekel', 'sheqel', 'shield', 'shopping-cart', 'sign-in', 'sign-out', 'signal', 'sitemap', 'skype',
      'slack', 'sliders', 'slideshare', 'smile-o', 'soccer-ball-o', 'sort', 'sort-alpha-asc', 'sort-alpha-desc', 'sort-amount-asc',
      'sort-amount-desc', 'sort-asc', 'sort-desc', 'sort-down', 'sort-numeric-asc', 'sort-numeric-desc', 'sort-up', 'soundcloud',
      'space-shuttle', 'spinner', 'spoon', 'spotify', 'square', 'square-o', 'stack-exchange', 'stack-overflow', 'star',
      'star-half', 'star-half-empty', 'star-half-full', 'star-half-o', 'star-o', 'steam', 'steam-square', 'step-backward',
      'step-forward', 'stethoscope', 'stop', 'strikethrough', 'stumbleupon', 'stumbleupon-circle', 'subscript', 'suitcase',
      'sun-o', 'superscript', 'support', 'table', 'tablet', 'tachometer', 'tag', 'tags', 'tasks', 'taxi', 'tencent-weibo',
      'terminal', 'text-height', 'text-width', 'th', 'th-large', 'th-list', 'thumb-tack', 'thumbs-down', 'thumbs-o-down',
      'thumbs-o-up', 'thumbs-up', 'ticket', 'times', 'times-circle', 'times-circle-o', 'tint', 'toggle-down', 'toggle-left',
      'toggle-off', 'toggle-on', 'toggle-right', 'toggle-up', 'trash', 'trash-o', 'tree', 'trello', 'trophy', 'truck', 'try',
      'tty', 'tumblr', 'tumblr-square', 'turkish-lira', 'twitch', 'twitter', 'twitter-square', 'umbrella', 'underline', 'undo',
      'university', 'unlink', 'unlock', 'unlock-alt', 'unsorted', 'upload', 'usd', 'user', 'user-md', 'users', 'video-camera',
      'vimeo-square', 'vine', 'vk', 'volume-down', 'volume-off', 'volume-up', 'warning', 'wechat', 'weibo', 'weixin', 'wheelchair',
      'wifi', 'windows', 'won', 'wordpress', 'wrench', 'xing', 'xing-square', 'yahoo', 'yelp', 'yen', 'youtube', 'youtube-play',
      'youtube-square'
    ]

  constructor: (options) ->
    @options = $.extend {}, Iconpicker.DEFAULTS, options
    @container = @options.container
    @container.on 'focusin', '[rel-iconpicker="yes"]', (event) =>
      @$el = $ event.currentTarget
      @_analyse @$el.val()
      @$el.on 'input', => @_analyse @$el.val()
      @$el.one 'focusout', => @$el.unbind 'input'

  # 分析
  _analyse: (val) ->
    icons = @_filter val
    $el = @$el
    if 0 < icons.length
      if not $el.data 'bs.popover'
        $el.popover placement: 'bottom', container: @container, trigger: 'focus', html: true, content: template icons: icons
        $el.popover 'show'

        popover = $el.data('bs.popover')
        popover.$tip.addClass 'iconpicker-popover'
        popover.$tip.on 'click', '.iconpicker a', (event) ->
          event.preventDefault()
          value = $(this).data 'value'
          $el.val("icon-#{value}").blur()
          $el.siblings('.bubble-icon').html "<i class='fa fa-#{value}'></i>"
      else
        popover = $el.data('bs.popover')
        popover.options.content = template icons: icons
        popover.$tip.find('.popover-content').html popover.options.content
    else
      $el.popover 'destroy' if @$el.data 'bs.popover'

    if 1 is icons.length && val is "icon-#{icons[0]}"
      $el.siblings('.bubble-icon').html "<i class='fa fa-#{icons[0]}'></i>"
    else
      $el.siblings('.bubble-icon').html ''

  # 筛选
  _filter: (val) ->
    return [] if 0 isnt val.indexOf 'icon-'
    return @options.icons if 'icon-' is val
    icons = []
    for icon in @options.icons
      icons.push icon if 0 is icon.indexOf val.substr 5
    return icons


module.exports = Iconpicker

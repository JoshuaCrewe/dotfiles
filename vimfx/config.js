const {classes: Cc, interfaces: Ci, utils: Cu} = Components

let {commands} = vimfx.modes.normal

 vimfx.addCommand({
  name: 'tab_move_to_index',
  description: 'Move tab to index',
  category: 'tabs',
  order: commands.tab_move_forward.order + 1,
}, ({vim, count}) => {
  if (count === undefined) {
    vim.notify('Provide a count')
    return
  }
  let {window} = vim
  window.setTimeout(() => {
    window.gBrowser.moveTabTo(window.gBrowser.selectedTab, count - 1)
  }, 0)
})

vimfx.addCommand({
  name: 'toggle_floating_tab_bar',
  description: 'Toggle floating tab bar',
  category: 'tabs',
}, ({vim}) => {
  let {window} = vim
  let value = getWindowAttribute(window, 'tabbar-visibility')
  let isFloating = (!value || value === 'floating' || value === 'temporary')
  setWindowAttribute(window, 'tabbar-visibility', isFloating ? 'hidden' : 'floating')
})

let map = (shortcuts, command, custom=false) => {
  vimfx.set(`${custom ? 'custom.' : ''}mode.normal.${command}`, shortcuts)
}

map(' ', 'scroll_page_down')

map('gt', 'tab_move_to_index', true)
map('gT', 'toggle_floating_tab_bar', true)

map('(',  'tab_select_previous')
map(')',  'tab_select_next')
map('gf', 'click_browser_element')
map('d',  'tab_close')
map('u',  'tab_restore')
map('<space><space>', 'tab_select_most_recent')
map('<c-e>', 'tab_select_last')
map('<c-a>', 'tab_select_first_non_pinned')
map('`', 'scroll_to_mark')

map('<c-d>', 'scroll_half_page_down')
map('<c-u>', 'scroll_half_page_up')

map('/', 'find_highlight_all')
map('a/', 'find')

map('n', 'find_next')
map('N', 'find_previous')
map('y', 'copy_current_url')

let set = (pref, valueOrFunction) => {
  let value = typeof valueOrFunction === 'function'
    ? valueOrFunction(vimfx.getDefault(pref))
    : valueOrFunction
  vimfx.set(pref, value)
}

set('hints.chars', '1234567890')
set('prevent_autofocus', true)
set('prev_patterns', v => `föregående  ${v}`)
set('next_patterns', v => `nästa  ${v}`)
set('counts_enabled', true)

let {Preferences} = Cu.import('resource://gre/modules/Preferences.jsm', {})

Preferences.set({
  'accessibility.blockautorefresh': true,
  'browser.ctrlTab.previews': true,
  'browser.fixup.alternate.enabled': false,
  'browser.search.suggest.enabled': false,
  'browser.startup.page': 3,
  'browser.tabs.animate': false,
  'browser.tabs.closeWindowWithLastTab': false,
  'browser.tabs.warnOnClose': false,
  'browser.urlbar.formatting.enabled': false,
  'devtools.chrome.enabled': true,
  'devtools.command-button-eyedropper.enabled': true,
  'devtools.command-button-rulers.enabled': true,
  'devtools.selfxss.count': 0,
  'privacy.donottrackheader.enabled': true,
  'toolkit.scrollbox.verticalScrollDistance' : 4,
  'extensions.VimFx.smoothscroll.lines.spring-constant' : 2000,
})

// This is the javascript which runs what the font
// javascript:(function(){var%20d=document,s=d.createElement('scr'+'ipt'),b=d.body,l=d.location;s.setAttribute('src','http://chengyinliu.com/wf.js?o='+encodeURIComponent(l.href)+'&t='+(new%20Date().getTime()));b.appendChild(s)})();

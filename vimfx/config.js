// Settings

const {classes: Cc, interfaces: Ci, utils: Cu} = Components
const nsIStyleSheetService = Cc['@mozilla.org/content/style-sheet-service;1'].getService(Ci.nsIStyleSheetService)
let {commands} = vimfx.modes.normal

let map = (shortcuts, command, custom=false) => {
  vimfx.set(`${custom ? 'custom.' : ''}mode.normal.${command}`, shortcuts)
}

let set = (pref, valueOrFunction) => {
  let value = typeof valueOrFunction === 'function'
    ? valueOrFunction(vimfx.getDefault(pref))
    : valueOrFunction
  vimfx.set(pref, value)
}

let loadCss = (uriString) => {
  let uri = Services.io.newURI(uriString, null, null)
  let method = nsIStyleSheetService.AUTHOR_SHEET
  if (!nsIStyleSheetService.sheetRegistered(uri, method)) {
    nsIStyleSheetService.loadAndRegisterSheet(uri, method)
  }
  vimfx.on('shutdown', () => {
    nsIStyleSheetService.unregisterSheet(uri, method)
  })
}

let toggleCss = (uriString) => {
    let uri = Services.io.newURI(uriString, null, null)
    let method = nsIStyleSheetService.AUTHOR_SHEET
    if (nsIStyleSheetService.sheetRegistered(uri, method)) {
        nsIStyleSheetService.unregisterSheet(uri, method)
    } else {
        nsIStyleSheetService.loadAndRegisterSheet(uri, method)
    }
    vimfx.on('shutdown', () => {
        nsIStyleSheetService.unregisterSheet(uri, method)
    })
}

// Mappings

// Remove some mappings
map(' ', 'scroll_page_down')

// Tabs
map('(',  'tab_select_previous')
map(')',  'tab_select_next')
map('d',  'tab_close')
map('u',  'tab_restore')
map('<space><space>', 'tab_select_most_recent')
map('<c-e>', 'tab_select_last')
map('<c-a>', 'tab_select_first_non_pinned')

// Scrolling
map('`', 'scroll_to_mark')
map('<c-d>', 'scroll_half_page_down')
map('<c-u>', 'scroll_half_page_up')

// Hints
map('gf', 'click_browser_element')

// Searching
map('/', 'find_highlight_all')
map('a/', 'find')
map('n', 'find_next')
map('N', 'find_previous')

// Other ?
map('y', 'copy_current_url')

// Preferences

set('hints.chars', '1234567890')
set('prevent_autofocus', true)
set('prev_patterns', v => `föregående  ${v}`)
set('next_patterns', v => `nästa  ${v}`)
set('counts_enabled', true)

// Some preferences are used to edit Built in firefox things
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
  'extensions.VimFx.smoothscroll.lines.spring-constant' : 1000,
})

// Custom Commands
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
map('gt', 'tab_move_to_index', true)

vimfx.addCommand({
  name: 'search_bookmarks',
  description: 'Search bookmarks',
  category: 'location',
  order: commands.focus_location_bar.order + 1,
}, (args) => {
  commands.focus_location_bar.run(args)
  args.vim.window.gURLBar.value = '* '
})
map('<space><s-CR>', 'search_bookmarks', true)

vimfx.addCommand({
  name: 'search_tabs',
  description: 'Search Tabs',
  category: 'location',
  order: commands.focus_location_bar.order + 1,
}, (args) => {
  commands.focus_location_bar.run(args)
  args.vim.window.gURLBar.value = '% '
})
map('<space><CR>', 'search_tabs', true)

vimfx.addCommand({
  name: 'web_console',
  description: 'Web console',
}, ({vim}) => {
  vim.window.gDevToolsBrowser.selectToolCommand(vim.window.gBrowser, 'webconsole')
})
map('gk', 'web_console', true)

vimfx.addCommand({
  name: 'web_inspector',
  description: 'Web inspector',
}, ({vim}) => {
  vim.window.gDevToolsBrowser.toggleToolboxCommand(vim.window.gBrowser)
})
map('<c-s>', 'web_inspector', true)

vimfx.addCommand({
    name: 'focus_unhighlighted_location_bar',
    description: 'Focus the location bar with the URL unhighlighted',
    category: 'location',
    order: commands.focus_location_bar.order + 1,
}, (args) => {
    commands.focus_location_bar.run(args);
    let active = args.vim.window.document.activeElement;
    active.selectionStart = active.selectionEnd;
});
map('O', 'focus_unhighlighted_location_bar', true)

vimfx.addCommand({
    name: 'goto_addons',
    description: 'Addons',
}, ({vim}) => {
    vim.window.BrowserOpenAddonsMgr()
})
map('<space>a', 'goto_addons', true)

vimfx.addCommand({
    name: 'goto_config',
    description: 'Config',
}, ({vim}) => {
    vim.window.switchToTabHavingURI('about:config', true)
})
map('<space>c', 'goto_config', true)

vimfx.addCommand({
    name: 'goto_downloads',
    description: 'Downloads',
}, ({vim}) => {
    // vim.window.switchToTabHavingURI('about:downloads', true)
    vim.window.DownloadsPanel.showDownloadsHistory()
})
map('<space>d', 'goto_downloads', true)

vimfx.addCommand({
    name: 'midnight',
    description: 'Midnight Surfing',
}, ({vim}) => {
    toggleCss(`${__dirname}/custom-css/midnight.css`)
})
map('<space>n', 'midnight', true)

// This is the javascript which runs what the font
// javascript:(function(){var%20d=document,s=d.createElement('scr'+'ipt'),b=d.body,l=d.location;s.setAttribute('src','http://chengyinliu.com/wf.js?o='+encodeURIComponent(l.href)+'&t='+(new%20Date().getTime()));b.appendChild(s)})();

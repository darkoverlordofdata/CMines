// All of the Node.js APIs are available in the preload process.
// It has the same sandbox as a Chrome extension.
const Store = require('electron-store')

// window.store = new Store()

window.addEventListener('DOMContentLoaded', () => {
  const replaceText = (selector, text) => {
    const element = document.getElementById(selector)
    if (element) element.innerText = text
  }

  for (const type of ['chrome', 'node', 'electron']) {
    replaceText(`${type}-version`, process.versions[type])
  }
})

/* Quit application from it's menu */
window.quitApplication = () => {
  const remote = require("electron").remote
  let w = remote.getCurrentWindow()
  w.close()

}
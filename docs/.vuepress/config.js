module.exports = {
  markdown: {
    extendMarkdown: md => {
      md.use(require('markdown-it-task-lists'))
    }
  },
  theme: 'default-prefers-color-scheme',
  themeConfig: {
    repo: 'ksevelyar/idempotent-desktop',
    docsDir: 'docs',
    editLinks: true,
    editLinkText: 'Help to improve this page ❀◕ ‿ ◕❀',
    logo: 'nixoscolorful.svg',
    sidebar: [
      '/',
      '/guide',
      '/xmonad',
      '/vim',
      '/firefox',
      '/fish',
      '/security',
      '/anonymity',
      '/live-usb',
      '/nix',
      '/screenshots',
    ]
  }
}

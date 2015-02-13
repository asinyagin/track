class NewTaskPage
  url: '#!/new-task'
  textField: element(By.model('text'))
  createButton: element(By.css('button[type=submit]'))

  at: -> expect(browser.getCurrentUrl()).toContain(@url)

module.exports = NewTaskPage

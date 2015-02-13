class HomePage
  url: '#!/tasks'
  newTaskLink: element(By.css('a[href="#!/new-task"]'))
  tasks: element.all(By.repeater('task in tasks'))

  get: -> browser.get('/')

  at: -> expect(browser.getCurrentUrl()).toContain(@url)

module.exports = HomePage

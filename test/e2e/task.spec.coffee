HomePage = require('./pages/home')
NewTaskPage = require('./pages/new_task')

describe 'Track', ->
  home = new HomePage()
  newTask = new NewTaskPage()

  beforeEach -> home.get()

  it 'should create a new task', ->
    text = 'Task text'
    home.newTaskLink.click()
    newTask.at()
    newTask.textField.sendKeys(text)
    newTask.createButton.click()
    home.at()
    expect(
      home.tasks.map((task) -> task.element(By.tagName('a')).getText())
    ).toContain(text)

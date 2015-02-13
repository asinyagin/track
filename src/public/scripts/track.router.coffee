config = ($locationProvider, $routeProvider) ->
  $locationProvider.hashPrefix('!')

  $routeProvider
    .when '/tasks',
      title: 'Home'
      controller: 'TasksCtrl'
      templateUrl: 'templates/tasks.html'
    .when '/new-task',
      title: 'New Task'
      controller: 'NewTaskCtrl'
      templateUrl: 'templates/new_task.html'
    .when '/tasks/:id',
      title: 'Task'
      controller: 'TaskCtrl'
      templateUrl: 'templates/task.html'
    .otherwise(redirectTo: '/tasks')

titleHandler = ($location, $rootScope) ->
  $rootScope.$on '$routeChangeSuccess', (event, current, previous) ->
      $rootScope.title = current.$$route.title if current.$$route

angular.module('track')
  .config(['$locationProvider', '$routeProvider', config])
  .run(['$location', '$rootScope', titleHandler])

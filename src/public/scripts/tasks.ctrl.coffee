TasksCtrl = ($scope, Tasks) ->
  $scope.tasks = Tasks.query()

angular.module('track')
  .controller('TasksCtrl', ['$scope', 'Tasks', TasksCtrl])

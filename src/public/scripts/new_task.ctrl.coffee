NewTaskCtrl = ($scope, $location, Tasks) ->
  $scope.error = false
  $scope.create = ->
    Tasks.save text: $scope.text,
      ->
        $scope.error = false
        $location.path('/tasks')
      (error) -> $scope.error = true

angular.module('track')
  .controller('NewTaskCtrl', ['$scope', '$location', 'Tasks', NewTaskCtrl])

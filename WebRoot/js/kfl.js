/**
 * Created by bjwsl-001 on 2017/6/15.
 */

var app = angular.module('kfl', ['ionic']);

//自定义服务
app.service('$kflHttp',
  ['$http', '$ionicLoading',
    function ($http, $ionicLoading) {
      //url:请求的地址和参数 handleSucc:成功之后的处理函数
      this.sendRequest = function (url, handleSucc) {
        $ionicLoading.show({template: 'loading...'})
        $http
          .get(url)
          .success(function (data) {
            $ionicLoading.hide();
            handleSucc(data);
          })
      }

    }])


//配置状态
app.config(
  function ($stateProvider,
            $ionicConfigProvider,
            $urlRouterProvider) {

    //调整tabs固定在底部（无论是在哪个平台）
    $ionicConfigProvider.tabs.position('bottom');

    $stateProvider
      .state('kflStart', {
        url: '/kflStart',
        templateUrl: 'tpl/start.html'
      })
      .state('kflMain', {
        url: '/kflMain',
        templateUrl: 'tpl/exchange.html',
        controller: 'MainCtrl'
      })
      .state('kflDetail', {
        url: '/kflDetail/:id',
        templateUrl: 'tpl/money.html',
        controller:'DetailCtrl'
      })
      .state('kflOrder', {
        url: '/kflOrder/:id',
        templateUrl: 'tpl/order.html',
        controller:'OrderCtrl'
      })
      .state('kflMyOrder', {
        url: '/kflMyOrder',
        templateUrl: 'tpl/order.html'
      })

    $urlRouterProvider.otherwise('/kflStart');

  })

//创建一个父控制器
app.controller('parentCtrl', ['$scope', '$state',
  function ($scope, $state) {

    $scope.jump = function (desState, arg) {
      $state.go(desState, arg);
    }
  }
]);

app.controller('MainCtrl', ['$scope', '$kflHttp',
  function ($scope, $kflHttp) {
    $scope.hasMore = true;
    //加载首页数据
    $kflHttp.sendRequest(
      'data/dish_getbypage.php',
      function (data) {
        console.log(data);
        $scope.dishList = data;
      });
    //给按钮定义一个处理函数：加载更多数据
    $scope.loadMore = function () {
      $kflHttp.sendRequest(
        'data/dish_getbypage.php?start='+$scope.dishList.length,
        function (data) {
          if(data.length < 5)
          {
            $scope.hasMore = false;
          }
          $scope.dishList = $scope.dishList.concat(data);
          $scope.$broadcast('scroll.infiniteScrollComplete');
        }
      )
    };
    //在ng的项目中 如果需要用到方向2的绑定，也就是ngModel，官方建议是要将模型数据存储一个对象中

    $scope.inputTxt = {kw:''};

    //监听用户输入 的关键词进行搜索
    $scope.$watch('inputTxt.kw', function () {

      $kflHttp.sendRequest(
        'data/dish_getbykw.php?kw='+$scope.inputTxt.kw,
        function (data) {
          if(data.length > 0)
          {
            $scope.dishList = data;
          }
        }
      )

    })
  }
]);

app.controller('DetailCtrl',
  ['$scope','$kflHttp','$stateParams',
    function ($scope,$kflHttp,$stateParams) {
      console.log($stateParams);
      //发起网络请求，取指定id的详情信息并显示在视图
      $kflHttp.sendRequest(
        'data/dish_getbyid.php?id='+$stateParams.id,
        function (data) {
          console.log(data);
          $scope.dish = data[0];
        }
      )
    }
  ]);

app.controller('OrderCtrl',
  ['$scope','$kflHttp','$stateParams','$httpParamSerializerJQLike',
    function ($scope,$kflHttp,$stateParams,$httpParamSerializerJQLike) {
      $scope.order = {did:$stateParams.id};

      $scope.submitOrder = function () {

        //系列化
        //①自己拼接 'user_name='+$scope.order.user_name+'&sex='+$scope.order.sex
        //②ng内置序列化服务
        //$httpParamSerializerJQLike
        var args = $httpParamSerializerJQLike($scope.order);

        $kflHttp.sendRequest(
          'data/order_add.php?'+args,
          function (data) {
            if(data.length >0 )
            {
              if(data[0].msg == 'succ')
              {
                
                $scope.result = '下单成功，订单编号为'+data[0].oid;
              }
              else
              {
                $scope.result = '下单失败'
              }
            }
          }
        )

      }
    }
])









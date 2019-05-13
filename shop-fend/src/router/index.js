import Vue from 'vue'
import Router from 'vue-router'
import IndexComponents from '@/components/view/index'
import InfoComponents from '@/components/view/info'
import ClassComponents from '@/components/view/class'
import CartComponents from '@/components/view/cart'
import MeComponents from "@/components/view/me";

import LoginComponents from "@/components/view/login";
import addUserComponents from "@/components/view/adduser";
import OrderComponents from "@/components/view/order";
import ResultComponents from "@/components/view/payresult";

import { Confirm, Alert, Toast, Notify, Loading } from 'vue-ydui/dist/lib.rem/dialog';


Vue.use(Router)

const router = new Router({
  //解决拖动时多个页面互相影响的问题，当切换到新路由时，想要页面滚到顶部
  scrollBehavior(to, from, savedPosition) {
    return { x: 0, y: 0 }
  },
  routes: [
    {
      path: '/',
      name: 'index',
      component: IndexComponents,
      meta: {
        // 是否需要登录
        isLogin: false,
        // 是否需要被缓存
        keepAlive: true,
        // 页面标签卡标题
        title: "主页"
      }
    },
    {
      path: '/info/:id',
      name: 'info',
      component: InfoComponents,
      meta: {
        isLogin: false,
        keepAlive: false,
        title: "详情"
      }
    },
    {
      path: '/class',
      name: 'class',
      component: ClassComponents,
      meta: {
        isLogin: false,
        keepAlive: false,
        title: "分类"
      }
    },
    {
      path: '/reg',
      name: 'register',
      component: addUserComponents,
      meta: {
        isLogin: false,
        keepAlive: true,
        title: "注册"
      }
    },
    {
      path: '/login',
      name: 'login',
      component: LoginComponents,
      meta: {
        isLogin: false,
        keepAlive: true,
        title: "登录"
      }
    },
    {
      path: '/cart',
      name: 'cart',
      component: CartComponents,
      meta: {
        isLogin: true,
        keepAlive: false,
        title: "购物车"
      }
    },
    {
      path: '/me',
      name: 'me',
      component: MeComponents,
      meta: {
        isLogin: true,
        keepAlive: false,
        title: "我的"
      }
    },
    {
      path: '/order',
      name: "order",
      component: OrderComponents,
      meta: {
        isLogin: true,
        keepAlive: false,
        title: "确认订单"
      }
    },
    {
      path: '/result',
      name: "result",
      component: ResultComponents,
      meta: {
        isLogin: true,
        keepAlive: false,
        title: "支付成功"
      }
    }
  ]
})

router.beforeEach((to, from, next) => {
  // 设置浏览器标题
  document.title = to.meta.title
  // 检查页面是否需要登录
  if (to.meta.isLogin) {
    // 检查是否已经登录
    if (localStorage.getItem("u") == null) {
      Toast({
        mes: '请先登录',
        timeout: 1700,
        icon: 'error',
        callback: () => {
          next({
            path: '/login',
            query: { redirect: to.fullPath }
          })
        }
      })
    } else {
      next()
    }

  } else {
    next()
  }


})


export default router

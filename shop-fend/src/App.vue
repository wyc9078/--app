<template>
  <div id="app">
    
        <!-- 顶部导航 -->
        <menus :headerTitle="navbarTitle" v-if="showNavBar" ref="menus" @change="ChangeHeader"></menus>
        
        <div class="content">
          <!-- 需要被缓存的组件 -->
          <keep-alive>
            <router-view v-if="$route.meta.keepAlive"/>
          </keep-alive>
          
          <router-view v-if="!$route.meta.keepAlive"></router-view>
        </div>

        <!-- 底部导航 -->
        <footers @change="ChangeHeader" ref="footer" v-if="showFooter"></footers>

   
  </div>
</template>

<script>
// 头部导航
import NavBarComponent from "./components/public/navbar";
// 底部导航
import TabBarComponent from "./components/public/tabbar";

export default {
  data() {
    return {
      // 标签卡标题
      navbarTitle: "我的",
      // 是否展示底部导航
      showFooter: true,
      // 是否展示顶部导航
      showNavBar: true
    };
  },
  watch: {
    // 监听路由切换，进入对应页面执行对应隐藏操作
    $route(e) {
      switch (e.name) {
        case "info":
          this.showFooter = false;
          this.showNavBar = false;
          break;
        case "cart":
          this.showNavBar = false;
          break;
        case "me":
          this.showNavBar = false;
          break;
        case "login":
          localStorage.getItem("u") != null ? this.$router.back() : "";
          this.showNavBar = false;
          break;
        case "register":
          localStorage.getItem("u") != null ? this.$router.back() : "";
          this.showNavBar = false;
          break;
        default:
          this.showFooter = true;
          this.showNavBar = true;
          break;
      }
    }
  },
  methods: {
    ChangeHeader(title) {
      this.navbarTitle = title;
    }
  },
  components: {
    menus: NavBarComponent,
    footers: TabBarComponent
  }
};
</script>

<style>
.yd-scrolltab {
  margin: 1rem 0 1.3rem 0;
}
.router-link-active {
  color: #ef4f4f !important;
}
.yd-checklist-item-icon {
  display: none !important;
}
.content,
#app {
  width: 100%;
  height: 100%;
}
.g-fix-ios-prevent-scroll {
  overflow: auto !important;
  position: inherit !important;
}
.yd-preview-header > * {
  flex: none !important;
}
</style>

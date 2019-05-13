<template>
  <div class="info">
    <!-- 顶部商品主图轮播 -->
    <swiper :imglist="infoMain"></swiper>
    
    <!-- 主要商品信息 -->
    <div class="main-info">
        <div class="info-three">
            <div class="info-header">
                    <h3>{{ infoList.commodity_name }}</h3>
                    <div class="header-top">
                        {{infoList.commodity_content}}
                    </div>
                    <div class="price">
                        <em>
                            ¥ {{ infoList.commodity_nowprice }}
                        </em>
                        <span>
                            ¥ {{ infoList.commodity_oldprice }}
                        </span>
                    </div>
                </div>
                <div class="info-configure">
                    <div class="configure-server">
                        <div>
                            服务
                        </div>
                        <div>
                            15天退货 · 运费险 · 公益宝贝
                        </div>
            </div> 
            <div class="configure-server">
                <div>
                    参数
                </div>
                <div>
                    品牌 Apple型号...
                </div>
            </div>
        </div>
        <div class="info-address"></div>
        </div>


        <div class="info-introduce">
            <img v-for="(item,index) in attachimg" :key="index" :src="item.url" alt="">
        </div>
    </div>

    <!-- 底部商品统计购买 -->
    <div class="cart-list">
         <yd-tabbar-item title="首页" link="/" class="items-icons">
            <yd-icon name="home-outline" color="rgba(0,0,0,.54)" slot="icon" size="0.54rem"></yd-icon>
        </yd-tabbar-item>
        <yd-tabbar-item title="购物车" link="/cart" class="items-icons">
            <yd-icon name="shopcart-outline" color="rgba(0,0,0,.54)" slot="icon" size="0.54rem"></yd-icon>
        </yd-tabbar-item>
        <div class="items-big">
            <yd-button 
               @click.native="isShowAddCartAction ? addCart() : '' " 
               :class="[ isShowAddCartAction ? 'cartActive' : 'noActive' ,'add-cart']"  
               size="small" shape="circle">
               {{ isShowAddCartAction ? '加入购物车': '购物车已存在' }}
            </yd-button>
        </div>
        
    </div>

    <!-- 返回顶部 -->
    <yd-backtop></yd-backtop>

    <div :class="actionWhite ? 'white header-action' : 'header-action' ">
        <div class="action-left" @click="$router.back()">
            <yd-navbar-back-icon size=".4rem"></yd-navbar-back-icon>
        </div>
	<div>222222</div>
        <div class="action-right" @click="$router.push({ name: 'cart' })">
            <yd-icon name="shopcart-outline" size=".4rem"></yd-icon>
        </div>
    </div>
  </div>   
</template>


<script>
import SwiperComponent from "../public/swiper";
export default {
  created() {
    this.getShopInfo();
    this.checkCart();
    window.addEventListener("scroll", this.handleScroll);
  },
  data() {
    return {
      shopid: this.$route.params.id,
      infoList: {},
      infoMain: [],
      userInfo: this.$utils.getUserInfo(),
      isShowAddCartAction: true,
      actionWhite: false,
      attachimg: []
    };
  },
  beforeRouteEnter(to, from, next) {
    next(vm => {
      vm.$parent.$data.showFooter = false;
      vm.$parent.$data.showNavBar = false;
    });
  },
  methods: {
    handleScroll() {
      var scrollTop =
        window.pageYOffset ||
        document.documentElement.scrollTop ||
        document.body.scrollTop;
      if (scrollTop > 80) {
        this.actionWhite = true;
      } else {
        this.actionWhite = false;
      }
    },
    // 检车商品是否被已经收藏过了
    async checkCart() {
      let check = await this.$http.post({
        url: "/cart/checkCart",
        token: this.$utils.encrypt({
          userid: this.userInfo.id,
          shopid: this.shopid
        })
      });
      check.data.length == 1 ? (this.isShowAddCartAction = false) : "";
    },
    // 添加商品到购物车
    async addCart() {
      if (localStorage.getItem("u") == null) {
        this.$dialog.toast({
          mes: "请先登录",
          timeout: 1500,
          icon: "error",
          callback: () => {
            this.$router.push({ name: "login" });
          }
        });
      } else {
        let list = await this.$http.post({
          url: "/cart/addCart",
          token: this.$utils.encrypt({
            userid: this.userInfo.id,
            shopid: this.shopid
          })
        });

        if (list.data.hasOwnProperty("insertId")) {
          this.$dialog.toast({
            mes: "加入购物车成功",
            timeout: 1500
          });
          this.isShowAddCartAction = false;
        }
      }
    },
    // 请求商品详情数据
    async getShopInfo() {
      let list = await this.$http.get({
        url: "/shop/info",
        token: this.$utils.encrypt({
          id: this.shopid
        })
      });

      this.attachimg = JSON.parse(list.data[0].commodity_attachimg)
      this.infoList = list.data[0];
      this.infoMain = JSON.parse(this.infoList.commodity_main);
    }
  },
  components: {
    swiper: SwiperComponent
  }
};
</script>

<style scoped>
@import url("../../assets/css/info.css");
.cartActive {
  background: #ff6700 !important;
  color: #fff !important;
}
.noActive {
  background: #8d8d8d !important;
  color: #616060 !important;
}
.content {
  padding: 0 !important;
}
</style>

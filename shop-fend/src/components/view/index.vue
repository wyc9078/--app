<template>
  <div class="index">
    <!-- 轮播图 -->
    <swiper :imglist="swiperList"></swiper>
    <!-- 分类 -->
    <yd-grids-group :rows="3" >
        <yd-grids-item v-for="n in classList" :key="n.id" @click.native="enterInfo(n.title)">
          <img slot="icon" :src="n.url">
          <span slot="text">{{n.title}}</span>
        </yd-grids-item>
    </yd-grids-group>

    <!-- 广告 -->
    <div class="row_shop">
      <img src="../../../static/img/ad_1.jpg" alt="">
    </div>

    <!-- 商品列表 -->
    <yd-list theme="3">
        <yd-list-item v-for="item in shopList" :key="item.id" @click.native="EnterInfo(item.id)">
            <img slot="img" :src="item.commodity_thumbnail">
            <span slot="title">{{item.commodity_name}}</span>
            <yd-list-other slot="other">
                <div>
                    <span class="demo-list-price"><em>¥</em>{{item.commodity_nowprice}}</span>
                    <span class="demo-list-del-price">¥{{item.commodity_oldprice}}</span>
                </div>
                <div>销量：{{item.commodity_sales}}</div>
            </yd-list-other>
        </yd-list-item>
    </yd-list>

    <!-- 分类的弹窗 -->
    <yd-popup v-model="showClass" position="left" width="100%">
      <yd-navbar :title="'分类 '+NavBarClassTitle" fixed>
          <router-link to="" @click.native="showClass = false" slot="left">
              <yd-navbar-back-icon></yd-navbar-back-icon>
          </router-link>

      </yd-navbar>
      <br><br><br>
       <yd-list theme="1">
        <yd-list-item v-for="n in classShopList" :key="n.id" @click.native="EnterInfo(n.id)">
            <img slot="img" :src="n.commodity_thumbnail">
            <span slot="title">{{n.commodity_name}}</span>
            <yd-list-other slot="other">
                <div>
                    <span class="demo-list-price"><em>¥</em>{{n.commodity_nowprice}}</span>
                    <span class="demo-list-del-price">¥{{n.commodity_oldprice}}</span>
                </div>
                <div>销量:{{n.commodity_sales}}</div>
            </yd-list-other>
        </yd-list-item>
      </yd-list>
    </yd-popup>

    <!-- 回到顶部 -->
    <yd-backtop></yd-backtop>

  </div>
</template>

<script>
import SwiperComponent from "../public/swiper";
export default {
  created() {
    this.getHomeData();
  },
  data() {
    return {
      showClass: false,
      swiperList: [
        {
          id: "1",
          href: "",
          url: "../../../static/img/banner_1.jpg"
        },
        {
          id: "2",
          href: "",
          url: "../../../static/img/banner_2.jpg"
        },
        {
          id: "3",
          href: "",
          url: "../../../static/img/banner_3.jpg"
        }
      ],
      classList: this.$config.pageConfig.index.classList,
      shopList: [],
      classShopList: [],
      NavBarClassTitle: null
    };
  },
  methods: {
    // 进入详情
    EnterInfo(ids) {
      this.$router.push({ name: "info", params: { id: ids } });
    },
    // 获取首页数据
    async getHomeData() {
      let list = await this.$http.get({
        url: "/shop/index",
        token: this.$utils.encrypt({})
      });
      this.shopList = list.data;
    },
    // 获取分类数据
    async enterInfo(type) {
      let Class = await this.$http.get({
        url: "/shop/class",
        token: this.$utils.encrypt({
          brand: type
        })
      });

      this.classShopList = Class.data;
      this.NavBarClassTitle = type;
      this.showClass = true;
    }
  },
  components: {
    swiper: SwiperComponent
  }
};
</script>


<style scoped>
.index {
  padding: 1rem 0 1.3rem 0;
}
.row_shop img {
  width: 100%;
  height: 3rem;
}
</style>

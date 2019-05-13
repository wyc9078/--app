<template>
    <div class="me">
        

        <v-header :title="userInfo.user_nicname" :yue="userInfo.user_money"></v-header>

        <yd-grids-group :rows="2">
            <yd-grids-item v-for="(item,index) in OrserAction" :key="index" @click.native="checkOrderStatus(index)">
                <img slot="icon" :src="item.img">
                <span slot="text">{{item.title}}</span>
            </yd-grids-item>
        </yd-grids-group>
        <br>
       <yd-accordion>
            <yd-accordion-item title="我的客服">
                <div style="padding: .24rem;">
                    <p>
                      在使用过程中有任何问题可以联系我们，为您提供7x24x365的专项服务。<br/> 
                      电话: <a href="tel:15155145354">15155145354</a>
                    </p>
                </div>
            </yd-accordion-item>
            <yd-accordion-item title="帮助中心">
                <div style="padding: .24rem;">
                    <h3>1: 下单后如何查找订单记录？</h3>
                    <p>在我的页面，待付款，已完成中查看</p>
                    <h3>2: 商品有降价活动吗</h3>
                    <p>抱歉，官方直营店，没有降价哦，如果有会短信通知您。</p>
                    
                </div>
            </yd-accordion-item>
            <yd-accordion-item title="关于我们">
                <div style="padding: .24rem;">
                    <p><em>心机购</em>是一款提供各大品牌手机直营的线上app，售后有保障，质量可靠。</p>
                </div>
            </yd-accordion-item>
        </yd-accordion>

        <yd-button-group>
           <yd-button @click.native="logout" size="large" type="primary" bgcolor="#f37d0f" color="#fff" shape="circle">退出登录</yd-button>
        </yd-button-group>

        <yd-popup v-model="showProp" position="left" width="100%">
              <yd-navbar title="查看订单">
                  <router-link to="" slot="left" @click.native="showProp = false">
                      <yd-navbar-back-icon></yd-navbar-back-icon>
                  </router-link>
              </yd-navbar>

  
              <yd-list theme="4">
                <yd-list-item v-for="(item, index) in list" :key="index">
                    <img slot="img" :src="item.commodity_thumbnail">
                    <span slot="title">{{item.commodity_name}}</span>
                    <yd-list-other slot="other">
                        <div>
                            <span class="demo-list-price"><em>总价: </em>{{item.order_total}}</span>
                            <br>
                            <span class="demo-list-del-price">购买数量: {{item.order_size}}</span>
                            <br>
                            <span class="demo-list-del-price">订单编号: {{item.order_number}}</span>
                        </div>
                    </yd-list-other>
                </yd-list-item>
              </yd-list>

          

        </yd-popup>
    </div>
</template>

<script>
import UserHeader from "./../public/user-header";
export default {
  mounted() {},
  data() {
    return {
      userInfo: JSON.parse(localStorage.getItem("u")),
      showProp: false,
      list: [],
      OrserAction: [
        {
          title: "待付款",
          img: "../../../static/img/pay.png"
        },
        {
          title: "已完成",
          img: "../../../static/img/setting.png"
        }
      ]
    };
  },
  methods: {
    logout() {
      localStorage.removeItem("u");
      this.$router.push({ name: "index" });
    },
    async checkOrderStatus(status) {
      let OrderStatus = await this.$http.post({
        url: "/order/checkOrder",
        token: this.$utils.encrypt({
          userid: this.$utils.GetLocalstorage("u").id,
          status: status
        })
      });
      this.list = OrderStatus.data;
      this.showProp = true;
    }
  },
  beforeRouteEnter(to, from, next) {
    next(vm => {
      vm.$parent.$data.showNavBar = false;
    });
  },
  components: {
    "v-header": UserHeader
  }
};
</script>

<style scoped>
@import url("../../assets/css/me.css");
.index {
  padding: 0 0 1.3rem 0;
}
</style>
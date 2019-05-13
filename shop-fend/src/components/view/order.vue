<template>
    <div class="order">
        <yd-navbar title="确认订单" fixed>
            <router-link to="" slot="left" @click.native="$router.back()">
                <yd-navbar-back-icon></yd-navbar-back-icon>
            </router-link>
        </yd-navbar>

        <div class="order-address flex-layout" @click="OpenAddress">
            <p>添加收货地址</p>
            <yd-navbar-next-icon></yd-navbar-next-icon>
        </div>


        <yd-list theme="4">
            <yd-list-item v-for="(item,index) in orderList" :key="index">
                <img slot="img" :src="item.commodity_thumbnail">
                <span slot="title">{{item.commodity_name}}</span>
                <yd-list-other slot="other">
                    <div>
                        <span class="demo-list-price"><em>¥</em>{{item.commodity_nowprice}}</span>
                    </div>
                </yd-list-other>
            </yd-list-item>
        </yd-list>

        <div class="pay-list flex-layout" @click="isShowProp = true">
            <img src="../../../static/img/yue.png" alt="余额">
            <p>账户余额</p>
            <yd-switch v-model="defaults" disabled></yd-switch>
        </div>

        <div class="pay-list flex-layout" @click="isShowProp = true">
            <img class="alipay" src="../../../static/img/alipay.png" alt="支付宝">
            <p>支付宝</p>
            <span>维护</span>
        </div>

        <div class="pay-list flex-layout" @click="isShowProp = true">
            <img class="wxpay" src="../../../static/img/wxpay.png" alt="支付宝">
            <p>微信支付</p>
            <span>维护</span>
        </div>


        <div class="order-footer">
            <div class="footer-left">
                共 {{orderList.length}} 件 合计: {{totalPrice}}
            </div>
            <div class="footer-right" @click="total ?  showWxPay = !showWxPay : '' ">
                去付款
            </div>
        </div>



        <yd-popup v-model="isShowProp" position="left" width="100%">
             <yd-navbar title="添加收货地址">
                <router-link to="" slot="left" @click.native="isShowProp = false">
                    <yd-navbar-back-icon></yd-navbar-back-icon>
                </router-link>
            </yd-navbar>


            <yd-cell-group v-if="ShowEdit">
                <yd-cell-item>
                    <span slot="left">收货人：</span>
                    <yd-input slot="right" required v-model="username" min="2" max="10" placeholder="真实姓名"></yd-input>
                </yd-cell-item>
                <yd-cell-item>
                    <span slot="left">手机号：</span>
                    <yd-input slot="right" required v-model="userphone" regex="mobile" placeholder="手机号"></yd-input>
                </yd-cell-item>
                <yd-cell-item arrow>
                    <span slot="left">所在地区：</span>
                    <input slot="right" type="text" @click.stop="show1 = true" v-model="model1" readonly placeholder="请选择收货地址">
                </yd-cell-item>
                <yd-cityselect v-model="show1" :callback="result1" :items="district"></yd-cityselect>

                <yd-cell-item>
                    <yd-textarea ref="address"  slot="right" placeholder="详细地址" maxlength="100"></yd-textarea>
                </yd-cell-item>

                <yd-button-group>
                   <yd-button size="large" type="danger" shape="circle" @click.native="SubmitAddress()">提交信息</yd-button>
                </yd-button-group>

            </yd-cell-group>

            <yd-cell-group v-else>
                <yd-cell-item v-for="(item,index) in carAdd" :key="index">
                    <span slot="left">{{item.username}}</span>
                    <span slot="right">{{item.userphone}}</span>
                </yd-cell-item>
            </yd-cell-group>


        </yd-popup>



        <v-wxpay :wxxxpay="showWxPay" :MoneyTotals="totalPrice" @change="changShowWxPay"></v-wxpay>
    </div>
</template>

<script>
import District from "ydui-district/dist/jd_province_city_area_id";
import wxpay from "../public/wxpay";
export default {
  mounted() {
    if (localStorage.getItem("data") == null) {
      this.$router.push({ name: "index" });
    }
  },
  data() {
    return {
      isShowProp: false,
      ShowEdit: true,
      defaults: true,
      username: null,
      userphone: null,
      show1: false,
      model1: "",
      district: District,
      orderList: this.$utils.GetLocalstorage("data"),
      showWxPay: false,
      carAdd:
        this.$utils.GetLocalstorage("add") == false
          ? ""
          : this.$utils.GetLocalstorage("add")
    };
  },
  methods: {
    // 改变状态
    changShowWxPay(val) {
      this.showWxPay = val;
    },
    // 打开收货地址弹窗
    OpenAddress() {
      this.isShowProp = true;
      localStorage.getItem("add") == null
        ? (this.ShowEdit = true)
        : (this.ShowEdit = false);
    },
    // 提交本地保存地址
    async SubmitAddress() {
      let UserArray = [];
      UserArray.push({
        username: this.username,
        userphone: this.userphone,
        address: this.model1,
        infoAddress: this.$refs.address.mlstr
      });

      this.$utils.SetLocalstorage("add", UserArray);
      this.carAdd = UserArray;
      this.ShowEdit = false;

      let addressSave = await this.$http.post({
        url: "/user/setAddress",
        token: this.$utils.encrypt({
          truename: this.username,
          address: this.model1 + this.$refs.address.mlstr,
          uid: this.$utils.GetLocalstorage("u").id
        })
      });

      console.log(addressSave);
    },
    // 获取城市地址
    result1(ret) {
      this.model1 = ret.itemName1 + " " + ret.itemName2 + " " + ret.itemName3;
    }
  },
  beforeRouteEnter(to, from, next) {
    next(vm => {
      vm.$parent.$data.showFooter = false;
      vm.$parent.$data.showNavBar = false;
    });
  },
  computed: {
    // 计算总价
    totalPrice() {
      let total = 0;
      for (const key in this.orderList) {
        total +=
          this.orderList[key].cart_nums *
          this.orderList[key].commodity_nowprice;
      }
      return total;
    },
    total() {
      let info = this.$utils.GetLocalstorage("u");
      if (this.totalPrice > info.user_money) {
        this.$dialog.toast({
          mes: "余额不足",
          timeout: 1500
        });
        return false;
      } else {
        return true;
      }
    }
  },
  components: {
    "v-wxpay": wxpay
  }
};
</script>

<style scoped>
@import url("../../assets/css/order.css");
.order {
  width: 100%;
  height: 100%;
}
</style>
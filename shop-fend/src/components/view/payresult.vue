<template>
    <div class="payResult">
         <yd-navbar title="支付结果">
            <router-link to="" slot="left"  @click.native="$router.back()">
                <yd-navbar-back-icon></yd-navbar-back-icon>
            </router-link>
          
        </yd-navbar>
        <yd-flexbox direction="vertical" align="center">
            <yd-flexbox-item>
                <img class="res-logo" src="../../../static/img/success.svg" alt="">
            </yd-flexbox-item>
            <yd-flexbox-item>
                <yd-preview :buttons="btns">
                    <yd-preview-header>
                        <div slot="left">付款金额</div>
                        <div slot="right">¥{{moneyTotal}}</div>
                    </yd-preview-header>

                    <yd-preview-item>
                        <div slot="left">订单编号</div>
                        <div slot="right">{{orderNumbers}}</div>
                    </yd-preview-item>
                </yd-preview>
            </yd-flexbox-item>
        </yd-flexbox>
    </div>
</template>

<script>
export default {
  created() {
    if (localStorage.getItem("data") == null) {
      this.$router.push({ name: "index" });
    } else {
      this.setOrder();
    }
  },
  beforeRouteEnter(to, from, next) {
    next(vm => {
      vm.$parent.$data.showFooter = false;
      vm.$parent.$data.showNavBar = false;
    });
  },
  data() {
    return {
      moneyTotal: null,
      orderNumbers: null,
      btns: [
        {
          text: "查看订单",
          click: () => {
            this.$router.push({ name: "me" });
          }
        },
        {
          color: "#F00",
          text: "跳转首页",
          click: () => {
            this.$router.push({ name: "index" });
          }
        }
      ]
    };
  },
  methods: {
    async setOrder() {
      let datas = this.$utils.GetLocalstorage("data"),
        Orderlist = [],
        totals = 0;
      for (const key in datas) {
        totals +=
          parseInt(datas[key].cart_nums) *
          parseInt(datas[key].commodity_nowprice);

        Orderlist.push({
          uid: this.$utils.GetLocalstorage("u").id,
          sid: datas[key].id,
          total: datas[key].cart_nums * datas[key].commodity_nowprice,
          size: datas[key].cart_nums
        });
      }

      let order = await this.$http.post({
        url: "/order/addOrder",
        token: this.$utils.encrypt({
          order: JSON.stringify(Orderlist),
          orderTotal: totals,
          money: this.$utils.GetLocalstorage("u").user_money
        })
      });

      this.moneyTotal = totals;

      this.orderNumbers = order.data[0].orderNumber;

      localStorage.removeItem("data");

      this.UpdateMoney(totals);
    },

    UpdateMoney(totals) {
      let info = this.$utils.GetLocalstorage("u");
      info.user_money -= totals;
      this.$utils.SetLocalstorage("u", info);
    }
  }
};
</script>

<style scoped>
.res-logo {
  width: 100px;
  margin-top: 1rem;
  margin-bottom: 1rem;
}
</style>
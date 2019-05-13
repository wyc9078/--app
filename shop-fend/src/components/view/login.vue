<template>
    <div class="login">
         <v-header :title="'登录'"></v-header>

         <yd-cell-group>
            <yd-cell-item>
                <yd-input slot="right" required type="number" ref="userPhone" v-model="userName" regex="mobile" placeholder="手机号"></yd-input>
            </yd-cell-item>
            <yd-cell-item>
                <yd-input slot="right" required type="password" ref="userPwd" min="6" max="20" v-model="userPwd" placeholder="密码"></yd-input>
            </yd-cell-item>
 
          </yd-cell-group>
          <yd-button-group>
            <yd-button size="large" type="primary" bgcolor="#f37d0f" color="#fff" shape="circle" @click.native="clickHander">登录</yd-button>
          </yd-button-group>
          <div class="reg-tips">
           <a class="index" href="#/">首页</a>
           <a class="action" href="#/reg">注册</a>
          </div>
    </div>
</template>

<script>
import UserHeader from "./../public/user-header";
export default {
  data() {
    return {
      userName: null,
      userPwd: null
    };
  },
  beforeRouteEnter(to, from, next) {
    next(vm => {
      vm.$parent.$data.showFooter = false;
      vm.$parent.$data.showNavBar = false;
    });
  },
  methods: {
    async clickHander() {
      //console.log(this.$refs.userPhone.valid);
      if (this.$refs.userPwd.valid && this.$refs.userPhone.valid) {
        let list = await this.$http.post({
          url: "/user/login",
          token: this.$utils.encrypt({
            phone: this.userName,
            pwd: this.userPwd
          })
        });

        if (list.status == 404) {
          this.$dialog.toast({
            mes: "账户密码有误",
            timeout: 1500
          });
        } else {
          console.log();
          this.$dialog.toast({
            mes: "登录成功",
            timeout: 1500,
            icon: "success",
            callback: () => {
              localStorage.setItem("u", JSON.stringify(list.data[0]));
              this.$router.replace({ name: "index" });
            }
          });
        }
      }
    }
  },
  components: {
    "v-header": UserHeader
  }
};
</script>

<style scoped>
.reg-tips {
  position: fixed;
  bottom: 0;
  left: 0;
  width: 100%;
  height: 21px;
  color: #919191;
  letter-spacing: 2px;
  padding: 0 12px;
  font-size: 12px;
  cursor: default;
}
.action {
  float: right;
}
.index {
  float: left;
}
</style>
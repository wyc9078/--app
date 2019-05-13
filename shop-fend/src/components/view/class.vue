<template>
    <div class="class">
        <yd-scrolltab :callback="getKey">
                <yd-scrolltab-panel label="小米" icon="demo-icons-category1">
                    <div style="height: 350px;background-color: gray;"></div>
                </yd-scrolltab-panel>

                <yd-scrolltab-panel label="华为" icon="demo-icons-category2" active>
                    <div style="height: 350px;background-color: blue;"></div>
                </yd-scrolltab-panel>

                <yd-scrolltab-panel label="一加" icon="demo-icons-category3">
                    <div style="height: 350px;background-color: yellow;"></div>
                </yd-scrolltab-panel>

                <yd-scrolltab-panel label="三星" icon="demo-icons-category3">
                    <div style="height: 350px;background-color: yellow;"></div>
                </yd-scrolltab-panel>

                <yd-scrolltab-panel label="锤子" icon="demo-icons-category3">
                    <div style="height: 350px;background-color: yellow;"></div>
                </yd-scrolltab-panel>

            </yd-scrolltab>
    </div>
</template>

<script>
export default {
  methods: {
    getKey(index) {
      console.log(index);
    }
  }
};
</script>

<style scoped>
</style>
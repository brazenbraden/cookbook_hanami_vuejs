<template>
  <div :key="cookbook.id" v-for="cookbook in cookbooks">
    <CookbookItem :cookbook="cookbook" />
  </div>
</template>

<script>
import CookbookItem from "./CookbookItem.vue";

export default {
  name: "CookbookList",
  props: {
    cookbooks: Array,
  },
  components: {
    CookbookItem,
  },
};
</script>

<style scoped>
div {
  background: #eee;
  border: 1px solid #777;
  margin: 20px;
  padding: 30px;
}
div:hover {
  color: red;
  cursor: pointer;
}
</style>

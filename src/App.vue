<template>
  <h1>My Cookbooks!</h1>
  <CookbookList :cookbooks="cookbooks" />
</template>

<script>
import CookbookList from "./components/CookbookList.vue";

export default {
  name: "App",
  components: {
    CookbookList,
  },
  data() {
    return {
      cookbooks: [],
    };
  },
  async created() {
    this.cookbooks = await this.getCookbooks();
  },
  methods: {
    async getCookbooks() {
      const res = await fetch("http://localhost:2300/");
      const data = await res.json();
      return data;
    },
  },
};
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  width: 700px;
  margin: 20px auto;
}
</style>

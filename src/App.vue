<template>
  <h1>My Cookbooks!</h1>
  <AddCookbookForm @add-cookbook="addCookbook" />
  <CookbookList :cookbooks="cookbooks" @delete-cookbook="deleteCookbook" />
</template>

<script>
import CookbookList from "./components/CookbookList.vue";
import AddCookbookForm from "./components/AddCookbookForm.vue";

export default {
  name: "App",
  components: {
    CookbookList,
    AddCookbookForm,
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
      const res = await fetch("api/");
      const data = await res.json();
      return data;
    },
    async addCookbook(data) {
      const req = await fetch("api/cookbooks", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify(data),
      });

      const res = await req.json();

      this.cookbooks = [...this.cookbooks, res];
    },
    async deleteCookbook(id) {
      const req = await fetch(`api/cookbooks/${id}`, {
        method: "DELETE",
      });

      if (req.status == 200) {
        this.cookbooks = this.cookbooks.filter(
          (cookbook) => cookbook.id !== id
        );
      }
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

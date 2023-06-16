<template>
  <h1>Recipes</h1>
  <RecipeList :recipes="recipes" />
</template>

<script>
import RecipeList from "@/components/recipe/RecipeList.vue";

export default {
  name: "RecipeView",
  components: {
    RecipeList,
  },
  data() {
    return {
      recipes: [],
    };
  },
  async created() {
    this.recipes = await this.getRecipes();
  },
  methods: {
    async getRecipes() {
      const req = await fetch("api/recipes");
      return await req.json();
    },
  },
};
</script>

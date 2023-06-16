<template>
  <h1>Ingredients</h1>
  <IngredientList :ingredients="ingredients" />
</template>

<script>
import IngredientList from "@/components/ingredients/IngredientList.vue";

export default {
  name: "IngredientsView",
  components: { IngredientList },
  data() {
    return {
      ingredients: [],
    };
  },
  async created() {
    this.ingredients = await this.getIngredients();
  },
  methods: {
    async getIngredients() {
      const req = await fetch("api/ingredients");
      return await req.json();
    },
  },
};
</script>

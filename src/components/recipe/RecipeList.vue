<template>
  <div :key="recipe.id" v-for="recipe in recipes">
    <h2>{{ recipe.name }}</h2>
  </div>
</template>

<script>
export default {
  name: "RecipeList",
  props: {
    recipes: Array,
  },
};
</script>

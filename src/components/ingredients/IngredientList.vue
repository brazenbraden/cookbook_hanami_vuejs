<template>
  <div :key="ingredient.id" v-for="ingredient in ingredients">
    <h2>{{ ingredient.name }}</h2>
  </div>
</template>

<script>
export default {
  name: "IngredientList",
  props: {
    ingredients: Array,
  },
};
</script>

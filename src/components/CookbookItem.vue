<template>
  <h2>{{ cookbook.name }}</h2>
</template>

<script>
export default {
  name: "CookbookItem",
  props: {
    cookbook: Object,
  },
};
</script>

<style scoped>
h2 {
  font-style: italic;
}
</style>

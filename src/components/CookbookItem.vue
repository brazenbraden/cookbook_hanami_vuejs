<template>
  <h2>{{ cookbook.name }}</h2>
  <CustomButton title="Delete" @click="deleteCookbook" />
</template>

<script>
import CustomButton from "./CustomButton.vue";

export default {
  name: "CookbookItem",
  props: {
    cookbook: Object,
  },
  components: { CustomButton },
  methods: {
    deleteCookbook() {
      this.$emit("delete-cookbook", this.cookbook.id);
    },
  },
};
</script>

<style scoped>
h2 {
  font-style: italic;
}
</style>

<template>
  <div>
    <button @click="onClick()">{{ title }}</button>
  </div>
</template>

<script>
export default {
  name: "CustomButton",
  props: {
    title: String,
    color: String,
  },
  methods: {
    onClick() {
      this.$emit("btn-click");
    },
  },
};
</script>

<style scoped>
div {
  background-color: color;
}
</style>

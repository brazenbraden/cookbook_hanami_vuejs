<template>
  <CustomButton
    :title="showCookbookForm ? 'Close form' : 'Add Cookbook'"
    @btn-click="toggleAddCookbook()"
  />
  <div v-show="showCookbookForm">
    <form class="add-cookbook-form" @submit="onSubmit">
      <div class="form-control">
        <label for="name">Cookbook Name</label>
        <input
          type="text"
          name="name"
          placeholder="My Cookbook"
          v-model="name"
        />
      </div>
      <input type="submit" value="Create Cookbook" />
    </form>
  </div>
</template>

<script>
import CustomButton from "./CustomButton.vue";

export default {
  name: "AddCookbook",
  components: {
    CustomButton,
  },
  data() {
    return {
      name: "",
      showCookbookForm: false,
    };
  },
  methods: {
    toggleAddCookbook() {
      this.showCookbookForm = !this.showCookbookForm;
    },
    onSubmit(e) {
      e.preventDefault();

      if (!this.name) {
        alert("Please enter a cookbook name");
        return;
      }

      const newCookbookData = {
        cookbook: {
          name: this.name,
        },
      };

      this.$emit("add-cookbook", newCookbookData);

      this.name = "";
    },
  },
};
</script>

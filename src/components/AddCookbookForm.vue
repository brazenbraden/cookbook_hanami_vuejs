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

<style>
form {
  margin-top: 30px;
  padding: 20px 0;
  background-color: #eee;
  border: 1px solid #ccc;
  display: inline-block;
}
.form-control {
  margin: 10px;
  display: inline-flex;
}
label {
  text-align: left;
  margin-right: 20px;
  display: inline-block;
  width: 100%;
  padding: 5px;
}
input[type="text"] {
  padding: 5px;
  width: 100%;
}
input[type="submit"] {
  display: block;
  width: -webkit-fill-available;
  margin: 0 10px;
  padding: 10px;
}
</style>

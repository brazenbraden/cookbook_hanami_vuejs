import { createRouter, createWebHistory } from "vue-router";
import CookbooksView from "../views/CookbooksView.vue";
import RecipesView from "../views/RecipesView.vue";
import IngredientsView from "../views/IngredientsView.vue";

const routes = [
  {
    path: "/",
    name: "cookbooks",
    component: CookbooksView,
  },
  {
    path: "/recipes",
    name: "recipes",
    component: RecipesView,
  },
  {
    path: "/ingredients",
    name: "ingredients",
    component: IngredientsView,
  },
];

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
});

export default router;

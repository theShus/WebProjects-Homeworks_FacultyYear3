<template>
	<div>
		<b-navbar toggleable="lg" type="dark" variant="primary">
			<b-navbar-brand>RafNews</b-navbar-brand>

			<b-navbar-toggle target="nav-collapse"></b-navbar-toggle>

			<b-collapse id="nav-collapse" is-nav>
				<b-navbar-nav>
					<router-link :to="{name: 'HomeView'}" tag="a" class="nav-link" :class="{active: this.$router.currentRoute.name === 'HomeView'}">Articles</router-link>
					<router-link :to="{name: 'MostRead'}" tag="a" class="nav-link" :class="{active: this.$router.currentRoute.name === 'MostRead'}">Most Read Monthly</router-link>

				</b-navbar-nav>

				<b-navbar-nav class="ml-auto">
					<li class="nav-item">
						<form>
							<input type="text" v-model="searchText" placeholder="Search.." name="search">
							<button type="submit" @click = "search" >Submit</button>
						</form>
					</li>
					<li class="nav-item">
						<router-link :to="{name: 'SignInView'}" tag="a" class="nav-link" :class="{active: this.$router.currentRoute.name === 'SingInView'}">Sign in</router-link>
					</li>

				</b-navbar-nav>
			</b-collapse>
		</b-navbar>
	</div>
</template>

<script>
import router from "@/router";

export default {
	name: "NavbarCompPublic",
	data() {
		return {
			categories: [],
			searchText: "",
		}
	},

	methods: {
		reload(){
			window.location.reload()
		},
		search(){
			if (localStorage.getItem("searchCash") !== this.searchText){
				router.push('/search/' + this.searchText)
			}
			localStorage.setItem("searchCash",this.searchText)
		}
	},

	mounted() {
		this.$axios.get('/api/categories')
			.then(response => {
				this.categories = response.data;
			});
	}

}
</script>

<style scoped>

</style>
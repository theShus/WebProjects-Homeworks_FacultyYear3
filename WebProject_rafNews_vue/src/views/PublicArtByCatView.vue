<template>
	<div class="mt-5">
		<b-card class="mt-3" :title="article.title" :sub-title="new Date(article.date).toLocaleDateString('en-GB')" v-for="article in articles" :key="article.id">
			<b-card-text>
				{{article.content | shorten}}
			</b-card-text>

		</b-card>
	</div>
</template>

<script>

export default {
	name: 'PublicArtByCatView',
	components: {
	},

	data(){
		return {
			user: JSON.parse(atob(localStorage.getItem('jwt').split('.')[1])),
			users: [],
			articles: [],
			categories: []
		}
	},

	filters: {
		shorten(text){
			return text.substring(0, 20) + '...';
		}
	},

	mounted() {
		this.$axios.get(`/api/articles/category/${this.$route.params.id}`)
			.then(response => {
				this.articles = response.data
			})

		this.$axios.get('/api/users')
			.then(response => {
				this.users = response.data
			})
	}
}
</script>
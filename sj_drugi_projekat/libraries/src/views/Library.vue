<template>
  <div>
       <LibraryList />
  </div>

</template>

<script>
  import LibraryList from '@/components/LibraryList.vue';
  import { mapActions, mapState } from 'vuex';

  export default {
    name: "Library",

    components: {
      LibraryList
    },

    data() {
        return {
        }
    },


    mounted() {
      this.fetchLibraries();
      // console.log(this.faculties)
    },

    computed: {
    },

    methods: {
      ...mapActions([
          'fetchLibraries'
      ])
    }


  }
</script>


<style scoped>


</style>
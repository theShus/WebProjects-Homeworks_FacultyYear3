<template>
  <div>
       <FacultyList />
  </div>

</template>

<script>
  import FacultyList from '@/components/FacultyList.vue';
  import { mapActions, mapState } from 'vuex';

  export default {
    name: "Faculty",

    components: {
      FacultyList
    },

    data() {
        return {
        }
    },


    mounted() {
      this.fetchFacutlies();
      // console.log(this.faculties)
    },

    computed: {
      // ...mapState([
      //   'faculties'
      // ])
    },

    methods: {
      ...mapActions([
          'fetchFacutlies'
      ])
    }


  }
</script>


<style scoped>


</style>
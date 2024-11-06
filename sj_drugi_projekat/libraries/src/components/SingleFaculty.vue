<template>
  <div class="d-flex justify-content-center">
    <div class="row text-center">
      <b-card
          :title="faculty.name"
          :img-src= 'getUrl()'
          img-alt="Image"
          img-top
          tag="article"
          style="max-width: 300rem;"
          class="mb-2"
      >
        <h4>{{faculty.dean}}</h4>
        <b-card-text>
          <p id="year">Accredited: {{faculty.accredited}}</p>
          <p>street: {{faculty.street}}</p>
          <p>School start: {{faculty.startDate}}</p>
        </b-card-text>
      </b-card>
    </div>
  </div>

</template>

<script>
export default {
  name: "SingleFaculty",


  props: {
    faculty: Object
  },
  methods: {
    getUrl(){
      return `https://picsum.photos/600/300/?image=${this.faculty.id * 10}`
    }
  }

}

</script>

<style scoped>

</style>
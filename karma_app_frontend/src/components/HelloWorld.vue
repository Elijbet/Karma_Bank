<template>
  <div class="container">
    <h1>KARMA <br/> BANK</h1>
    <h2>PUT A TOKEN IN A BANK ON A GOOD DAY, TO HAVE A REMINDER ON A BAD DAY.</h2>
    <div class="flex-row">
      <button>DEPOSIT</button>
      <button id="show-modal" @click="showModal = true">WITHDRAW</button>
      <!-- use the modal component, pass in the prop -->
      <withdraw-modal v-if="showModal" @close="showModal = false">
        <p> {{ randomKarma() }} </p>
        <p> {{ randomKarmaDate() }} </p>
      </withdraw-modal>
    </div>

  </div>
</template>

<script>
  import WithdrawModal from './WithdrawModal.vue'
  import axios from 'axios'

  export default {

    created() {
      axios.get('http://localhost:3000/karmas') 
        .then(response => {
        this.karmas = response.data
      })
        .catch(e => {
        this.error.push(e)
      })
    },
    data() {
      return {
        showModal: false,
        karmas: [],
        karmaObject: {}
      }
    },
    methods: {
      randomKarma() {
        let length = this.karmas.length
        this.karmaObject = this.karmas[Math.floor(Math.random()*length)];
        let karma = this.karmaObject.entry
        return karma
      },
      randomKarmaDate() {
        let date = this.karmaObject.date
        var event = new Date(date);
        return event.toDateString()
      }
    },
    components: {
      WithdrawModal,
    }
  }
</script>

<style>

p {
  font-family: 'Poiret One', cursive;
  font-size: 2rem;
}
h1 {
  margin-top: 0 !important;
  margin-bottom: 0 !important;
  font-family: 'Monoton', cursive;
  font-weight: normal;
  color: #C84072;
  font-size: 7rem;
}
h2 {
  font-family: "Open Sans", Helvetica;
  color: #C84072;
}
.container {
  /*background-color: #C3EDE3;*/
  width: 70%;
  height: 500px;
  margin: auto;
  display: flex;
  flex-direction: column;
  align-items: center;
}
body {
  background-color:#C7EDE0;
  background-image: radial-gradient(#fff 10%, transparent 10%),
  radial-gradient(#fff 10%, transparent 10%);
  background-size: 30px 30px;
  background-position: 0 0, 15px 15px;
}
.flex-row {
  display: flex;
  flex-direction: row;
}
/* Reset */
button {
  background: transparent;
  border: 0;
  padding: 0;
  cursor: pointer;
  outline: 0;
  -webkit-appearance: none;
}
button:first-child {
  margin-right: 100px;
}
/* Custom */
button {
  display: inline-block;
  position: relative;
  padding: 30px 48px;
  top: 0;
  font-size: 30px;
  font-family: "Open Sans", Helvetica;
  border-radius: 8px;
  border-bottom: 1px solid rgba( 28, 227, 125, 0.5 );
  border: 5px solid rgba(247, 247, 247, .5);

  background: #DBA3B0;
  color: #fff;
  /*box-shadow: 0px 0px 0px rgba( 15, 165, 60, 0.1 );*/
  box-shadow: 0 0 5px rgba(0, 0, 0, 0.12), inset 0 0 2px rgba(0, 0, 0, 0.19);
  -webkit-transform: translateZ(0);
     -moz-transform: translateZ(0);
      -ms-transform: translateZ(0);
          transform: translateZ(0);
  
  -webkit-transition: all 0.2s ease;
     -moz-transition: all 0.2s ease;
      -ms-transition: all 0.2s ease;
          transition: all 0.2s ease;
}

button:hover {
  top: -10px;
  box-shadow: 0px 10px 10px rgba( 15, 165, 60, 0.2 );
  
  -webkit-transform: rotateX(20deg);
     -moz-transform: rotateX(20deg);
      -ms-transform: rotateX(20deg);
          transform: rotateX(20deg);
}

button:active {
  top: 0px;
  box-shadow: 0px 0px 0px rgba( 15, 165, 60, 0.0 );
  background: rgba( 20, 224, 133, 1 );
}

</style>


<template>
  <div class="container">
    <div class="header">
      <h1>KARMA</h1><h1 class="anton">BANK</h1>
      <h2>PUT A TOKEN IN A BANK <br> ON A GOOD DAY, <br> TO HAVE A REMINDER <br> ON A BAD DAY.</h2> 
    </div>
    
    <div class="flex-row">
      <button id="show-modal-deposit" @click="showModalDeposit = true">DEPOSIT</button>
      <button id="show-modal-withdraw" @click="showModalWithdraw = true">WITHDRAW</button>
      <!-- use the modal component, pass in the prop -->
      <withdraw-modal v-if="showModalWithdraw" @close="showModalWithdraw = false">
        <p> {{ randomKarma() }} </p>
        <p> {{ randomKarmaDate() }} </p>
      </withdraw-modal>
      <deposit-modal v-if="showModalDeposit" @close="closeDeposit">
        <textarea v-model="message" 
                  placeholder="It was a great day because ..."
                  @keyup.enter="submit">
        </textarea>
      </deposit-modal>
    </div>

  </div>
</template>

<script>
  import WithdrawModal from './WithdrawModal.vue'
  import DepositModal from './DepositModal.vue'
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
        showModalWithdraw: false,
        showModalDeposit: false,
        karmas: [],
        karmaObject: {},
        message: ''
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
      },
      submit(){
        if(this.message.length > 0){
          axios.post('http://localhost:3000/karmas', {
            entry: this.message,
            date: new Date()
          }) 
          .catch(e => {
            this.error.push(e)
          }) 
        }
        
      },
      closeDeposit() {
        this.showModalDeposit = false,
        this.submit()
        this.message = ''
      }
    },
    components: {
      WithdrawModal,
      DepositModal
    }
  }
</script>

<style>

.header {
  width: 100%;
  display: flex;
  flex-direction: row;
  /*align-items: flex-start;*/
  margin-left: 70%;
}
*:focus {
  outline: none;
}
textarea {
  display: inline-flex;
  border: 1px solid #C84072 !important;
  padding: 20px 30px;
  padding-bottom: 20px !important;
  background-color: #fff;
  border-radius: 20px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, .33);
  transition: all .3s ease;
  font-family: 'Amatic SC', cursive;
  font-weight: bold;
  font-size: 1.3rem;
  color: #C84072;
  max-width: 900px;
  max-height: 400px;
}
textarea::placeholder {
  font-size: 1.3rem;
  color: #C84072;
  font-family: 'Amatic SC', cursive;
  font-weight: bold;
}
p {
  font-family: 'Amatic SC', cursive;
  font-size: 2rem;
  color: rgba( 20, 224, 133, 1 );
  font-weight: bold;
}
h1 {
  margin-top: 0 !important;
  margin-bottom: 0 !important;
  font-family: 'Monoton', cursive;
  font-weight: normal;
  color: #C84072;
  font-size: 7rem;
}
.anton {
  font-family: 'Anton', sans-serif;
  font-size: 6.5rem;
  transform: translateY(10px);
}
h2 {
  margin-left: 20px;
  font-size: 1.5rem;
  font-family: 'Amatic SC', cursive;
  color: #C84072;
  transform: translateY(18px);
  text-align: left;
  line-height: 1;
}
.container {
  width: 100%;
  height: 500px;
  display: flex;
  flex-direction: column;
  align-items: center;
}
body {
/*  background-color:#C7EDE0;
  background-image: radial-gradient(#fff 10%, transparent 10%),
  radial-gradient(#fff 10%, transparent 10%);
  background-size: 30px 30px;
  background-position: 0 0, 15px 15px;*/
  background: url("../assets/1u.jpg");
  background-repeat: no-repeat;
  background-size: cover;
}
.flex-row {
  display: flex;
  flex-direction: row;
  margin-left: 60%;
  margin-top: 10%;
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
  margin-right: 60px;
}
/* Custom */
button {
  display: inline-block;
  position: relative;
  padding: 30px 48px;
  top: 0;
  font-size: 30px;
  font-family: 'Amatic SC', cursive;
  font-weight: bold;
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


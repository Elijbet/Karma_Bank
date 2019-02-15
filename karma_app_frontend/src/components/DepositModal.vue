<template id="modal-template">
	<transition name="modal">
    <div class="modal-mask">
      <div class="modal-wrapper">
        <div class="modal-container">

          <div class="modal-header">
            <slot name="header">
              <p>Did you enjoy yourself today? What was it that was fun or fulfilling?</p>
            </slot>
          </div>

        	<slot></slot>

          <div class="modal-footer">
            <slot name="footer">
              <button class="modal-default-button button-position" @click="$emit('close')">
                OK
              </button>
            </slot>
          </div>

        </div>
      </div>
    </div>
  </transition>
</template>

<style scoped>
button {
	padding: 1rem;
	font-size: 1rem;
}

p {
  color: #A4D5A6;
  font-weight: bold;
}

.button-position {
	transform: translate(250%, 80%);
  /*transform: translateY(-300px);*/
  /*transform: translateX(160px);*/
} 

.modal-mask {
  position: fixed;
  z-index: 9998;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, .5);
  display: table;
  transition: opacity .3s ease;
}

.modal-wrapper {
  display: table-cell;
  vertical-align: middle;
}

.modal-container {
	display: inline-flex;
  max-width: 1000px;
  max-height: 600px;
  flex-direction: column;
  margin: 15% auto;
  padding: 40px 40px;
  padding-bottom: 20px !important;
  background-color: #fff;
  border-radius: 20px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, .33);
  transition: all .3s ease;
  font-family: Helvetica, Arial, sans-serif;
}

.modal-header h3 {
  margin-top: 0;
  color: #42b983;
}

.modal-body {
  margin: 20px 0;
}

.modal-default-button {
  float: right;
}

/*
 * The following styles are auto-applied to elements with
 * transition="modal" when their visibility is toggled
 * by Vue.js.
 *
 * You can easily play with the modal transition by editing
 * these styles.
 */

.modal-enter {
  opacity: 0;
}

.modal-leave-active {
  opacity: 0;
}

.modal-enter .modal-container,
.modal-leave-active .modal-container {
  -webkit-transform: scale(1.1);
  transform: scale(1.1);
}

</style>
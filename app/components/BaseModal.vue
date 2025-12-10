<template>
  <Transition name="fade">
    <div v-if="show" class="modal-backdrop" @click.self="$emit('close')">
      <div class="modal-card" :style="{ maxWidth: width }">
        
        <div class="modal-header">
          <h3 class="modal-title">{{ title }}</h3>
          <button class="close-btn" @click="$emit('close')">&times;</button>
        </div>

        <div class="modal-body">
          <slot></slot>
        </div>

      </div>
    </div>
  </Transition>
</template>

<script setup>
import { onMounted, onUnmounted, watch } from 'vue'

const props = defineProps({
  show: { type: Boolean, default: false },
  title: { type: String, default: '' },
  width: { type: String, default: '600px' } // Bisa custom lebar
})

defineEmits(['close'])

// Prevent scroll pada body saat modal muncul
watch(() => props.show, (val) => {
  document.body.style.overflow = val ? 'hidden' : 'auto'
})
</script>

<style scoped>
.modal-backdrop {
  position: fixed;
  top: 0; left: 0;
  width: 100%; height: 100%;
  background-color: rgba(0, 0, 0, 0.5);
  display: flex;
  justify-content: center;
  align-items: center; /* Center Vertikal & Horizontal */
  z-index: 9999;
  padding: 1rem;
}

.modal-card {
  background: white;
  border-radius: 12px;
  box-shadow: 0 4px 20px rgba(0,0,0,0.2);
  width: 100%;
  max-height: 90vh;
  display: flex;
  flex-direction: column;
}

.modal-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 15px 20px;
  border-bottom: 1px solid #eee;
}

.modal-title { margin: 0; font-size: 1.25rem; }

.modal-body {
  padding: 20px;
  overflow-y: auto; /* Scroll hanya di body modal */
}

.close-btn {
  background: none; border: none;
  font-size: 1.8rem; cursor: pointer; color: #888;
  line-height: 1;
}
.close-btn:hover { color: #333; }

/* Animasi Fade & Scale */
.fade-enter-active, .fade-leave-active { transition: opacity 0.3s ease; }
.fade-enter-from, .fade-leave-to { opacity: 0; }
.fade-enter-active .modal-card, .fade-leave-active .modal-card { transition: transform 0.3s ease; }
.fade-enter-from .modal-card, .fade-leave-to .modal-card { transform: scale(0.95); }
</style>
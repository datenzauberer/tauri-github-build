<script lang="ts">
  import { onMount } from "svelte";
  import { invoke } from '@tauri-apps/api/core';
  import { getVersion } from '@tauri-apps/api/app';
  
  let appVersion = "";

  onMount(async () => {
    appVersion = await getVersion();
    tauriVersion = await getTauriVersion();
  });

  async function checkUpdate() {
    await invoke('plugin:updater|check');
  }
</script>

<main>
  <div>
    <label for="app-version">App version:</label>  
    <span id="app-version">{appVersion}</span>
  </div>
  <button on:click={checkUpdate}>Check for Updates</button>
</main>
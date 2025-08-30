<script lang="ts">
  import { onMount } from "svelte";
  import { getTauriVersion } from "@tauri-apps/api/app";
  import { invoke } from '@tauri-apps/api/core';

  let tauriVersion = "";

  onMount(async () => {
    tauriVersion = await getTauriVersion();
  });

  async function checkUpdate() {
    await invoke('plugin:updater|check');
  }
</script>

<main>
  <div>
    <label for="tauri-version">Tauri version:</label>
    <span id="tauri-version">{tauriVersion}</span>
  </div>
  <button on:click={checkUpdate}>Check for Updates</button>
</main>